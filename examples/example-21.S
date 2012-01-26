# Hello Shellcode Take 2 (example-21.S)
.section .text
.global _start
_start:
# Clever way to get our own address
jmp get_str_addr
got_str_addr:
popl %ecx

# write(1, "Hello!", 6);
xorl %eax, %eax
xorl %ebx, %ebx
xorl %edx, %edx
incl %ebx
addb $4, %al
addb $6, %dl
int $0x80

# exit(0);
xorl %eax, %eax
incl %eax
# %ebx already zero from above
int $0x80

get_str_addr:
call got_str_addr
.ascii "Hello!"
