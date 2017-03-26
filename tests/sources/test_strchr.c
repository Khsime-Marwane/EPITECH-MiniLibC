/*
** test_rindex.c for rindex in /home/marwane/Projets/Epitech/ASM/asm_minilibc/tests/sources
** 
** Made by Marwane
** Login   <marwane.khsime@epitech.eu>
** 
** Started on  Tue Mar 14 05:09:15 2017 Marwane
** Last update Thu Mar 16 16:55:16 2017 Marwane
*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

extern	char *strchr(const char *s, int c);

int	main() {
  printf("[empty string] = %s", strchr("", 0));
  printf("[looking for a in 'haribo'] = %s\n", strchr("haribo", 'a'));
  printf("[looking for z in 'yakuza'] = %s\n", strchr("yakuza", 'z'));
  printf("[looking for x in 'lol'] = %s\n", strchr("lol", 'x'));
  return 0;
}
