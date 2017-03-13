#!/bin/sh

#
#	STRLEN
#
gcc -c sources/test_strlen.c && nasm -f elf64 ../strlen.asm && gcc test_strlen.o ../strlen.o && ./a.out > tmpStrlen.txt

diff tmpStrlen.txt answers/strlen.txt > /dev/null
if [ $? -eq 0 ]
then
    echo "Tests Strlen \t\t\t[OK]"
else
    echo "Tests Strlen \t\t\t[KO]"
fi

#
#	STRCMP
#
gcc -c sources/test_strcmp.c && nasm -f elf64 ../strcmp.asm && gcc test_strcmp.o ../strcmp.o && ./a.out > tmpStrcmp.txt

diff tmpStrcmp.txt answers/strcmp.txt > /dev/null
if [ $? -eq 0 ]
then
    echo "Tests Strcmp \t\t\t[OK]"
else
    echo "Tests Strcmp \t\t\t[KO]"
fi

rm -rf *.o ../*.o a.out tmp*
