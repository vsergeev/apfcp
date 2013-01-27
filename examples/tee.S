# Tee (tee.S)
.section .text
.global _start
_start:
  push %ebp
  mov %esp, %ebp

  subl $4, %esp       # int fd; on the stack

  cmpl $2, 4(%ebp)    # if (argc != 2)
  jne tee_usage       #   goto tee_usage;

  tee_open:
  # syscall open(argv[1], O_CREAT|O_WRONLY|O_TRUNC, 0644);
  movl $0x05, %eax
  movl 12(%ebp), %ebx
  movl $0x241, %ecx
  movl $0644, %edx
  int $0x80

  cmpl $0, %eax       # if (%eax < 0)
  jl tee_exit         #   goto tee_exit;

  movl %eax, -4(%ebp) # fd = %eax

  tee_loop:
    # Read from input
    # syscall read(0, &c, 1);
    movl $3, %eax
    movl $0, %ebx
    movl $c, %ecx
    movl $1, %edx
    int $0x80

    cmpl $1, %eax       # if (%eax < 1)
    jl tee_exit         #   goto tee_exit;

    # Write to file
    # syscall write(fd, &c, 1);
    movl $4, %eax
    movl -4(%ebp), %ebx
    movl $c, %ecx
    movl $1, %edx
    int $0x80
    # Write to stdout
    # syscall write(1, &c, 1);
    movl $4, %eax
    movl $1, %ebx
    movl $c, %ecx
    movl $1, %edx
    int $0x80

    jmp tee_loop       # Loop

  tee_usage:
  # syscall write(1, usageStr, usageStrLen);
  movl $4, %eax
  movl $1, %ebx
  movl $usageStr, %ecx
  movl usageStrLen, %edx
  int $0x80

  tee_exit:
  # syscall exit(0);
  movl $1, %eax
  movl $0, %ebx
  int $0x80

.section .rodata
# Usage string and length
  usageStr:     .ascii "./tee <file>\n"
  .equ usageStrLen, . - message

.section .bss
# Read character var
  .comm c, 1

