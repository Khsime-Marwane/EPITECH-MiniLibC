;;
;; Author: Marwane Khsime 
;; Date: 2017-03-14 05:15:38 
;;
;; Last Modified by:   Marwane Khsime 
;; Last Modified time: 2017-03-14 05:15:38
;;

[BITS 64]

global  rindex:function
        ;   char *rindex(const char *s, int c);

section .text

rindex:
        xor     rcx, rcx
        jmp     get_first_arg_length

get_first_arg_length:
        mov     al, [rdi + rcx]         ;   move the value of rdi to al (1 byte)
        cmp     al, 0                   ;   check if the byte is not NUL
        je      rindex_init_search      ;   end of the loop, NUL byte matched
        inc     rcx                     ;   increment rcx and rdi
        jmp     get_first_arg_length    ;   continue the loop

rindex_init_search:
        cmp     rsi, 0
        je      rindex_founded
        dec     rcx                     ;   decrement rcx
        cmp     rcx, 0                  ;   check if rcx < 0 (empty string)
        jl      rindex_not_found        ;   if it's true, go to rindex_not_found
        jmp     rindex_search           ;   else, begin the search

rindex_search:
        mov     r8b, [rdi + rcx]        ;   r8b has the pointer on the first argument (s)
        cmp     r8b, sil                ;   compare characters
        je      rindex_founded          ;   if we match, go to rindex_founded
        cmp     rcx, 0                  ;   check if we are at the end of s
        je      rindex_not_found             ;   if we are at the end of the s, go to rindex_not_found
        dec     rcx                     ;   else we increment rdi
        jmp     rindex_search           ;   loop again

rindex_founded:
        add     rdi, rcx                ;   increment the rdi with rcx to get the position of the last match in s
        mov     rax, rdi                ;   move the rdi's pointer to rax
        jmp     rindex_end              ;   go to end

rindex_not_found:
        mov     rax, 0                  ;   set rax to NULL
        jmp     rindex_end              ;   go to end

rindex_end:
        ret