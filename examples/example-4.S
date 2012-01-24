.section .text
.global main
main:
  movl $0, %ecx     # f_n-2 = f_0 = 0
  movl $1, %ebx     # f_n-1 = f_1 = 1
  movl $1, %eax     # f_n   = f_2 = 1
  movl $12, %edi    # Number of integers to compute

  fib_loop:
    # Print %eax
    call myprint

    movl %ebx, %ecx   # f_n-1 -> f_n-2
    movl %eax, %ebx   # f_n   -> f_n-1
    addl %ecx, %eax   # New f_n = Old f_n + f_n-2

    # Decrement %edi
    decl %edi
    jnz fib_loop

  ret

.global printf
myprint:
  # Save %ecx, %ebx, %eax
  # Pass formatStr (and %eax)
  pushl %ecx
  pushl %ebx
  pushl %eax
  pushl $formatStr
  call printf
  addl $4, %esp
  # Restore %eax, %ebx, %ecx
  popl %eax
  popl %ebx
  popl %ecx
  ret

.section .data
formatStr: .ascii "%d\n\0" # printf() format string
