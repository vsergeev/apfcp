.section .text
.global main
main:
  # memset(str, 'A', 48);
  pushl $48
  pushl $'A
  pushl $str
  call asm_memset
  addl $12, %esp

  # str[48] = '\n'; str[49] = '\0';
  movb $'\n', str+48
  movb $0, str+49

  # printf(str);
  pushl $str
  call printf
  addl $4, %esp

  ret

# void *memset(void *s, int c, size_t n);
asm_memset:
  pushl %edi
  pushl %ebp
  movl %esp, %ebp

  movl 12(%ebp), %edi    # %eid = s
  movl 16(%ebp), %eax    # %eax = c
  movl 20(%ebp), %ecx    # %ecx = n

  rep stosb

  movl 12(%ebp), %eax    # %eax = s

  movl %ebp, %esp
  popl %ebp
  popl %edi
  ret

.section .bss
  .comm str, 50

