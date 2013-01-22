# Example of using the Frame Pointer (example-11.S)
.section .text
.global _start
_start:
  pushl $22
  pushl $20
  pushl $42
  pushl $3
  call sumNumbers
  addl $16, %esp
  # %eax is now 84

  # sumNumbers(int n, ...)
  sumNumbers:
    # Function prologue, save old frame pointer and setup new one
    pushl %ebp
    movl %esp, %ebp
    # Allocate a dword on the stack, accessible at %ebp-4
    subl $4, %esp

    movl $0, %eax       # Clear %eax
    movl $0, %ecx       # Clear %ecx
    movl 8(%ebp), %edx  # Copy argument 1 into %edx

    sumLoop:
      # Add argument 2, 3, 4, ... n in %eax
      # Argument 2 starts at %ebp+12
      addl 12(%ebp, %ecx, 4), %eax
      incl %ecx

      # Loop
      decl %edx
      jnz sumLoop

    # Function epilogue, deallocate and restore old frame pointer
    movl %ebp, %esp
    popl %ebp
    ret

