/*
** test_strstr.c for test_strstr in /home/marwane/Projets/Epitech/ASM/asm_minilibc/tests/sources
** 
** Made by Marwane
** Login   <marwane.khsime@epitech.eu>
** 
** Started on  Mon Mar 13 11:25:05 2017 Marwane
** Last update Mon Mar 13 17:06:29 2017 Marwane
*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

extern	char	*my_strstr(const char *, const char *);

int	main() {
  char	test1[20] = "testingprogram";
  char	test2[20] = "yoloswaggy";
  char	test3[20] = "haribozarbi";
  
  printf("%s\n", my_strstr(test1, "prog"));
  printf("%s\n", my_strstr(test2, "swag"));
  printf("%s\n", my_strstr(test3, "haribo"));
  return 0;
}
