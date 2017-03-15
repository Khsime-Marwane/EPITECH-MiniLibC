/*
** test_memset.c for memset in /home/marwane/Projets/Epitech/ASM/asm_minilibc/tests/sources
** 
** Made by Marwane
** Login   <marwane.khsime@epitech.eu>
** 
** Started on  Mon Mar 13 10:17:24 2017 Marwane
** Last update Tue Mar 14 15:31:38 2017 Marwane
*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

extern	void	*my_memset(void *, int, size_t);

int	main() {
  char	*test1 = malloc(sizeof(char) * 5);
  char	*test2 = malloc(sizeof(char) * 5);
  char	*test3 = malloc(sizeof(char) * 5);

  // init
  memset(test1, '7', 5);
  memset(test2, '7', 5);
  memset(test3, '7', 5);

  // Calling our my_memset
  printf("%s\n", my_memset(test1, 'A', 3));
  printf("%s\n", my_memset(test2, 'X', 4));
  printf("%s\n", my_memset(test3, 'Z', 0));

  return 0;
}
