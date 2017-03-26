;;
;; Author: Marwane Khsime 
;; Date: 2017-03-26 04:51:46 
;;
;; Last Modified by:   Marwane Khsime 
;; Last Modified time: 2017-03-26 04:51:46
;;

[BITS 64]

global  my_putstr:function
        ; void   my_putstr(const char *);

section .text

my_putstr:
    cmp     rdi, 0
    je      my_putstr_empty
    mov     rsi, rdi
    xor     rcx, rcx

my_putstr_getmsg_length:
    mov     al, [rdi + rcx]
    cmp     al, 0
    je      my_putstr_print
    inc     rcx
    jmp     my_putstr_getmsg_length

my_putstr_print:
    mov     rax, 1
    mov     rdx, rcx
    mov     rdi, 1
    syscall
    ret

my_putstr_empty:
    ret