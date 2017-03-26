/*
** test_strcmp.c for test_strcmp in /home/marwane/Projets/Epitech/ASM/asm_minilibc/tests/sources
** 
** Made by Marwane
** Login   <marwane.khsime@epitech.eu>
** 
** Started on  Mon Mar 13 06:34:58 2017 Marwane
** Last update Mon Mar 13 15:17:38 2017 Marwane
*/

#include <stdio.h>
#include <string.h>

extern	int	strncmp(const char *, const char *, size_t);

int	main() {
  printf("[empty string n : 0] = %s\n", strncmp("", "", 0) == 0 ? "OK" : "KO");
  printf("[a && a] with n : 1 = %s\n", strncmp("a", "a", 1) == 0 ? "OK" : "KO");
  printf("[abc && ab] with n : 2 = %s\n", strncmp("abc", "ab", 2) == 0 ? "OK" : "KO");
  printf("[ax && abc] with n : 0 = %s\n", strncmp("ax", "abc", 0) == 0 ? "OK" : "KO");
  printf("[ab && axc] with n : 2 = %s\n", strncmp("ab", "axc", 2) < 0 ? "OK" : "KO");
  printf("[axc && ab] with n : 2 = %s\n", strncmp("ab", "axc", 2) < 0 ? "OK" : "KO");
  return 0;
}
