riscv64-unknown-elf-g++ -nostartfiles -mno-relax $1.cpp -O2 -o $1
riscv64-unknown-elf-g++ -nostartfiles -mno-relax -O2 -S $1.cpp
riscv64-unknown-elf-objdump -x -D $1 > "$1.dump"
grep "<frame_buffer>" "$1.dump"
