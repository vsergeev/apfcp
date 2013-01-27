# Example of using libc in Assembly
.section .text
.global main
main:
  # %eax = time(NULL);
  pushl $0
  call time
  add $4, %esp

  # *curtime = %eax
  movl %eax, curtime

  # %eax = localtime(&curtime);
  pushl $curtime
  call localtime
  add $4, %esp

  # %eax = asctime(%eax);
  pushl %eax
  call asctime
  add $4, %esp

  # printf("%s\n", %eax);
  pushl %eax
  pushl $formatStr
  call printf
  add $8, %esp

  ret

.section .data
  .comm curtime, 4
  formatStr:  .ascii "%s\0"

