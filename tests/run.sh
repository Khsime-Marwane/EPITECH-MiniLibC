#!/bin/sh

SRCDIR="../src/"
OBJDIR="../obj/"

######################
#	STRLEN	     #
######################
gcc -c -w sources/test_strlen.c && nasm -f elf64 ${SRCDIR}strlen.asm && gcc test_strlen.o ${OBJDIR}strlen.o && ./a.out > tmpstrlen.txt

diff tmpstrlen.txt answers/strlen.txt > /dev/null
if [ $? -eq 0 ]
then
    echo "Tests Strlen \t\t\t[OK]"
else
    echo "Tests Strlen \t\t\t[KO]"
fi

######################
#	STRCMP	     #
######################
gcc -c -w sources/test_strcmp.c && nasm -f elf64 ${SRCDIR}strcmp.asm && gcc test_strcmp.o ${OBJDIR}strcmp.o && ./a.out > tmpstrcmp.txt

diff tmpstrcmp.txt answers/strcmp.txt > /dev/null
if [ $? -eq 0 ]
then
    echo "Tests Strcmp \t\t\t[OK]"
else
    echo "Tests Strcmp \t\t\t[KO]"
fi

######################
#	STRNCMP	     #
######################
gcc -c -w sources/test_strncmp.c && nasm -f elf64 ${SRCDIR}strncmp.asm && gcc test_strncmp.o ${OBJDIR}strncmp.o && ./a.out > tmpstrncmp.txt

diff tmpstrncmp.txt answers/strncmp.txt > /dev/null
if [ $? -eq 0 ]
then
    echo "Tests Strncmp \t\t\t[OK]"
else
    echo "Tests Strncmp \t\t\t[KO]"
fi

######################
#	STRCASECMP	     #
######################
gcc -c -w sources/test_strcasecmp.c && nasm -f elf64 ${SRCDIR}strcasecmp.asm && gcc test_strcasecmp.o ${OBJDIR}strcasecmp.o && ./a.out > tmpstrcasecmp.txt

diff tmpstrcasecmp.txt answers/strcasecmp.txt > /dev/null
if [ $? -eq 0 ]
then
    echo "Tests Strcasecmp \t\t[OK]"
else
    echo "Tests Strcasecmp \t\t[KO]"
fi

######################
#	MEMSET	     #
######################
gcc -c -w sources/test_memset.c && nasm -f elf64 ${SRCDIR}memset.asm && gcc test_memset.o ${OBJDIR}memset.o && ./a.out > tmpmemset.txt

diff tmpmemset.txt answers/memset.txt > /dev/null
if [ $? -eq 0 ]
then
    echo "Tests Memset \t\t\t[OK]"
else
    echo "Tests Memset \t\t\t[KO]"
fi

######################
#	MEMCPY	     #
######################
gcc -c -w sources/test_memcpy.c && nasm -f elf64 ${SRCDIR}memcpy.asm && gcc test_memcpy.o ${OBJDIR}memcpy.o && ./a.out > tmpmemcpy.txt

diff tmpmemcpy.txt answers/memcpy.txt > /dev/null
if [ $? -eq 0 ]
then
    echo "Tests Memcpy \t\t\t[OK]"
else
    echo "Tests Memcpy \t\t\t[KO]"
fi

######################
#	MEMMOVE	     #
######################
gcc -c -w sources/test_memmove.c && nasm -f elf64 ${SRCDIR}memmove.asm && gcc test_memmove.o ${OBJDIR}memmove.o && ./a.out > tmpmemmove.txt

diff tmpmemmove.txt answers/memmove.txt > /dev/null
if [ $? -eq 0 ]
then
    echo "Tests Memmove \t\t\t[OK]"
else
    echo "Tests Memmove \t\t\t[KO]"
fi


######################
#	STRSTR	     #
######################
gcc -c -w sources/test_strstr.c && nasm -f elf64 ${SRCDIR}strstr.asm && gcc test_strstr.o ${OBJDIR}strstr.o && ./a.out > tmpstrstr.txt

diff tmpstrstr.txt answers/strstr.txt > /dev/null
if [ $? -eq 0 ]
then
    echo "Tests Strstr \t\t\t[OK]"
else
    echo "Tests Strstr \t\t\t[KO]"
fi

######################
#	RINDEX	     #
######################
gcc -c -w sources/test_rindex.c && nasm -f elf64 ${SRCDIR}rindex.asm && gcc test_rindex.o ${OBJDIR}rindex.o && ./a.out > tmprindex.txt

diff tmprindex.txt answers/rindex.txt > /dev/null
if [ $? -eq 0 ]
then
    echo "Tests Rindex \t\t\t[OK]"
else
    echo "Tests Rindex \t\t\t[KO]"
fi

######################
#	STRCHR	     #
######################
gcc -c -w sources/test_strchr.c && nasm -f elf64 ${SRCDIR}strchr.asm && gcc test_strchr.o ${OBJDIR}strchr.o && ./a.out > tmpstrchr.txt

diff tmpstrchr.txt answers/strchr.txt > /dev/null
if [ $? -eq 0 ]
then
    echo "Tests Strchr \t\t\t[OK]"
else
    echo "Tests Strchr \t\t\t[KO]"
fi

######################
#	STRCSPN	     #
######################
gcc -c -w sources/test_strcspn.c && nasm -f elf64 ${SRCDIR}strcspn.asm && gcc test_strcspn.o ${OBJDIR}strcspn.o && ./a.out > tmpstrcspn.txt

diff tmpstrcspn.txt answers/strcspn.txt > /dev/null
if [ $? -eq 0 ]
then
    echo "Tests Strcspn \t\t\t[OK]"
else
    echo "Tests Strcspn \t\t\t[KO]"
fi

######################
#	STRPBRK	     #
######################
gcc -c -w sources/test_strpbrk.c && nasm -f elf64 ${SRCDIR}strpbrk.asm && gcc test_strpbrk.o ${OBJDIR}strpbrk.o && ./a.out > tmpstrpbrk.txt

diff tmpstrpbrk.txt answers/strpbrk.txt > /dev/null
if [ $? -eq 0 ]
then
    echo "Tests Strpbrk \t\t\t[OK]"
else
    echo "Tests Strpbrk \t\t\t[KO]"
fi

rm -rf *.o ../*.o a.out tmp*
