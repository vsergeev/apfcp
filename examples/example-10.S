# 99 Bottles of Beer on the Wall (example-10.S)
.section .text
.global main
.global printf
main:
  movl $99, %eax    # Start with 99 bottles!
  # We could use a cdecl callee preserved register,
  # but we'll make it hard on ourselves to practice
  # caller saving/restoring

  # printf(char *format, ...);

  more_beer:
    # Save %eax since it will get used by printf()
    pushl %eax

    # printf(formatStr1, %eax, %eax);
    pushl %eax
    pushl %eax
    pushl $formatStr1   # *Address* of formatStr1
    call printf
    addl $12, %esp      # Clean up the stack

    # Restore %eax
    popl %eax
    # Drink a beer
    decl %eax

    # Save %eax
    pushl %eax

    # printf(formatStr2, %eax);
    pushl %eax
    pushl $formatStr2   # *Address* of formatStr2
    call printf
    addl $8, %esp       # Clean up the stack

    # Restore %eax
    popl %eax
    # Loop
    test %eax, %eax
    jnz more_beer

  # printf(formatStr3);
  pushl $formatStr3
  call printf
  addl $4, %esp

  movl $0, %eax
  ret

.section .data
formatStr1: .ascii "%d bottles of beer on the wall! %d bottles of beer!\n\0"
formatStr2: .ascii "Take one down, pass it around, %d bottles of beer on the wall!\n\0"
formatStr3: .ascii "No more bottles of beer on the wall!\n\0"
