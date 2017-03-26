/*
** test_strcmp.c for test_strcmp in /home/marwane/Projets/Epitech/ASM/asm_minilibc/tests/sources
** 
** Made by Marwane
** Login   <marwane.khsime@epitech.eu>
** 
** Started on  Mon Mar 13 06:34:58 2017 Marwane
** Last update Mon Mar 13 07:54:19 2017 Marwane
*/

#include <stdio.h>
#include <string.h>

extern	int	strcmp(const char *, const char *);

int	main() {
  printf("[empty string] = %s\n", strcmp("", "") == 0 ? "OK" : "KO");
  printf("[a && a] = %s\n", strcmp("a", "a") == 0 ? "OK" : "KO");
  printf("[a && b] = %s\n", strcmp("abc", "ab") > 0 ? "OK" : "KO");
  printf("[ab && abc] = %s\n", strcmp("ab", "abc") < 0 ? "OK" : "KO");
  printf("[b && a] = %s\n", strcmp("ab", "abc") < 0 ? "OK" : "KO");
  return 0;
}
