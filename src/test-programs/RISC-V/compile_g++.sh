riscv64-unknown-elf-g++ -nostartfiles -mno-relax $1.c -O2 -o $1
riscv64-unknown-elf-g++ -nostartfiles -mno-relax -S $1.c
riscv64-unknown-elf-objdump -x -D $1 > "$1.dump"
grep "<frame_buffer>" "$1.dump"
