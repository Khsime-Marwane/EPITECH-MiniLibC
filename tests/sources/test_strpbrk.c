/*
** test_strpbrk.c for test_strpbrk in /home/marwane/Projets/Epitech/ASM/asm_minilibc/tests/sources
** 
** Made by Marwane
** Login   <marwane.khsime@epitech.eu>
** 
** Started on  Wed Mar 15 05:37:06 2017 Marwane
** Last update Wed Mar 15 05:46:05 2017 Marwane
*/

#include <stdio.h>
#include <string.h>

extern	char *strpbrk(const char *s, const char *accept);

int	main() {
  printf("%s\n", strpbrk("helloworld", "r"));
  char *str = strpbrk("helloworld", "s");
  printf("%s\n", !str  ? "NULL" : str);
  str = strpbrk("helloworld", "");
  printf("%s\n", !str  ? "NULL" : str);  
  printf("%s\n", strpbrk("pmokijnhbgbvtfcwa", "abc"));
  return 0;
}
