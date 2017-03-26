;;
;; Author: Marwane Khsime 
;; Date: 2017-03-13 09:51:50 
;;
;; Last Modified by:   Marwane Khsime 
;; Last Modified time: 2017-03-13 09:51:50
;;

[BITS 64]

global  memset:function
        ;   void *memset(void *s, int c, size_t n);

section .text

memset:
    xor     rcx, rcx            ; set counter to 0

memset_loop:
    cmp     rcx, rdx            ; check if counter is equal to n
    je      memset_end       ; exit if 
    mov     [rdi + rcx], sil    ; push the value of c on rdi
    inc     rcx                 ;
    jmp     memset_loop      ; loop again

memset_end:
    mov     rax, rdi
    ret                     ; stop function