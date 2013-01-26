# Hello Shellcode Take 1 (example-20.S)
.section .text
.global _start
_start:
  # Clever way to get string address into %ecx
  jmp get_str_addr
  got_str_addr:
  popl %ecx

  # write(1, "Hello!", 6);
  movl $0x04, %eax
  movl $0x01, %ebx
  movl $6, %edx
  int $0x80

  # exit(0);
  movl $0x01, %eax
  # %ebx already zero from above
  int $0x80

get_str_addr:
  call got_str_addr
  .ascii "Hello!"
