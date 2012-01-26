/* Insecure Example */
/* Build with: gcc -fno-stack-protector -z execstack example-18.c -o example-18 */
#include <stdio.h>

void get_input(void) {
  char buff[100];
  gets(buff);
}

int main(void) {
  printf("input:\n");
  get_input();
  return 0;
}

