#include <stdio.h>

size_t ex_strlen(const char *s) {
	size_t i;
	for (i = 0; *s != '\0'; i++)
		s++;
	return i;
}

size_t
glibc_strlen (const char *str)
{
  int cnt;

  asm("cld\n"                   /* Search forward.  */
      /* Some old versions of gas need `repne' instead of `repnz'.  */
      "repnz\n"                 /* Look for a zero byte.  */
      "scasb" /* %0, %1, %3 */ :
      "=c" (cnt) : "D" (str), "0" (-1), "a" (0));

  return -2 - cnt;
}

int main(void) {
	return 0;
}

