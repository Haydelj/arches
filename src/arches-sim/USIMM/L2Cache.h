#ifndef _SIMHWRT_L2_CACHE_H_
#define _SIMHWRT_L2_CACHE_H_

// A simple memory that implements one level of direct-mapped cache
// with parameterized memory size and cache size
#include "MemoryBase.h"
#include "memory_controller.h"
#include <pthread.h>


class MainMemory;
class L1Cache;


class L2Cache : public MemoryBase, public UsimmListener
{
public:
    static const int UNROLL_HIT  = 1;
    static const int UNROLL_MISS = 2;

    // We need line_size, cache_size, issue_width
    // line_size determines the number of words in the line by 2^line_size
    // Also need hit_latency, and miss_penalty
    // issue_width is essentially just the number of copies of the cache available.
    // cache_size is the size of the cache in blocks (words)
    // num_blocks is the size of the memory in blocks (words)
    L2Cache(MainMemory* mem,
            int   const cache_size,
            int   const hit_latency,
            bool  const _disable_usimm,
            float const _area,
            float const _energy,
            int   const _num_banks    = 4,
            int   const _line_size    = 2,
            bool  const _memory_trace = false,
            bool  const _l2_off       = false,
            bool  const l1_off        = false);
    ~L2Cache();

    virtual bool SupportsOp(Instruction::Opcode const op) const;

    virtual bool AcceptInstruction(Instruction& ins,
                                   IssueUnit* const issuer,
                                   ThreadState* const thread);

    virtual void UsimmNotifyEvent(int const address,
                                  long long int const write_cycle,
                                  Instruction::Opcode const op);

    // From HardwareModule
    virtual void   ClockRise();
    virtual void   ClockFall();
    virtual void   Print()       const;
    virtual void   PrintStats()  const;
    virtual double Utilization() const;

    bool IssueInstruction(const Instruction* const ins,
                          L1Cache* const L1,
                          ThreadState* const thread,
                          long long int &ret_latency,
                          long long int const current_cycle,
                          int const address,
                          int& unroll_type);
    void Reset();
    void Clear();

    float area;
    float energy;

    int outstanding_data;
    int max_outstanding_data;
    int max_data_per_cycle;
    int line_fill_size;
    pthread_mutex_t cache_mutex;

    bool unit_off;
    bool disable_usimm;
    int hit_latency;
    int cache_size;
    int num_banks;
    long long int *last_issued;
    int line_size;
    int processed_this_cycle;
    MainMemory * mem;
    long long int current_cycle;
    std::vector<CacheUpdate> update_list;

    // need a way to decide when instructions finish
    //InstructionPriorityQueue* instructions;

    // For address calculations
    int offset_mask;
    int index_mask;
    int tag_mask;
    int index_tag_mask;
    int index_shift;

    // Address Storage
    int * tags;
    bool * valid;

    bool UpdateCache(int address, long long int update_cycle);
    bool PendingUpdate(int address, long long int& temp_latency);
    bool BankConflict(int address, long long int cycle);

    int issued_this_cycle;
    //  bool issued_atominc;

    // Hit statistics
    long long int bandwidth_stalls;
    long long int memory_faults;
    long long int hits;
    long long int stores;
    long long int accesses;
    long long int misses;
    long long int bank_conflicts;

    // Memory access record
//   bool memory_trace;
//   int *access_record;
//   int *access_hit;
//   int *access_miss;
//   int *cache_record;
//   int *cache_hits;
//   int *cache_miss;
};

#endif // _SIMHWRT_L2_CACHE_H_
