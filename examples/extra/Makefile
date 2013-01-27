EXAMPLES = hexdump base64 line_counter

all:
# These C examples should be compiled & linked with gcc
# These examples should be linked with ld
	as --32 -march=i686 hexdump.S -o hexdump.o && ld -m elf_i386 hexdump.o -o hexdump && objdump -D hexdump > hexdump.objdump
# These examples should be linked with gcc/libc
	as --32 -march=i686 base64.S -o base64.o && gcc -m32 base64.o -o base64 && objdump -D base64 > base64.objdump
	as --32 -march=i686 line_counter.S -o line_counter.o && gcc -m32 line_counter.o -o line_counter && objdump -D line_counter > line_counter.objdump
# These examples should be assembled with nasm and linked with ld

clean:
	rm -f $(EXAMPLES)
	rm -f $(addsuffix .o, $(EXAMPLES))
	rm -f $(addsuffix .objdump, $(EXAMPLES))
