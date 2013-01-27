/* Insecure Example (example-insecure.c) */
/* Build with: gcc -fno-stack-protector -z execstack example-insecure.c -o example-insecure */
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

