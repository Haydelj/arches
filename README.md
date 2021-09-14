## Arches

Arches is a general-purpose and fast cycle-accurate hardware simulator.  It was written as a
research project into creating a fast hardware simulator, and consequently is built around a
message-driven processing scheme that allows hardware units to be simulated lazily and drastically
reduces thread-contention during simulation.

The name is a pun on being able to simulate various architectures and on Arches National Park, Utah
(it being traditional at the University of Utah to name software projects after Utah or Salt Lake
City features).

[Link to abstract](project-info/abstract.md)

[Link to team page](project-info/teampage.md)

## Setup (Simulator)

Visual Studio Components needed:
*  Windows Universal CRT SDK 
    *  Install using VS Installer
*  Windows 8.1 sdk 
    *  Download from https://go.microsoft.com/fwlink/p/?LinkId=323507
*  MSVC v141 - VS 2017 C++ x64/x86 build tools (v14.16) 
    *  Install via VS Installer; use the correct build tools for your environment ie. x64/x86

To build the simulator, simply open `arches.sln` in Visual Studio and batch build all.

The simulator itself will be built at `.build/[platform]/[config]/arches-sim.lib`, and any included
samples using it will be built as executables in the same directory.

To run a sample, such as "sim-sample-mips", simply select it in the solution explorer and run it.

## Setup (MIPS64r6 Programs) (Ubuntu Linux)
Since MIPS64v6 computers are rare to the point of near-nonexistence, we need a cross-compiler to
build MIPS64v6 binaries.  In the future, we'll probably use LLVM and build our own, but for now
we'll use GCC, whose documentation is superior.

Unfortunately, GCC is so badly tested, that cross-compilers are nearly impossible to build,
especially for MIPS, a more-rare architecture.  Fortunately, Ubuntu Linux has a package containing a
pre-built cross-compiler:

    sudo apt-get install g++-mips64-linux-gnuabi64

There is still a compiler bug, however, that will cause builds to fail.  We can work around that by:

    sudo cp /usr/mips64-linux-gnuabi64/include/gnu/stubs-n64_hard.h /usr/mips64-linux-gnuabi64/include/gnu/stubs-n64_hard_2008.h

To compile a program, the key compiler option to remember is `-march=mips64r6`.  There is also an apparent bug that prevents the compilation from happening in one step, so add `-c` and invoke the linker directly.  For example:

    mips64-linux-gnuabi64-gcc -march=mips64r6 -c simple-loop.c -o simple-loop.o
    mips64-linux-gnuabi64-ld simple-loop.o -o simple-loop.out

That's it!  You should now just be able to load this binary directly into the simulator.

Note: for ease-of-debugging, there are a bunch of other options you can pass.  See "test-programs/compile.sh" (which you can also just run to produce a binary for `simple-loop`).

## Setup (RISCV, Ubuntu Linux)
Testing programs on the framework requires the use of a RISC-V Cross-Compiler. Fortunately, many many people have devoted numerous hours to getting a decent RISC-V cross compiler implemented using GCC; this is available [here](https://github.com/riscv/riscv-gnu-toolchain). 
For our own testing, these are the instructions we followed:
```bash
$ git clone https://github.com/riscv/riscv-gnu-toolchain
$ cd riscv-gnu-toolchain
$ git submodule update --init --recursive
$ sudo apt-get install autoconf automake autotools-dev curl python3 libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev
$ ./configure --prefix=/opt/riscv --with-arch=rv64g --with-abi=lp64d
$ make -j$(nproc)
$ echo -e "export PATH=\"/opt/riscv/bin:$PATH\"" >> ~/.bashrc
$ . ~/.bashrc
```
After these steps are completed, users are able to use `riscv64-uknown-elf-gcc` to compile C code and `riscv64-unknown-elf-g++` to compile C/C++ code. 

## Adding custom instructions
A key reason we used RISC-V over other research languages (i.e. MIPS) was the ease with which RISC-V can be extended. This allows researchers to use our framework to test novel hardware designs that may rely on custom instructions for drastic performance improvements. It's important to note that this method allows progams using custom instructions to compile; however, it doesn't act as a true cross-compiler, i.e. users will need to use inline ASM to include their custom instructions.

To add custom instructions, we followed the guide available [here](https://nitish2112.github.io/post/adding-instruction-riscv/). Since the time of this guide's writing, there have been a few notable changes to the build tree of the riscv-gnu-toolchain, so we will only note the differences below:
- Use `riscv-gnu-toolchain/riscv-binutils/include/opcode/riscv-opc.h` instead of `riscv-gnu-toolchain/riscv-binutils-gdb/include/opcode/riscv-opc.h`.
- Similarly, use `riscv-gnu-toolchain/riscv-binutils/opcodes/riscv-opc.c` instead of `riscv-gnu-toolchain/riscv-binutils-gdb/opcodes/riscv-opc.c`. 
As the original guide notes, after the custom instruction has been added the toolchain will need to be rebuilt. This can be easily accomplished by running the following:
```
$ cd {PATH/TO/RISCV_GNU_TOOLCHAIN}
$ make clean
$ ./configure --prefix=/opt/riscv --with-arch=rv64g --with-abi=lp64d
$ make -j$(nproc)
```
After rebuilding, the user should be able to run the cross-compiled programs with their custom instructions on the Arches framework, assuming they have extended the implementation of the RISC-V ISA provided by Arches to contain their custom instruction.

More details about the RISC-V ISA are available [by reading the specification](https://github.com/riscv/riscv-isa-manual/releases/download/Ratified-IMFDQC-and-Priv-v1.11/riscv-privileged-20190608.pdf), but it's expected that users are at least familiar with RISC-V before they attempt to implement custom instructions. 


## Useful Resources

For debugging, consider the following tools/commands may prove helpful:

- `readelf <command> <file>.out`: Provides information about binary.
- `mips64-linux-gnuabi64-objdump -d -M "no-aliases" <file>.out`: Disassembles binary, starting from `main(...)`.  The optional `-M "no-aliases` argument suppresses the default behavior of writing fake mnemonics (it's trying to help you understand semantically, rather than exactly, what a given instruction does).

Documentation and miscellaneous:

- [MIPS64 in-general](https://www.mips.com/products/architectures/mips64/)
- [MIPS64r6 Instruction Set](https://www.mips.com/?do-download=the-mips64-instruction-set-v6-06)
- [MIPS registers](http://www.cs.uwm.edu/classes/cs315/Bacon/Lecture/HTML/ch05s03.html)

## Contributing

Follow the coding style in the existing code.  Additionally, aim for cleanliness above all else.
