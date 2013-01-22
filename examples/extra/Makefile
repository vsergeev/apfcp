EXAMPLES = hexdump base64 line_counter

all:
# These C examples should be compiled & linked with gcc
# These examples should be linked with ld
	as hexdump.S -o hexdump.o && ld hexdump.o -o hexdump && objdump -D hexdump > hexdump.objdump
# These examples should be linked with gcc/libc
	as base64.S -o base64.o && gcc base64.o -o base64 && objdump -D base64 > base64.objdump
	as line_counter.S -o line_counter.o && gcc line_counter.o -o line_counter && objdump -D line_counter > line_counter.objdump
# These examples should be assembled with nasm and linked with ld

clean:
	rm -f $(EXAMPLES)
	rm -f $(addsuffix .o, $(EXAMPLES))
	rm -f $(addsuffix .objdump, $(EXAMPLES))
