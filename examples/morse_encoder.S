# Morse Word Encoder (morse_encoder.S)
.section .text
.global main
main:
movl $inputWord, %esi       # Pointer to input word
movl $outputMorse, %edi     # Pointer to output morse
movl $0, %eax               # Clear %eax

encode_loop:
  movb (%esi), %al          # Read the next byte of input to %al
  incl %esi                 # Increment input word pointer

  testb %al, %al            # If we encounter a null byte
  jz finished               #   jump to finished

  subb $'A, %al             # Adjust %al to be relative to 'A'

  movl $MorseTable, %ecx    # Initialize %ecx morse table pointer
  lookup:
                                # Read the next code character into %bl
    movb (%ecx, %eax, 8), %bl   # %bl = *(%ecx + 8*%eax)

    cmpb $' , %bl               # If we encounter a space
    je lookup_done              #   break out of the loop

    movb %bl, (%edi)            # Copy the code char. to our output morse
    incl %edi                   # Increment output morse pointer

    incl %ecx                   # Incerment our table pointer
    jmp lookup                  # Loop

lookup_done:
  movb $' , (%edi)          # Copy a space to the output morse
  incl %edi                 # Increment output morse pointer
  movb $' , (%edi)          # ...
  incl %edi                 # ...
  movb $' , (%edi)          # ...
  incl %edi                 # ...

  jmp encode_loop

finished:
  movb $0x00, (%edi)        # Append a null byte to the output morse
  incl %edi                 # Increment output morse pointer

  pushl $outputMorse        # Call puts(outputMorse);
  call puts
  addl $4, %esp

  movl $0, %eax             # Return 0
  ret

.section .rodata
# Morse code lookup table
  MorseTable:
  .ascii ".-      ", "-...    ", "-.-.    ", "-..     " # A, B, C, D
  .ascii ".       ", "..-.    ", "--.     ", "....    " # E, F, G, H
  .ascii "..      ", ".---    ", "-.-     ", ".-..    " # I, J, K, L
  .ascii "--      ", "-.      ", "---     ", ".--.    " # M, N, O, P
  .ascii "--.-    ", ".-.     ", "...     ", "-       " # Q, R, S, T
  .ascii "..-     ", "...-    ", ".--     ", "-..-    " # U, V, W, X
  .ascii "-.--    ", "--..    "                         # Y, Z

.section .data
# Input Word Storage
  inputWord: .ascii "HELLO\0"

.section .bss
# Output Morse Code Storage
  .comm outputMorse, 64

