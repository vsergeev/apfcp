.section .text
.global _start
_start:
# cmpl %oper1, %oper2
# updates flags based on result of %oper2 - %oper1
cmpl %eax, %ecx
cmpl $0xFF, %eax

# conditional jumps
je label_foo	  # jump if %oper2 == %oper1
jg label_bar    # jump if %oper2 > %oper1
jl label_xyz	  # jump if %oper2 < %oper1

# test %oper1, %oper2
# updates flags based on result of %oper2 & %oper1
testl %eax, %ecx
testl $0x1F, %eax

# arithmetic
# updates flags based on result
addl %eax, %ebx
incl %eax
decl %ebx

# labels are just symbols containing an address to make
# it easy to specify addresses
label1:
label2:
	movl $0, %eax	  # %eax = 0
	incl %eax	      # %eax++ ; ZF set to 0!
	jz label1	      # Jump if ZF = 1 (not taken)
	jnz label3	    # Jump if ZF = 0 (taken)
	decl %eax	      # I won't be executed
label3:
	nop
	nop		          # Execution will fall through
label4:
	jmp label1	    # Jump back to label1

# Loops
movl $10, %eax
loop:
	nop
	decl %eax
	jnz loop

# Direct Comparison
cmpl $0x05, %eax
je label_foo      # Jump to label_foo if %eax == 5

label_foo:
nop
label_bar:
nop
label_xyz:
nop
