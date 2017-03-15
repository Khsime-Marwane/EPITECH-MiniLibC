;;
;; Author: Marwane Khsime 
;; Date: 2017-03-15 06:28:05 
;;
;; Last Modified by:   Marwane Khsime 
;; Last Modified time: 2017-03-15 06:28:05
;;

[BITS 64]

global  my_memmove
        ; void *memmove(void *dest, const void *src, size_t n);

section .text

my_memmove:
        push    rbp
        mov     rbp, rsp
        mov     rax, rdx    ; init rax with "n's" value (because we begin from the end)
        sub     rax, 1

my_memmove_loop:
        cmp     rax, 0
        jl      my_memmove_end
        mov     r8b, [rsi + rax]    ; get value from src
        mov     [rdi + rax], r8b    ; write it in dest
        dec     rax                 ; decrement rax to go left
        jmp my_memmove_loop

my_memmove_end:
        mov     rax, rdi            ; mov dest in rax
        mov     rsp, rbp
        pop     rbp
        ret