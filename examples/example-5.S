# Example of Static Allocation (example-5.S)
# Put some instructions in .text
.section .text
.global _start
_start:
nop
nop
nop
nop

# Put a string in .rodata
.section .rodata
anotherStr:   .ascii "Another string\n\0"

# Put some magic bytes in .data
.section .data
magicByte1:   .byte 0xaa
magicBytes2:  .byte 0x55, 0x10
magicWord:    .word 0xbeef, 0xdead
magicStr:     .ascii "String!\0"

# Reserve 1024 uninitialized bytes in .bss
.section .bss
.comm Buffer, 1024

