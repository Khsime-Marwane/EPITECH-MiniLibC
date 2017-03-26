;;
;; Author: Marwane Khsime 
;; Date: 2017-03-24 01:42:33 
;;
;; Last Modified by:   Marwane Khsime 
;; Last Modified time: 2017-03-24 01:42:33
;;

[BITS 64]

global  read:function
        ; ssize_t read(int fd, void *buf, size_t count);

section .text

read:
        mov rax, 0
        syscall
        ret
