;;
;; Author: Marwane Khsime 
;; Date: 2017-03-24 01:42:37 
;;
;; Last Modified by:   Marwane Khsime 
;; Last Modified time: 2017-03-24 01:42:37
;;

[BITS 64]

global  write:function
        ; ssize_t write(int fd, const void *buf, size_t count);

section .text

write:
        mov     rax, 1
        syscall
        ret