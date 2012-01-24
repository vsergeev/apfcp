.section .text
.global _start
_start:
movl $tableStart, %ebx          # Pointer to table start
                                # We are moving the *value* $tableStart,
                                # *this is not a memory access*
movl $0, %ecx
loop:
    movl (%ebx, %ecx, 4), %eax  # %eax = *(%ebx + 4*%ecx)
    notl %eax                   # %eax = ~ %eax
    movl %eax, (%ebx, %ecx, 4)  # *(%ebx + 4*%ecx) = %eax
    incl %ecx
    cmpl $10, %ecx
    jl loop
nop

.section .data
tableStart: .word 0x0000, 0x0000, 0x0001, 0x0000
            .word 0x0002, 0x0000, 0x0003, 0x0000
            .word 0x0004, 0x0000, 0x0005, 0x0000
            .word 0x0006, 0x0000, 0x0007, 0x0000
            .word 0x0008, 0x0000, 0x0009, 0x0000

