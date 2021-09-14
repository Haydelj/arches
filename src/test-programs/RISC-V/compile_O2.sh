riscv64-unknown-elf-gcc $1.c -O2 -o $1
riscv64-unknown-elf-gcc -O2 -S $1.c
riscv64-unknown-elf-objdump -x -D $1 > "$1.dump"
