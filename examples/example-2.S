# Example of Arithmetic and Data Transfer Instructions (example-2.S)
.section .text
.global _start
_start:
nop                     # Do nothing!

# add, sub, adc, and, xor
addl %eax, %ebx         # %ebx = %ebx + %eax
addl magicNumber, %ebx  # %ebx = %ebx + *(magicNumber)
addl %ebx, magicNumber  # *(magicNumber) = *(magicNumber) + %ebx
addl $0x12341234, %ebx  # %ebx = %ebx + 0x12341234

# inc, dec, not, neg
decl %eax               # %eax--
decw %ax                # %ax--
decb %al                # %al--

# rol, rcl, shl, shr, sal, sar
shrl $3, %eax           # %eax = %eax >> 3
shrl $3, magicNumber    # *(magicNumber) = *(magicNumber) >> 3

# mov
movl %eax, %ebx		      # %ebx = %eax
movl magicNumber, %eax	# %eax = *(magicNumber)
movl %eax, magicNumber	# *(magicNumber) = %eax

.section .data
magicNumber: .long 0xdeadbeef
