/* Print address of a variable on the stack (example-addrstack.c) */
#include <stdio.h>

int main(void) {
  char c;
  printf("%p\n", &c);
  return 0;
}

