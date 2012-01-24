#include <stdio.h>

int main(int argc, char *argv[]) {
  FILE *fp;
  char c;
  unsigned int lc;

  if (argc < 2) {
    printf("usage: %s <file>\n", argv[0]);
    return -1;
  }

  fp = fopen(argv[1], "r");
  if (fp == NULL) {
    printf("error opening file!\n");
    return -1;
  }

  lc = 0;
  while ((c = fgetc(fp)) != EOF) {
    if (c == '\n')
      lc++;
  }

  printf("%d\n", lc);

  fclose(fp);
  return 0;
}
