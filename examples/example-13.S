# Example of System Calls (example-13.S)
.section .text
.global _start
_start:
  # syscall open("foo", O_CREAT | O_WRONLY, 0644);
  movl $0x05, %eax
  movl $filename, %ebx
  movl $0x41, %ecx
  movl $0644, %edx
  int $0x80

  # fd in %eax from open(), move it to %ebx for write()
  movl %eax, %ebx

  # syscall write(fd, message, messageLen);
  movl $0x04, %eax
  # fd in %ebx from above
  movl $message, %ecx
  movl $messageLen, %edx
  int $0x80

  # syscall close(fd);
  movl $0x06, %eax
  # fd still in %ebx
  int $0x80

  # syscall exit(0);
  movl $0x01, %eax
  movl $0x0, %ebx
  int $0x80

.section .data
  filename:   .ascii "foo\0"
  message:    .ascii "Hello World!\n"
  .equ messageLen, . - message

