g++ ./src/main.cpp -O3 -lpthread -o ./bin/x86/trax
g++ -S ./src/main.cpp -O3 -lpthread -o ./bin/x86/trax.s
objdump -d ./bin/x86/trax > "./bin/x86/trax.dump"
