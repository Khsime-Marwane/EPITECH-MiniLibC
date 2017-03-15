;;
;; Author: Marwane Khsime 
;; Date: 2017-03-13 09:52:10 
;;
;; Last Modified by:   Marwane Khsime 
;; Last Modified time: 2017-03-13 09:52:10
;;

[BITS 64]

global  my_strcmp
        ; int   my_strcmp(const char *, const char *)

section .text

my_strcmp:
    push    rbp             ; init the my_strcmp functioon.
    mov     rbp, rsp        ; move.

my_strcmp_loop:
    mov     al, [rdi]       ; move the value of rdi to al (1 byte), first argument.
    mov     bl, [rsi]       ; move the value of rsi to bl (1 byte), second argument.
    cmp     al, bl          ; compare al and bl, if they are no equal, jump to end.
    jne     my_strcmp_end   ;
    cmp     al, 0           ; check if we are at the end of the first string.
    je      my_strcmp_end   ; if it's true, go to end.
    cmp     bl, 0           ; check if we are at the end of the second string.
    je      my_strcmp_end   ; if it's true, go to end.
    inc     rsi             ; increment rdi and rsi.
    inc     rdi             ;
    jmp     my_strcmp_loop  ; loop again.

my_strcmp_end:
    sub     al, bl          ; get the difference between the two values.
    movsx   rax, al         ; move al in rax with byte's signe.

    mov     rsp, rbp        ; prologue.
    pop     rbp             ; pop the pointer on rbp.
    ret
