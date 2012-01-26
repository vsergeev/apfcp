/* Print address of a variable on the stack */
#include <stdio.h>

int main(void) {
  char c;
  printf("%x\n", &c);
  return 0;
}

