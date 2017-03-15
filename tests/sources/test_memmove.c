/*
** test_memmove.c for memmove in /home/marwane/Projets/Epitech/ASM/asm_minilibc/tests/sources
** 
** Made by Marwane
** Login   <marwane.khsime@epitech.eu>
** 
** Started on  Wed Mar 15 06:45:13 2017 Marwane
** Last update Wed Mar 15 06:54:00 2017 Marwane
*/

#include <string.h>
#include <stdio.h>

extern	void *my_memmove(void *dest, const void *src, size_t n);

int	main() {
  char	str[] = "hariboa";
  char	str2[] = "yolo";

  memmove(NULL, NULL, 0);
  printf("%s\n", (char *)my_memmove(str + 2, str, 2));
  printf("%s\n", (char *)my_memmove(str2, "xxx", 3));
  return 0;
}
