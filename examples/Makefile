EXAMPLES = example-strlen example-arith-mov example-cond-jmp example-static-alloc example-indirect-mem example-stack example-cdecl example-ebp example-syscall example-string1 example-string2 example-libc example-insecure example-addrstack example-shellcode1 example-shellcode2 example-hello-nasm fibonacci morse_encoder 99_bottles_of_beer linked_list tee

all:
# These C examples should be compiled & linked with gcc
	gcc -m32 -Wall -O1 example-strlen.c -o example-strlen && objdump -D example-strlen > example-strlen.objdump
	gcc -m32 -Wall example-insecure.c -o example-insecure && objdump -D example-insecure > example-insecure.objdump
	gcc -m32 -Wall example-addrstack.c -o example-addrstack && objdump -D example-addrstack > example-addrstack.objdump
# These examples should be linked directlywith ld
	as --32 -march=i686 example-arith-mov.S -o example-arith-mov.o && ld -m elf_i386 example-arith-mov.o -o example-arith-mov && objdump -D example-arith-mov > example-arith-mov.objdump
	as --32 -march=i686 example-cond-jmp.S -o example-cond-jmp.o && ld -m elf_i386 example-cond-jmp.o -o example-cond-jmp && objdump -D example-cond-jmp > example-cond-jmp.objdump
	as --32 -march=i686 example-static-alloc.S -o example-static-alloc.o && ld -m elf_i386 example-static-alloc.o -o example-static-alloc && objdump -D example-static-alloc > example-static-alloc.objdump
	as --32 -march=i686 example-indirect-mem.S -o example-indirect-mem.o && ld -m elf_i386 example-indirect-mem.o -o example-indirect-mem && objdump -D example-indirect-mem > example-indirect-mem.objdump
	as --32 -march=i686 example-stack.S -o example-stack.o && ld -m elf_i386 example-stack.o -o example-stack && objdump -D example-stack > example-stack.objdump
	as --32 -march=i686 example-cdecl.S -o example-cdecl.o && ld -m elf_i386 example-cdecl.o -o example-cdecl && objdump -D example-cdecl > example-cdecl.objdump
	as --32 -march=i686 example-ebp.S -o example-ebp.o && ld -m elf_i386 example-ebp.o -o example-ebp && objdump -D example-ebp > example-ebp.objdump
	as --32 -march=i686 example-syscall.S -o example-syscall.o && ld -m elf_i386 example-syscall.o -o example-syscall && objdump -D example-syscall > example-syscall.objdump
	as --32 -march=i686 tee.S -o tee.o && ld -m elf_i386 tee.o -o tee && objdump -D tee > tee.objdump
	as --32 -march=i686 example-string1.S -o example-string1.o && ld -m elf_i386 example-string1.o -o example-string1 && objdump -D example-string1 > example-string1.objdump
	as --32 -march=i686 example-shellcode1.S -o example-shellcode1.o && ld -m elf_i386 example-shellcode1.o -o example-shellcode1 && objdump -D example-shellcode1 > example-shellcode1.objdump
	as --32 -march=i686 example-shellcode2.S -o example-shellcode2.o && ld -m elf_i386 example-shellcode2.o -o example-shellcode2 && objdump -D example-shellcode2 > example-shellcode2.objdump
# These examples should be linked with gcc/libc
	as --32 -march=i686 fibonacci.S -o fibonacci.o && gcc -m32 fibonacci.o -o fibonacci && objdump -D fibonacci > fibonacci.objdump
	as --32 -march=i686 morse_encoder.S -o morse_encoder.o && gcc -m32 morse_encoder.o -o morse_encoder && objdump -D morse_encoder > morse_encoder.objdump
	as --32 -march=i686 99_bottles_of_beer.S -o 99_bottles_of_beer.o && gcc -m32 99_bottles_of_beer.o -o 99_bottles_of_beer && objdump -D 99_bottles_of_beer > 99_bottles_of_beer.objdump
	as --32 -march=i686 linked_list.S -o linked_list.o && gcc -m32 linked_list.o -o linked_list && objdump -D linked_list > linked_list.objdump
	as --32 -march=i686 example-string2.S -o example-string2.o && gcc -m32 example-string2.o -o example-string2 && objdump -D example-string2 > example-string2.objdump
	as --32 -march=i686 example-libc.S -o example-libc.o && gcc -m32 example-libc.o -o example-libc && objdump -D example-libc > example-libc.objdump
# These examples should be assembled with nasm and linked with ld
	nasm -f elf32 example-hello-nasm.asm -o example-hello-nasm.o && ld -m elf_i386 example-hello-nasm.o -o example-hello-nasm && objdump -D example-hello-nasm > example-hello-nasm.objdump

clean:
	rm -f $(EXAMPLES)
	rm -f $(addsuffix .o, $(EXAMPLES))
	rm -f $(addsuffix .objdump, $(EXAMPLES))
