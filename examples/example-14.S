# Simple Hexdump (example-14.S)
.section .text
.global _start
_start:
  pushl %ebp
  movl %esp, %ebp

  # Allocate int fd; char buff[16]; on stack
  subl $20, %esp

  # Check if argc < 2
  movl 4(%ebp), %eax
  cmpl $2, %eax
  jl exit

  # syscall open(argv[1], O_RDONLY);
  movl $0x05, %eax
  movl 12(%ebp), %ebx
  movl $0x00, %ecx
  int $0x80

  # Check if fd < 0
  test %eax, %eax
  jl exit

  # Copy %eax to fd local variable
  movl %eax, -4(%ebp)

  read_loop:
    # syscall read(fd, buff, 16);
    movl $0x03, %eax
    movl -4(%ebp), %ebx   # fd
    leal -20(%ebp), %ecx  # address %ebp-20, our buff[16]
    movl $16, %edx
    int $0x80
    # Check for error on read
    cmpl $0, %eax
    jle cleanup

    # %esi = index, %edi = count
    movl $0, %esi
    movl %eax, %edi

    byte_loop:
      # Fetch the byte from our buff
      movb -20(%ebp, %esi, 1), %al

      # Print out the byte as ASCII hex
      pushl %eax
      call putbyte
      addl $4, %esp

      # Print out a space
      pushl $' '
      call putchar
      addl $4, %esp

      # Loop byte_loop
      incl %esi
      decl %edi
      jnz byte_loop

    # Print out a newline
    pushl $'\n'
    call putchar
    addl $4, %esp

    # Loop read_loop
    jmp read_loop

cleanup:
  # syscall close(fd);
  movl $0x06, %eax
  movl -4(%ebp), %ebx
  int $0x80

exit:
  # syscall exit(0);
  movl $0x01, %eax
  movl $0x0, %ebx
  int $0x80

########################################

putbyte:
  # Fetch argument
  movl 4(%esp), %eax
  # Isolate the top nibble 0xX0
  shrb $4, %al
  andl $0x0F, %eax
  # Convert to ASCII hex
  movl $nibble2hex, %ecx
  movb (%ecx, %eax, 1), %al
  # Print out the nibble
  pushl %eax
  call putchar
  addl $4, %esp

  # Fetch argument
  movl 4(%esp), %eax
  # Isolate the bottom nibble 0x0X
  andl $0x0F, %eax
  # Convert to ASCII hex
  movl $nibble2hex, %ecx
  movb (%ecx, %eax, 1), %al
  # Print out the nibble
  pushl %eax
  call putchar
  addl $4, %esp
  ret

putchar:
  # Save %ebx
  pushl %ebx
  # syscall write(0, c, 1);
  movl $0x04, %eax
  movl $0, %ebx
  leal 8(%esp), %ecx
  movl $1, %edx
  int $0x80
  # Restore %ebx
  popl %ebx
  ret

########################################

.section .rodata
nibble2hex: .ascii "0123456789abcdef"

