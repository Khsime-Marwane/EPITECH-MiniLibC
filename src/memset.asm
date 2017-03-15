;;
;; Author: Marwane Khsime 
;; Date: 2017-03-13 09:51:50 
;;
;; Last Modified by:   Marwane Khsime 
;; Last Modified time: 2017-03-13 09:51:50
;;

[BITS 64]

global  my_memset
        ;   void *memset(void *s, int c, size_t n);

section .text

my_memset:
    push    rbp                 ; init the my_memset functioon.
    mov     rbp , rsp           ; move.
    xor     rcx, rcx            ; set counter to 0

my_memset_loop:
    cmp     rcx, rdx            ; check if counter is equal to n
    je      my_memset_end       ; exit if 
    mov     [rdi + rcx], sil    ; push the value of c on rdi
    inc     rcx                 ;
    jmp     my_memset_loop      ; loop again

my_memset_end:
    mov     rax, rdi
    mov     rsp, rbp        ; epilogue
    pop     rbp             ; pop rbp
    ret                     ; stop function