;;
;; Author: Marwane Khsime 
;; Date: 2017-03-14 05:15:38 
;;
;; Last Modified by:   Marwane Khsime 
;; Last Modified time: 2017-03-14 05:15:38
;;

[BITS 64]

global  my_rindex
        ;   char *rindex(const char *s, int c);

section .text

my_rindex:
        push    rbp                     ;   init rindex header
        mov     rbp, rsp                ;

        xor     rcx, rcx
        jmp     get_first_arg_length

get_first_arg_length:
        mov     al, [rdi + rcx]         ;   move the value of rdi to al (1 byte)
        cmp     al, 0                   ;   check if the byte is not NUL
        je      my_rindex_init_search   ;   end of the loop, NUL byte matched
        inc     rcx                     ;   increment rcx and rdi
        jmp     get_first_arg_length    ;   continue the loop

my_rindex_init_search:
        dec     rcx                     ;   decrement rcx
        cmp     rcx, 0                  ;   check if rcx < 0 (empty string)
        jl      my_rindex_not_found     ;   if it's true, go to my_rindex_not_found
        jmp     my_rindex_search        ;   else, begin the search

my_rindex_search:
        mov     r8b, [rdi + rcx]        ;   r8b has the pointer on the first argument (s)
        cmp     r8b, sil                ;   compare characters
        je      my_rindex_founded       ;   if we match, go to my_rindex_founded
        cmp     rcx, 0                  ;   check if we are at the end of s
        je      my_rindex_not_found     ;   if we are at the end of the s, go to my_rindex_not_found
        dec     rcx                     ;   else we increment rdi
        jmp     my_rindex_search        ;   loop again

my_rindex_founded:
        add     rdi, rcx                ;   increment the rdi with rcx to get the position of the last match in s
        mov     rax, rdi                ;   move the rdi's pointer to rax
        jmp     my_rindex_end           ;   go to end

my_rindex_not_found:
        mov     rax, 0                  ;   set rax to NULL
        jmp     my_rindex_end           ;   go to end

my_rindex_end:
        mov     rsp, rbp                ;   prologue
        pop     rbp
        ret