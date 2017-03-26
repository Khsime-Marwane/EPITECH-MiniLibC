;;
;; Author: Marwane Khsime 
;; Date: 2017-03-14 06:05:16 
;;
;; Last Modified by:   Marwane Khsime 
;; Last Modified time: 2017-03-14 06:05:16
;;

[BITS 64]

global  memcpy:function
        ; void *memcpy(void *dest, const void *src, size_t n);

section .text

memcpy:
        xor     rcx, rcx

memcpy_loop:
        cmp     rcx, rdx
        jae     memcpy_end           ; if rcx >= n, stop the loop
        mov     r8b, [rsi + rcx]        ; get the octet from src
        mov     [rdi + rcx], r8b        ; put it in dest
        inc     rcx                     ; increment rcx
        jmp     memcpy_loop          ; loop again

memcpy_end:
        mov     rax, rdi    ; memcpy's return
        ret
