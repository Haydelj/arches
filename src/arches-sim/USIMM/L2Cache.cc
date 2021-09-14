#include <fstream>

#include "L2Cache.h"
#include "L1Cache.h"
#include "MainMemory.h"
#include "SimpleRegisterFile.h"
#include "IssueUnit.h"
#include "ThreadState.h"
#include "WriteRequest.h"
#include "memory_controller.h"
#include <cassert>


extern pthread_mutex_t usimm_mutex[MAX_NUM_CHANNELS];
extern pthread_mutex_t memory_mutex;


L2Cache::L2Cache(MainMemory* _mem,
                 int   const _cache_size,
                 int   const _hit_latency,
                 bool  const _disable_usimm,
                 float const _area,
                 float const _energy,
                 int   const _num_banks,
                 int   const _line_size,
                 bool  const _memory_trace,
                 bool  const _l2_off,
                 bool  const l1_off) :
    cache_size(_cache_size),
    num_banks(_num_banks),
    line_size(_line_size),
    mem(_mem),
    area(_area),
    energy(_energy),
    unit_off(_l2_off),
    disable_usimm(_disable_usimm)
{
    // Turn off the unit?
    if (unit_off)
    {
        hit_latency = 0;
        area        = 0;
        energy      = 0;
        if (l1_off)
        {
            // can only turn line size to 0 if l1 is also off for bandwidth reasons
            line_size = 0;
        }
    }

    max_data_per_cycle  = mem->GetMaxBandwidth();

    // Convert from bytes to words
    max_data_per_cycle /= 4;
    outstanding_data    = 0;

    // Deprecated: Max BW is now in the config file
    // 8w * 1000MHz * 4B/w = 32 GB/s
    //max_data_per_cycle = 1; // number of words allowed per cycle for max 4GB/s BW (1000Mhz)
    //max_data_per_cycle = 2; // number of words allowed per cycle for max 8GB/s BW (1000Mhz)
    //max_data_per_cycle = 8; // number of words allowed per cycle for max 32GB/s BW (1000Mhz)
    //max_data_per_cycle = 64; // number of words allowed per cycle for max 256GB/s BW (1000Mhz)

    max_outstanding_data = 256;
    line_fill_size       = 1 << line_size;
    hit_latency          = _hit_latency;

    // get num_blocks from MainMemory
    num_blocks           = mem->GetSize();
    data                 = mem->GetData();

    // create pthread mutex for this L2
    pthread_mutex_init(&cache_mutex, NULL);

    // compute address masks
    offset_mask = (1 << line_size) - 1;

    // This wouldn't work if cache_size is not a power of 2
    index_mask  = ((cache_size >> line_size) - 1) << line_size;
    tag_mask    = 0xFFFFFFFF;
    tag_mask   &= ~index_mask;
    tag_mask   &= ~offset_mask;

    // compute how far to shift to get the index in the lower bits.
    index_shift    = line_size;
    index_tag_mask = tag_mask | index_mask;

    // need something with the banks
    last_issued = new long long int[num_banks];
    memset(last_issued, -1, sizeof(long long int)*num_banks);

    // set up the address tag storage indexed by index
    tags = new int[cache_size >> line_size];
    memset(tags, 0, sizeof(int)*cache_size >> line_size);
    valid = new bool[cache_size >> line_size];
    memset(valid, false, sizeof(bool)*cache_size >> line_size);

    //  issued_this_cycle = new int[num_banks];
    issued_this_cycle = 0;
    current_cycle     = 0;

    // initialize statistics
    bandwidth_stalls = 0;
    hits             = 0;
    stores           = 0;
    accesses         = 0;
    misses           = 0;
    bank_conflicts   = 0;
    memory_faults    = 0;
}


void L2Cache::Clear()
{
    memset(valid, false, sizeof(bool)*cache_size>>line_size);
    memset(last_issued, -1, sizeof(long long int)*num_banks);
}


void L2Cache::Reset()
{
    Clear();
    bandwidth_stalls = 0;
    hits             = 0;
    stores           = 0;
    accesses         = 0;
    misses           = 0;
    bank_conflicts   = 0;
    memory_faults    = 0;
    outstanding_data = 0;
}


L2Cache::~L2Cache()
{
    pthread_mutex_destroy(&cache_mutex);
    delete [] last_issued;
    delete [] tags;
    delete [] valid;
}


bool L2Cache::SupportsOp(Instruction::Opcode const op) const
{
    if (op == Instruction::LOAD         ||
        op == Instruction::STORE        ||
        op == Instruction::ATOMIC_FPADD ||
        op == Instruction::ACCUM        ||
        op == Instruction::FPACCUM)
    {
        return true;
    }
    return false;
}


bool L2Cache::AcceptInstruction(Instruction& ins,
                                IssueUnit* const issuer,
                                ThreadState* const thread)
{
    // doesn't accept any instructins on it's own
    return false;
}


void L2Cache::UsimmNotifyEvent(int const address,
                               long long int const write_cycle,
                               Instruction::Opcode const op)
{
    UpdateCache(address, write_cycle);
}


// From HardwareModule
void L2Cache::ClockRise()
{
    outstanding_data -= max_data_per_cycle;
    if (outstanding_data < 0)
    {
        outstanding_data = 0;
    }
}


void L2Cache::ClockFall()
{
    // Commit all updates that should be completed by now
    pthread_mutex_lock(&cache_mutex);
    for (std::vector<CacheUpdate>::iterator it = update_list.begin(); it != update_list.end(); )
    {
        if (it->update_cycle <= current_cycle)
        {
            tags[it->index]  = it->tag;
            valid[it->index] = true;
            // remove completed cache update from the list
            it = update_list.erase(it);
        }
        else
        {
            ++it;
        }
    }
    current_cycle++;
    pthread_mutex_unlock(&cache_mutex);
}


bool L2Cache::IssueInstruction(const Instruction* const ins,
                               L1Cache* const L1,
                               ThreadState* const thread,
                               long long int& ret_latency,
                               long long int const issuer_current_cycle,
                               int const address,
                               int& unroll_type)
{
    //TODO: check if issuer_current_cycle matches current_cycle

    // handle loads
    if (ins->op == Instruction::LOAD)
    {
        int const bank_id = address % num_banks;
        if (address < 0 || address >= num_blocks)
        {
            //printf("ERROR: MEMORY FAULT.  REQUEST FOR LOAD OF ADDRESS %d (not in [0, %d])\n",
            //  address, num_blocks);
            pthread_mutex_lock(&cache_mutex);
            memory_faults++;
            pthread_mutex_unlock(&cache_mutex);
            return true; // just so we complete... incorrect execution
        }
        // check for bank conflicts
        if (last_issued[bank_id] == issuer_current_cycle && !unit_off)
        {
            pthread_mutex_lock(&cache_mutex);
            bank_conflicts++;
            pthread_mutex_unlock(&cache_mutex);
            return false;
        }

        // check for a hit
        int const index = (address & index_mask) >> index_shift;
        int const tag   = address & tag_mask;
        if (tags[index] != tag || !valid[index] || unit_off)
        {
            // miss (add main memory latency)
            long long int queued_latency = 0;
            if (PendingUpdate(address, queued_latency)) // check for incoming cache lines (MSHR)
            {
                ret_latency = hit_latency + queued_latency;

                if (queued_latency > 0)
                {
                    pthread_mutex_lock(&cache_mutex);
                    unroll_type = L2Cache::UNROLL_MISS;
                    misses++;
                    pthread_mutex_unlock(&cache_mutex);
                }
                else // count it as a hit if the line came in on this cycle
                {
                    pthread_mutex_lock(&cache_mutex);
                    unroll_type = L2Cache::UNROLL_HIT;
                    if (!unit_off)
                        hits++;
                    pthread_mutex_unlock(&cache_mutex);
                }
            }
            else // need to go to DRAM
            {
                if (disable_usimm)
                {
                    pthread_mutex_lock(&cache_mutex);
                    if (outstanding_data >= max_outstanding_data)
                    {
                        bandwidth_stalls++;
                        pthread_mutex_unlock(&cache_mutex);
                        return false;
                    }
                    outstanding_data += line_fill_size;
                    pthread_mutex_unlock(&cache_mutex);
                }

                reg_value result;
                result.udata = data[address].uvalue;

                if (!disable_usimm)
                {
                    long long int const old_ready        = thread->register_ready[ins->args[0]];
                    thread->register_ready[ins->args[0]] = UNKNOWN_LATENCY;

                    long long int  const usimmAddr = traxAddrToUsimm(address, line_size);
                    dram_address_t const dram_addr = calcDramAddr(usimmAddr);

                    pthread_mutex_lock(&(usimm_mutex[dram_addr.channel]));

                    trax_request_t traxRequest;
                    traxRequest.which_reg = ins->args[0];
                    traxRequest.trax_addr = address;
                    traxRequest.thread    = thread;
                    traxRequest.op        = ins->op;
                    traxRequest.listener  = L1;
                    traxRequest.result    = result;

                    // give usimm current_cycle * N since it is operating at Nx frequency
                    reqInsertRet_t request = insert_read(dram_addr,
                                                         traxRequest,
                                                         issuer_current_cycle * DRAM_CLOCK_MULTIPLIER);

                    pthread_mutex_unlock(&(usimm_mutex[dram_addr.channel]));

                    // Read queue was full
                    if (request.retType == reqInsertRet_tt::RRT_READ_QUEUE_FULL)
                    {
                        //TODO: Need to track these read queue stalls
                        thread->register_ready[ins->args[0]] = old_ready;
                        return false;
                    }
                    assert(request.retType == reqInsertRet_tt::RRT_WRITE_QUEUE ||
                           request.retType == reqInsertRet_tt::RRT_READ_QUEUE);

                    // check if the request already exist, if so keep track of that stat
                    // will need to subtract some energy cost since these coalesced reads don't cause another bus transfer (L2 -> L1)
                    ret_latency = (request.retLatencyKnown ? hit_latency + (request.completionTime / DRAM_CLOCK_MULTIPLIER - issuer_current_cycle)
                                                           : UNKNOWN_LATENCY);
                }
                else
                {
                    ret_latency = hit_latency + mem->GetLatency(ins);
                    if (!UpdateCache(address, ret_latency + current_cycle))
                    {
                        return false;
                    }
                }

                pthread_mutex_lock(&cache_mutex);
                unroll_type = L2Cache::UNROLL_MISS;
                misses++;
                pthread_mutex_unlock(&cache_mutex);
            }
        }
        else
        {
            //if(tag == 917504 && index == 6751)
            //printf("cycle %lld, L2 HIT\n", current_cycle);
            // hit (queue load)
            ret_latency = hit_latency;
            pthread_mutex_lock(&cache_mutex);
            hits++;
            unroll_type = L2Cache::UNROLL_HIT;
            pthread_mutex_unlock(&cache_mutex);
        }
        pthread_mutex_lock(&cache_mutex);
        last_issued[bank_id] = issuer_current_cycle;
        accesses++;
        pthread_mutex_unlock(&cache_mutex);
        return true;
    }

    // atomic fp add
    if (ins->op == Instruction::ATOMIC_FPADD)
    {
        //int address = thread->registers->ReadInt(ins->args[0], issuer_current_cycle) + ins->args[2];
        int const bank_id = address % num_banks;

        // check for bank conflicts
        if (last_issued[bank_id] == issuer_current_cycle && !unit_off)
        {
            pthread_mutex_lock(&cache_mutex);
            bank_conflicts++;
            pthread_mutex_unlock(&cache_mutex);
            return false;
        }

        int const index = (address & index_mask) >> index_shift;
        int const tag   = address & tag_mask;
        // Check cache on write
        if (tags[index] == tag)
        {
            // set cache as dirty
            tags[index] = 0xFFFFFFFF;
        }
        last_issued[bank_id] = issuer_current_cycle;

        // add memory latency
        ret_latency          = hit_latency + mem->GetLatency(ins);
        return true;
    } // end atominc

    //
    // writes
    //
    // should probably check for max_concurrent (MSHR)
    //int address = thread->registers->ReadInt(ins->args[0], issuer_current_cycle) + ins->args[2];
    if (address < 0 ||
        address >= num_blocks)
    {
        printf("ERROR: L2 MEMORY FAULT.  REQUEST FOR STORE TO ADDRESS %d (not in [0, %d])\n\t", address, num_blocks);
        ins->Print();
        printf("\n");
    }

    int const bank_id = address % num_banks;
    // check for bank conflicts
    if (last_issued[bank_id] == issuer_current_cycle && !unit_off)
    {
        pthread_mutex_lock(&cache_mutex);
        bank_conflicts++;
        pthread_mutex_unlock(&cache_mutex);
        return false;
    }

    if (disable_usimm)
    {
        pthread_mutex_lock(&cache_mutex);
        if (outstanding_data >= max_outstanding_data)
        {
            bandwidth_stalls++;
            pthread_mutex_unlock(&cache_mutex);
            return false;
        }
        outstanding_data += line_fill_size;
        pthread_mutex_unlock(&cache_mutex);
    }

    // if caches are write-around, disable this
#if 0
    // check for line in cache
    int const index = (address & index_mask) >> index_shift;
    int const tag   = address & tag_mask;
    if (tags[index] == tag) { // ***** is this right? ***** //
        // set as dirty
        //tags[index] = 0xFFFFFFFF;

        // cache it
        UpdateCache(address, current_cycle);
        //tags[index] = tag;
    }
#endif

    reg_value result;
    result.idata = 0;

    if (!disable_usimm)
    {
        long long int  const usimmAddr = traxAddrToUsimm(address, line_size);
        dram_address_t const dram_addr = calcDramAddr(usimmAddr);

        pthread_mutex_lock(&(usimm_mutex[dram_addr.channel]));

        trax_request_t traxRequest;
        traxRequest.which_reg = ins->args[0];
        traxRequest.trax_addr = address;
        traxRequest.thread    = thread;
        traxRequest.op        = ins->op;
        traxRequest.listener  = NULL;
        traxRequest.result    = result;

        reqInsertRet_t request = insert_write(dram_addr,
                                              traxRequest,
                                              issuer_current_cycle * DRAM_CLOCK_MULTIPLIER);

        pthread_mutex_unlock(&(usimm_mutex[dram_addr.channel]));

        // Write queue was full
        if (request.retType == reqInsertRet_tt::RRT_WRITE_QUEUE_FULL)
        {
            return false;
        }
        assert(request.retType == reqInsertRet_tt::RRT_WRITE_QUEUE);
    }

    pthread_mutex_lock(&cache_mutex);
    last_issued[bank_id] = issuer_current_cycle;
    stores++;
    accesses++;
    if (ins->op != Instruction::ACCUM &&
        ins->op != Instruction::FPACCUM)
    {
        misses++;
    }
    pthread_mutex_unlock(&cache_mutex);

    int temp_latency = 0;
    mem->IssueInstruction(ins, this, thread, temp_latency, issuer_current_cycle);
    ret_latency      = hit_latency + temp_latency;
    return true;
}


void L2Cache::Print() const
{
//   printf("%d instructions in-flight",
//          instructions->Size());
}


void L2Cache::PrintStats() const
{
    if (unit_off)
    {
        printf("L2 OFF!\n");
    }
    printf("L2 accesses:       \t%lld\n", accesses);
    printf("L2 hits:           \t%lld\n", hits);
    printf("L2 misses:         \t%lld\n", misses);
    printf("L2 stores:         \t%lld\n", stores);
    printf("L2 bank conflicts: \t%lld\n", bank_conflicts);
    printf("L2 hit rate:       \t%f\n",   static_cast<float>(hits) / accesses);
    printf("L2 memory faults:  \t%lld\n", memory_faults);
    if (disable_usimm)
        printf("L2 bandwidth limited stalls: %lld\n", bandwidth_stalls);
}


double L2Cache::Utilization() const
{
    return static_cast<double>(processed_this_cycle) / num_banks;
}


// This schedules an update to the tag to reflect the address given
bool L2Cache::UpdateCache(int const address,
                          long long int const update_cycle)
{
    //TODO: Enable this for "fake" read queue limiting
    //if(disable_usimm)
    //{
    //     if(update_list.size() >= 80)
    //	return false;
    //}
    int const index = (address & index_mask) >> index_shift;
    int const tag   = address & tag_mask;
    //printf("adding address %d on cycle %lld to l2 queue\n", address, update_cycle);
    pthread_mutex_lock(&cache_mutex);
    update_list.push_back(CacheUpdate(index, tag, update_cycle));
    // tags[index] = tag;
    // valid[index] = true;
    pthread_mutex_unlock(&cache_mutex);
    return true;
}


bool L2Cache::BankConflict(int const address,
                           long long int const cycle)
{
    int const bank_id = address % num_banks;

    // check for bank conflicts
    if (last_issued[bank_id] == cycle &&
        !unit_off)
    {
        pthread_mutex_lock(&cache_mutex);
        bank_conflicts++;
        pthread_mutex_unlock(&cache_mutex);
        return true;
    }
    return false;
}


// Checks for a future incoming cache line for the address given
// This shouldn't  need to be synchronized since it's read-only
bool L2Cache::PendingUpdate(int const address,
                            long long int& temp_latency)
{
    int const index = (address & index_mask) >> index_shift;
    int const tag   = address & tag_mask;

    for (std::vector<CacheUpdate>::iterator i = update_list.begin(); i != update_list.end(); i++)
    {
        //printf("\ti->tag = %d, i->cycle = %lld\n", i->tag, i->update_cycle);
        if (i->tag == tag && i->index == index)
        {
            temp_latency = i->update_cycle - current_cycle;
            return true;
        }
    }
    return false;
}
