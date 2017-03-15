;;
;; Author: Marwane Khsime 
;; Date: 2017-03-14 05:15:38 
;;
;; Last Modified by:   Marwane Khsime 
;; Last Modified time: 2017-03-14 05:15:38
;;

[BITS 64]

global  my_strchr
        ;   char *strchr(const char *s, int c);

section .text

my_strchr:
        push    rbp                     ;   init strchr header
        mov     rbp, rsp                ;
        ; mov     r9b, [rsi]            ;   r9b has the value on the second argument (c)

my_strchr_search:
        mov     r8b, [rdi]              ;   r8b has the pointer on the first argument (s)
        cmp     r8b, 0                  ;   check if we are at the end of s
        je      my_strchr_not_found     ;   if we are at the end of the s, go to my_strchr_not_found
        cmp     r8b, sil                ;   compare characters
        je      my_strchr_founded       ;   if we match, go to my_strchr_founded
        inc     rdi                     ;   else we increment rdi
        jmp     my_strchr_search        ;   loop again

my_strchr_founded:
        mov     rax, rdi                ;   move the rdi's pointer to rax
        jmp     my_strchr_end           ;   go to end

my_strchr_not_found:
        mov     rax, 0                  ;   set rax to NULL
        jmp     my_strchr_end           ;   go to end

my_strchr_end:
        mov     rsp, rbp                ;   prologue
        pop     rbp
        ret