EXAMPLES = example-1 example-2 example-3 example-4 example-5 example-6 example-7 example-8 example-9 example-10 example-11 example-12 example-13 example-14 example-15 example-16 example-17 example-18 example-19 example-20 example-21 example-22

all:
# These C examples should be compiled & linked with gcc
	gcc -O1 example-1.c -o example-1 && objdump -D example-1 > example-1.objdump
	gcc example-18.c -o example-18 && objdump -D example-18 > example-18.objdump
	gcc example-19.c -o example-19 && objdump -D example-19 > example-19.objdump
# These examples should be linked with ld
	as example-2.S -o example-2.o && ld example-2.o -o example-2 && objdump -D example-2 > example-2.objdump
	as example-3.S -o example-3.o && ld example-3.o -o example-3 && objdump -D example-3 > example-3.objdump
	as example-5.S -o example-5.o && ld example-5.o -o example-5 && objdump -D example-5 > example-5.objdump
	as example-6.S -o example-6.o && ld example-6.o -o example-6 && objdump -D example-6 > example-6.objdump
	as example-8.S -o example-8.o && ld example-8.o -o example-8 && objdump -D example-8 > example-8.objdump
	as example-9.S -o example-9.o && ld example-9.o -o example-9 && objdump -D example-9 > example-9.objdump
	as example-11.S -o example-11.o && ld example-11.o -o example-11 && objdump -D example-11 > example-11.objdump
	as example-13.S -o example-13.o && ld example-13.o -o example-13 && objdump -D example-13 > example-13.objdump
	as example-14.S -o example-14.o && ld example-14.o -o example-14 && objdump -D example-14 > example-14.objdump
	as example-15.S -o example-15.o && ld example-15.o -o example-15 && objdump -D example-15 > example-15.objdump
	as example-20.S -o example-20.o && ld example-20.o -o example-20 && objdump -D example-20 > example-20.objdump
	as example-21.S -o example-21.o && ld example-21.o -o example-21 && objdump -D example-21 > example-21.objdump
# These examples should be linked with gcc/libc
	as example-4.S -o example-4.o && gcc example-4.o -o example-4 && objdump -D example-4 > example-4.objdump
	as example-7.S -o example-7.o && gcc example-7.o -o example-7 && objdump -D example-7 > example-7.objdump
	as example-10.S -o example-10.o && gcc example-10.o -o example-10 && objdump -D example-10 > example-10.objdump
	as example-12.S -o example-12.o && gcc example-12.o -o example-12 && objdump -D example-12 > example-12.objdump
	as example-16.S -o example-16.o && gcc example-16.o -o example-16 && objdump -D example-16 > example-16.objdump
	as example-17.S -o example-17.o && gcc example-17.o -o example-17 && objdump -D example-17 > example-17.objdump
# These examples should be assembled with nasm and linked with ld
	nasm -f elf example-22.asm -o example-22.o && ld example-22.o -o example-22 && objdump -D example-22 > example-22.objdump

clean:
	rm -f $(EXAMPLES)
	rm -f $(addsuffix .o, $(EXAMPLES))
	rm -f $(addsuffix .objdump, $(EXAMPLES))
