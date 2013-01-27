# Example 1 of String Instructions (example-10.S)
.section .text
.global _start
_start:
  cld               # Clear DF, we want to post-increment

  # Load str1 with 8 of 0xff
  movl $str1, %edi  # Set up our string destination pointer

  # Load the first four a byte at a time
  movb $0xFF, %al
  stosb             # *(%edi++) = %al
  stosb             # *(%edi++) = %al
  stosb             # *(%edi++) = %al
  stosb             # *(%edi++) = %al

  # Load the last four with a single dword
  movl $0xFFFFFFFF, %eax
  stosl             # *(%edi) = %eax, %esi += 4

  # Copy str1 to str2
  movl $str1, %esi  # str1 in the source
  movl $str2, %edi  # str2 in the destination
  # Two dword moves copies all 8 bytes
  movsl
  movsl
  # Done!

.section .bss
  .comm str1, 8
  .comm str2, 8

