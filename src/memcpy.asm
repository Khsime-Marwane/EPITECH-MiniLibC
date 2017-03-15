;;
;; Author: Marwane Khsime 
;; Date: 2017-03-14 06:05:16 
;;
;; Last Modified by:   Marwane Khsime 
;; Last Modified time: 2017-03-14 06:05:16
;;

[BITS 64]

global  my_memcpy
        ; void *memcpy(void *dest, const void *src, size_t n);

section .text

my_memcpy:
        push    rbp         ; init memcpy header
        mov     rbp, rsp    ;
        xor     rcx, rcx

my_memcpy_loop:
        cmp     rcx, rdx
        jae     my_memcpy_end           ; if rcx >= n, stop the loop
        mov     r8b, [rsi + rcx]        ; get the octet from src
        mov     [rdi + rcx], r8b        ; put it in dest
        inc     rcx                     ; increment rcx
        jmp     my_memcpy_loop          ; loop again

my_memcpy_end:
        mov     rax, rdi    ; memcpy's return
        mov     rsp, rbp    ; prologue
        pop     rbp
        ret