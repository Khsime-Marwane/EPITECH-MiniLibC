/*
** test_rindex.c for rindex in /home/marwane/Projets/Epitech/ASM/asm_minilibc/tests/sources
** 
** Made by Marwane
** Login   <marwane.khsime@epitech.eu>
** 
** Started on  Tue Mar 14 05:09:15 2017 Marwane
** Last update Tue Mar 14 07:07:17 2017 Marwane
*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

extern	char *my_strchr(const char *s, int c);

int	main() {
  printf("[empty string] = %s", "");
  printf("[looking for a in 'haribo'] = %s\n", my_strchr("haribo", 'a'));
  printf("[looking for z in 'yakuza'] = %s\n", my_strchr("yakuza", 'z'));
  printf("[looking for x in 'lol'] = %s\n", my_strchr("lol", 'x'));
  return 0;
}
