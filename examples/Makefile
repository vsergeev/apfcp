EXAMPLES = example-1 example-2 example-3 example-4 example-5 example-6 example-7 example-8 example-9 example-10 example-11 example-12 example-insecure example-addrstack example-shellcode1 example-shellcode2 example-hello-nasm fibonacci morse_encoder 99_bottles_of_beer linked_list tee

all:
# These C examples should be compiled & linked with gcc
	gcc -m32 -Wall -O1 example-1.c -o example-1 && objdump -D example-1 > example-1.objdump
	gcc -m32 -Wall example-insecure.c -o example-insecure && objdump -D example-insecure > example-insecure.objdump
	gcc -m32 -Wall example-addrstack.c -o example-addrstack && objdump -D example-addrstack > example-addrstack.objdump
# These examples should be linked directlywith ld
	as --32 -march=i686 example-2.S -o example-2.o && ld -m elf_i386 example-2.o -o example-2 && objdump -D example-2 > example-2.objdump
	as --32 -march=i686 example-3.S -o example-3.o && ld -m elf_i386 example-3.o -o example-3 && objdump -D example-3 > example-3.objdump
	as --32 -march=i686 example-4.S -o example-4.o && ld -m elf_i386 example-4.o -o example-4 && objdump -D example-4 > example-4.objdump
	as --32 -march=i686 example-5.S -o example-5.o && ld -m elf_i386 example-5.o -o example-5 && objdump -D example-5 > example-5.objdump
	as --32 -march=i686 example-6.S -o example-6.o && ld -m elf_i386 example-6.o -o example-6 && objdump -D example-6 > example-6.objdump
	as --32 -march=i686 example-7.S -o example-7.o && ld -m elf_i386 example-7.o -o example-7 && objdump -D example-7 > example-7.objdump
	as --32 -march=i686 example-8.S -o example-8.o && ld -m elf_i386 example-8.o -o example-8 && objdump -D example-8 > example-8.objdump
	as --32 -march=i686 example-9.S -o example-9.o && ld -m elf_i386 example-9.o -o example-9 && objdump -D example-9 > example-9.objdump
	as --32 -march=i686 tee.S -o tee.o && ld -m elf_i386 tee.o -o tee && objdump -D tee > tee.objdump
	as --32 -march=i686 example-10.S -o example-10.o && ld -m elf_i386 example-10.o -o example-10 && objdump -D example-10 > example-10.objdump
	as --32 -march=i686 example-shellcode1.S -o example-shellcode1.o && ld -m elf_i386 example-shellcode1.o -o example-shellcode1 && objdump -D example-shellcode1 > example-shellcode1.objdump
	as --32 -march=i686 example-shellcode2.S -o example-shellcode2.o && ld -m elf_i386 example-shellcode2.o -o example-shellcode2 && objdump -D example-shellcode2 > example-shellcode2.objdump
# These examples should be linked with gcc/libc
	as --32 -march=i686 fibonacci.S -o fibonacci.o && gcc -m32 fibonacci.o -o fibonacci && objdump -D fibonacci > fibonacci.objdump
	as --32 -march=i686 morse_encoder.S -o morse_encoder.o && gcc -m32 morse_encoder.o -o morse_encoder && objdump -D morse_encoder > morse_encoder.objdump
	as --32 -march=i686 99_bottles_of_beer.S -o 99_bottles_of_beer.o && gcc -m32 99_bottles_of_beer.o -o 99_bottles_of_beer && objdump -D 99_bottles_of_beer > 99_bottles_of_beer.objdump
	as --32 -march=i686 linked_list.S -o linked_list.o && gcc -m32 linked_list.o -o linked_list && objdump -D linked_list > linked_list.objdump
	as --32 -march=i686 example-11.S -o example-11.o && gcc -m32 example-11.o -o example-11 && objdump -D example-11 > example-11.objdump
	as --32 -march=i686 example-12.S -o example-12.o && gcc -m32 example-12.o -o example-12 && objdump -D example-12 > example-12.objdump
# These examples should be assembled with nasm and linked with ld
	nasm -f elf32 example-hello-nasm.asm -o example-hello-nasm.o && ld -m elf_i386 example-hello-nasm.o -o example-hello-nasm && objdump -D example-hello-nasm > example-hello-nasm.objdump

clean:
	rm -f $(EXAMPLES)
	rm -f $(addsuffix .o, $(EXAMPLES))
	rm -f $(addsuffix .objdump, $(EXAMPLES))
