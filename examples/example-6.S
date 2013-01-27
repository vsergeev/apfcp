# Example of Indirectly Accessing Memory (example-6.S)
.section .text
.global _start
_start:
  movl $tableStart, %ebx          # Pointer to table start
                                  # We are moving the *value*
                                  # $tableStart, this is not a
                                  # memory access!
  movl $0, %ecx
  loop:
      movl (%ebx, %ecx, 4), %eax  # %eax = *(%ebx + 4*%ecx)
      notl %eax                   # %eax = ~%eax
      movl %eax, (%ebx, %ecx, 4)  # *(%ebx + 4*%ecx) = %eax
      incl %ecx
      cmpl $10, %ecx
      jl loop
  nop

.section .data
  tableStart: .long 0x00000000, 0x00000001
              .long 0x00000002, 0x00000003
              .long 0x00000004, 0x00000005
              .long 0x00000006, 0x00000007
              .long 0x00000008, 0x00000009

