#  Author information
#  Author name: Jacob Hajjar
#  CPSC240-1
#  Author email: hajjarj@csu.fullerton.edu
#  Program name: Execution Time
rm *.o
rm *.out

nasm -f elf64 -l hertz.lis -g -F dwarf -o clock.o clock.asm

gcc -c -g -Wall -m64 -no-pie -o execution_time.o execution_time.c -std=c17

gcc -m64 -no-pie -o a.out -std=c11 execution_time.o clock.o 

gdb ./a.out