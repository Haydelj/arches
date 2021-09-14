riscv64-unknown-elf-g++ -nostartfiles -mno-relax -mabi=lp64f --entry=main -O3 ./src/main.cpp -o ./bin/riscv/trax
riscv64-unknown-elf-g++ -nostartfiles -mno-relax -mabi=lp64f --entry=main -O3 -S ./src/main.cpp -o ./bin/riscv/trax.s
riscv64-unknown-elf-objdump -d -x ./bin/riscv/trax > "./bin/riscv/trax.dump"
grep "<frame_buffer>" "bin/riscv/trax.dump"
