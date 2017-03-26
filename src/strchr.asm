;;
;; Author: Marwane Khsime 
;; Date: 2017-03-14 05:15:38 
;;
;; Last Modified by:   Marwane Khsime 
;; Last Modified time: 2017-03-14 05:15:38
;;

[BITS 64]

global  strchr:function
        ;   char *strchr(const char *s, int c);

section .text

strchr:
        ; mov     r9b, [rsi]            ;   r9b has the value on the second argument (c)

strchr_search:
        mov     r8b, [rdi]              ;   r8b has the pointer on the first argument (s)
        cmp     r8b, sil                ;   compare characters
        je      strchr_founded          ;   if we match, go to strchr_founded
        cmp     r8b, 0                  ;   check if we are at the end of s
        je      strchr_null_end         ;   if we are at the end of the s, go to strchr_not_found
        inc     rdi                     ;   else we increment rdi
        jmp     strchr_search           ;   loop again

strchr_founded:
        mov     rax, rdi
        jmp     strchr_end

strchr_null_end:
        mov     rax, 0
        jmp     strchr_end

strchr_end:
        ret