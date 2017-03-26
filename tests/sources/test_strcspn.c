/*
** test_strcspn.c for strcspn in /home/marwane/Projets/Epitech/ASM/asm_minilibc/tests/sources
** 
** Made by Marwane
** Login   <marwane.khsime@epitech.eu>
** 
** Started on  Tue Mar 14 11:24:50 2017 Marwane
** Last update Tue Mar 14 12:32:21 2017 Marwane
*/

#include <stdio.h>
#include <string.h>

extern	size_t strspn(const char *s, const char *accept);

int	main() {
  printf("[empty string] = %lu\n", strcspn("", "x"));
  printf("[empty string] = %lu\n", strcspn("bhb", "h"));
  printf("['jk' in 'ablsjkyoo' = %lu\n", strcspn("ablsjkyoo", "jk"));
  printf("['x' in 'aaaaaaaxa' = %lu\n", strcspn("aaaaaaaxa", "x"));
  printf("['x' in 'kkkkkkkkk' = %lu\n", strcspn("kkkkkkkkk", "x"));
  return 0;
}
