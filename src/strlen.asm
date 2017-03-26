;;
;; Author: Marwane Khsime 
;; Date: 2017-03-13 09:52:25 
;;
;; Last Modified by:   Marwane Khsime 
;; Last Modified time: 2017-03-13 09:52:25
;;

[BITS 64]

global  strlen:function
        ; int   strlen(const char *);

section .text

strlen:
    xor     rcx, rcx            ; init the counter

strlen_loop:
    mov     al, [rdi]           ; move the value of rdi to al (1 byte)
    cmp     al, 0               ; check if the byte is not NUL
    je      strlen_end       ; end of the loop, NUL byte matched
    inc     rcx                 ; increment rcx and rdi
    inc     rdi                 ;
    jmp     strlen_loop      ; continue the loop

strlen_end:
    mov     rax, rcx            ; Assign rcx to rax (contain the value returned)
    ret                         ; return the value
