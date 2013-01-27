# Example of Stack Usage (example-stack.S)
.section .text
.global _start
_start:
  # Stack is now
  # |    ...     |   <-- %esp = 0x8xxxxxxx

  movl $0x05, %eax    # Load 0x00000005 into %eax

  pushl %eax          # Push dword 0x00000005 onto the stack
  incl %eax           # %eax += 1
  pushl %eax          # Push dword 0x00000006 onto the stack

  pushl $0xdeadbeef   # Push dword 0xdeadbeef onto the stack

  # Stack is now
  # |    ...     |
  # | 0x00000005 |
  # | 0x00000006 |
  # | 0xdeadbeef |   <-- %esp = 0x8xxxxxxx

  popl %ebx           # Pop dword off of the stack,
                      # %ebx = 0xdeadbeef now

  # Stack is now
  # |    ...     |
  # | 0x00000005 |
  # | 0x00000006 |  <-- %esp = 0x8xxxxxxx
  # | 0xdeadbeef |

  addl $4, %esp       # Deallocate 4 bytes off of the stack

  # Stack is now
  # |    ...     |
  # | 0x00000005 |  <-- %esp = 0x8xxxxxxx
  # | 0x00000006 |
  # | 0xdeadbeef |

  movl $0xaaaaaaaa, (%esp)  # Write 0xaaaaaaaa to the stack

  # Stack is now
  # |    ...     |
  # | 0xaaaaaaaa |  <-- %esp = 0x8xxxxxxx
  # | 0x00000006 |
  # | 0xdeadbeef |

