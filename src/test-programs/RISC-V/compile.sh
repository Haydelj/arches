riscv64-unknown-elf-gcc $1.c -o $1
riscv64-unknown-elf-gcc -S $1.c
riscv64-unknown-elf-objdump -x -D $1 > "$1.dump"
