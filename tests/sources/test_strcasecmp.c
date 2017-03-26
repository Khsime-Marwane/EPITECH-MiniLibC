/*
** test_strcmp.c for test_strcmp in /home/marwane/Projets/Epitech/ASM/asm_minilibc/tests/sources
** 
** Made by Marwane
** Login   <marwane.khsime@epitech.eu>
** 
** Started on  Mon Mar 13 06:34:58 2017 Marwane
** Last update Tue Mar 14 10:59:23 2017 Marwane
*/

#include <stdio.h>
#include <string.h>

extern	int	strcasecmp(const char *, const char *);

int	main() {
  printf("[empty string] = %s\n", strcasecmp("", "") == 0 ? "OK" : "KO");
  printf("[A && a] = %s\n", strcasecmp("a", "a") == 0 ? "OK" : "KO");
  printf("[a && B] = %s\n", strcasecmp("abc", "ab") > 0 ? "OK" : "KO");
  printf("[ab && ABc] = %s\n", strcasecmp("ab", "abc") < 0 ? "OK" : "KO");
  printf("[b && a] = %s\n", strcasecmp("ab", "abc") < 0 ? "OK" : "KO");
  return 0;
}
