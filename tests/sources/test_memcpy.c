/*
** test_memset.c for memset in /home/marwane/Projets/Epitech/ASM/asm_minilibc/tests/sources
** 
** Made by Marwane
** Login   <marwane.khsime@epitech.eu>
** 
** Started on  Mon Mar 13 10:17:24 2017 Marwane
** Last update Tue Mar 14 06:16:00 2017 Marwane
*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

extern	void	my_memcpy(void *, const void *, size_t);

int	main() {
  char	*test1 = malloc(sizeof(char) * 5);
  char	*test2 = malloc(sizeof(char) * 5);
  char	*test3 = malloc(sizeof(char) * 5);

  // init
  memset(test1, 0, 5);
  memset(test2, 0, 5);
  memset(test3, 0, 5);

  // Calling our my_memset
  my_memcpy(test1, "test", 4);
  my_memcpy(test2, "lol", 3);
  my_memcpy(test3, "ah", 0);

  // test
  printf("%s\n", test1);
  printf("%s\n", test2);
  printf("%s\n", test3);
  return 0;
}
