# Example of cdecl Calling Convention (example-9.S)
.section .text
.global _start
_start:
# sumThreeNumbers(*magicNumber, 5, 12);
pushl $12             # Push 0x000000C
pushl $5              # Push 0x0000005
pushl magicNumber     # Push *magicNumber
call sumThreeNumbers
addl $12, %esp        # Clean up arguments off of the stack
# %eax is 59

sumThreeNumbers:
  # Stack is now
  # |    ...     |
  # |     12     | <- %esp+12
  # |      5     | <- %esp+8
  # |     42     | <- %esp+4
  # | retaddr    | <- %esp

  movl $0, %eax        # Clear %eax
  addl 4(%esp), %eax   # %eax += *(%esp+4)
  addl 8(%esp), %eax   # %eax += *(%esp+8)
  addl 12(%esp), %eax  # %eax += *(%esp+12)
  ret

.section .data
magicNumber: .long 42

