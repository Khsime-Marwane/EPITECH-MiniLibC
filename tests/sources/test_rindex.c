/*
** test_rindex.c for rindex in /home/marwane/Projets/Epitech/ASM/asm_minilibc/tests/sources
** 
** Made by Marwane
** Login   <marwane.khsime@epitech.eu>
** 
** Started on  Tue Mar 14 05:09:15 2017 Marwane
** Last update Tue Mar 14 10:09:41 2017 Marwane
*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

extern	char *rindex(const char *s, int c);

int	main() {
  printf("[empty string] = %s\n", "");
  printf("[looking for a in 'haribo'] = %s\n", rindex("haribo", 'a'));
  printf("[looking for a in 'hariboa'] = %s\n", rindex("hariboa", 'a'));
  printf("[looking for z in 'zyakuza'] = %s\n", rindex("zyakuza", 'z'));
  printf("[looking for x in 'lol'] = %s\n", rindex("lol", 'x'));
  return 0;
}
