/*
** test_strlen.c for test_strlen in /home/marwane/Projets/Epitech/ASM/asm_minilibc/test
** 
** Made by Marwane
** Login   <marwane.khsime@epitech.eu>
** 
** Started on  Mon Mar 13 05:18:45 2017 Marwane
** Last update Mon Mar 13 05:21:22 2017 Marwane
*/

#include <stdio.h>
#include <string.h>

extern size_t	strlen(const char *);

int	main() {
  printf("[empty string] : %d\n", (int)strlen(""));
  printf("['Hello World'] : %d\n", (int)strlen("Hello World"));
  return 0;
}
