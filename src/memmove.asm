;;
;; Author: Marwane Khsime 
;; Date: 2017-03-15 06:28:05 
;;
;; Last Modified by:   Marwane Khsime 
;; Last Modified time: 2017-03-15 06:28:05
;;

[BITS 64]

global  memmove:function
        ; void *memmove(void *dest, const void *src, size_t n);

section .text

memmove:
        mov     rax, rdx    ; init rax with "n's" value (because we begin from the end)
        sub     rax, 1
        cmp     rdx, 0
        je      memmove_end
        cmp     rdi, rsi
        jg      memmove_loop_from_right
        mov     rax, 0
        jmp     memmove_loop_from_left
        

memmove_loop_from_right:
        cmp     rax, 0
        jl      memmove_end
        mov     r8b, [rsi + rax]    ; get value from src
        mov     [rdi + rax], r8b    ; write it in dest
        dec     rax                 ; decrement rax to go left
        jmp     memmove_loop_from_right

memmove_loop_from_left:
        cmp     rax, rdx
        je      memmove_end
        mov     r8b, [rsi + rax]    ; get value from src
        mov     [rdi + rax], r8b    ; write it in dest
        inc     rax                 ; decrement rax to go left
        jmp     memmove_loop_from_left

memmove_end:
        mov     rax, rdi            ; mov dest in rax
        ret