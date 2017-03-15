;;
;; Author: Marwane Khsime 
;; Date: 2017-03-13 09:52:10 
;;
;; Last Modified by:   Marwane Khsime 
;; Last Modified time: 2017-03-13 09:52:10
;;

[BITS 64]

global  my_strncmp
        ; int   my_strncmp(const char *s1, const char *s2, size_t n)

section .text

my_strncmp:
    push    rbp             ; init the my_strncmp functioon.
    mov     rbp, rsp        ; move.
    xor     rcx, rcx        ; init the counter
    cmp     rdx, 0          ;
    je      my_strncmp_end_error  ;

my_strncmp_loop:
    mov     al, [rdi]       ; move the value of rdi to al (1 byte), first argument.
    mov     bl, [rsi]       ; move the value of rsi to bl (1 byte), second argument.
    cmp     al, bl          ; compare al and bl, if they are no equal, jump to end.
    jne     my_strncmp_end  ;
    cmp     al, 0           ; check if we are at the end of the first string.
    je      my_strncmp_end  ; if it's true, go to end.
    cmp     bl, 0           ; check if we are at the end of the second string.
    je      my_strncmp_end  ; if it's true, go to end.
    inc     rsi             ; increment rdi, rsi, and rcx.
    inc     rdi             ;
    inc     rcx             ;
    cmp     rcx, rdx        ;
    je      my_strncmp_end  ;
    jmp     my_strncmp_loop ; loop again.

my_strncmp_end:
    sub     al, bl          ; get the difference between the two values.
    movsx   rax, al         ; move al in rax with byte's signe.

    mov     rsp, rbp        ; prologue.
    pop     rbp             ; pop the pointer on rbp.

    ret

my_strncmp_end_error:
    mov     rax, 0         ; move al in rax with byte's signe.

    mov     rsp, rbp        ; prologue.
    pop     rbp             ; pop the pointer on rbp.

    ret
