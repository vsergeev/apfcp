.section .text

.global main
main:
movl $plainData, %esi     # Pointer to plainData
movl $encodedData, %edi   # Pointer to encodedData
movl $b64table, %ebp      # Pointer to b64Table

movl $0, %ecx             # Clear our counter %ecx
movl plainDataLen, %edx   # Length of plain data in %edx

b64_encode_loop:
  movb (%esi, %ecx, 1), %al   # Fetch byte 1 of 3
  incl %ecx
  shl $16, %eax               # Left shift the byte into place
  movb (%esi, %ecx, 1), %ah   # Fetch byte 2 of 3
  incl %ecx
  movb (%esi, %ecx, 1), %al   # Fetch byte 3 of 3
  incl %ecx

  # %eax contains 24-bits of input bytes
  # arranges as | x | 2 | 1 | 0 |

  movl %eax, %ebx     # Save a copy of %eax

  # Look up base-64 character 1
  shr $18, %eax               # Shift top 6-bits to the bottom
  andl $0x3F, %eax            # Mask them off
  movb (%ebp, %eax, 1), %al   # Look up the character from b64table
  movb %al, (%edi)            # Write character to encodeString
  incl %edi
  movl %ebx, %eax             # Restore %eax

  # Look up base-64 character 2
  shr $12, %eax               # Shift next 6-bits to the bottom
  andl $0x3F, %eax            # Mask them off
  movb (%ebp, %eax, 1), %al   # Look up the character from b64table
  movb %al, (%edi)            # Write character to encodeString
  incl %edi
  movl %ebx, %eax             # Restore %eax

  # Look up base-64 character 3
  shr $6, %eax                # Shift next 6-bits to the bottom
  andl $0x3F, %eax            # Mask them off
  movb (%ebp, %eax, 1), %al   # Look up the character from b64table
  movb %al, (%edi)            # Write character to encodeString
  incl %edi
  movl %ebx, %eax             # Restore %eax

  # Look up base-64 character 4
  andl $0x3F, %eax            # Mask off the last 6-bits
  movb (%ebp, %eax, 1), %al   # Look up the character from b64table
  movb %al, (%edi)            # Write character to encodeString
  incl %edi

  # Loop until we've processed all input bytes
  cmpl %edx, %ecx
  jl b64_encode_loop

# Write a null-terminating byte to the encoded string
movb $0, %al
movb %al, (%edi)

# Print the encoded string
pushl $encodedData
pushl $plainData
pushl $formatStr
call printf
addl $12, %esp

ret

.section .rodata
  # base-64 encoding look up table
  b64table:
  .byte 'A,'B,'C,'D,'E,'F,'G,'H
  .byte 'I,'J,'K,'L,'M,'N,'O,'P
  .byte 'Q,'R,'S,'T,'U,'V,'W,'X
  .byte 'Y,'Z,'a,'b,'c,'d,'e,'f
  .byte 'g,'h,'i,'j,'k,'l,'m,'n
  .byte 'o,'p,'q,'r,'s,'t,'u,'v
  .byte 'w,'x,'y,'z,'0,'1,'2,'3
  .byte '4,'5,'6,'7,'8,'9,'+,'/

formatStr:
  .ascii "Plain data: %s\nEncoded data: %s\n\0"

.section .bss
  # base-64 encoded string storage
  .comm encodedData, 1024

.section .data
  # input data (multiple of 3 bytes for the purpose of this example)
  plainData:      .ascii "Hello World!\0"
  plainDataLen:   .word 12, 0
