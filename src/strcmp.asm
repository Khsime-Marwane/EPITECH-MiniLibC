;;
;; Author: Marwane Khsime 
;; Date: 2017-03-13 09:52:10 
;;
;; Last Modified by:   Marwane Khsime 
;; Last Modified time: 2017-03-13 09:52:10
;;

[BITS 64]

global  strcmp:function
        ; int   strcmp(const char *, const char *)

section .text

strcmp:
    mov     al, [rdi]       ; move the value of rdi to al (1 byte), first argument.
    mov     r8b, [rsi]      ; move the value of rsi to r8b (1 byte), second argument.
    cmp     al, r8b         ; compare al and r8b, if they are no equal, jump to end.
    jne     strcmp_end      ;
    cmp     al, 0           ; check if we are at the end of the first string.
    je      strcmp_end      ; if it's true, go to end.
    cmp     r8b, 0          ; check if we are at the end of the second string.
    je      strcmp_end      ; if it's true, go to end.
    inc     rsi             ; increment rdi and rsi.
    inc     rdi             ;
    jmp     strcmp          ; loop again.

strcmp_end:
    sub     al, r8b          ; get the difference between the two values.
    movsx   rax, al         ; move al in rax with byte's signe.
    ret
