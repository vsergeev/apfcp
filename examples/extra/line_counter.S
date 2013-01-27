# File Line Counter (line_counter.S)
.section .text
.global main

# int main(int argc, char *argv[]) {
main:
  # Function prologue
  pushl %ebp
  movl %esp, %ebp

  # Allocate space for FILE *fp; unsigned int lc;
  subl $8, %esp

  # libc retaddr at %ebp+4
  # argc is at %ebp+8
  # **argv is at %ebp+12
  # *argv[0] is at *(%ebp+12)+0
  # *argv[1] is at *(%ebp+12)+4
  # FILE *fp is at %ebp-4
  # unsigned int lc at %ebp-8

  # if (argc < 2)
  movl 8(%ebp), %ecx    # Copy argc to %ecx
  cmpl $2, %ecx
  jl printUsage

  movl 12(%ebp), %eax   # Copy argv to %eax
  addl $4, %eax         # Add 4 to yield *argv[1]
  movl (%eax), %eax     # Dereference to yield argv[1]

  # fopen(argv[1], "r");
  pushl $openMode
  pushl %eax
  call fopen
  addl $8, %esp
  # fp = ...
  movl %eax, -4(%ebp)

  # if (fp == NULL)
  test %eax, %eax
  jz errorOpen

  # lc = 0;
  movl $0, -8(%ebp)

  read_loop:
    # %eax = fgetc(fp);
    pushl -4(%ebp)
    call fgetc
    addl $4, %esp

    # if (c == EOF) break;
    cmpl $-1, %eax
    je print_count
    # if (c != '\n') continue;
    cmpl $0x0A, %eax
    jne read_loop
    # lc += 1
    addl $1, -8(%ebp)
    jmp read_loop

  print_count:
    # printf("%d\n", lc);
    pushl -8(%ebp)
    pushl $countStr
    call printf
    addl $8, %esp
    # return 0;
    movl $0, %eax
    jmp finished

  printUsage:
    # printf("usage %s <file>\n", argv[0]);
    movl 12(%ebp), %eax
    pushl (%eax)
    pushl $usageStr
    call printf
    addl $8, %esp
    # return -1;
    movl $0, %eax
    notl %eax
    jmp finished

  errorOpen:
    # printf("error opening file!\n");
    pushl $errorOpenStr
    call printf
    addl $4, %esp
    # return -1;
    movl $0, %eax
    notl %eax
    jmp finished

  finished:
  movl %ebp, %esp
  popl %ebp
  ret


.section .data
openMode:     .ascii "r\0"
countStr:     .ascii "%d\n\0"
usageStr:     .ascii "usage: %s <file>\n\0"
errorOpenStr: .ascii "error opening file!\n\0"
