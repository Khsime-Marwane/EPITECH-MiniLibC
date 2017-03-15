;;
;; Author: Marwane Khsime 
;; Date: 2017-03-13 09:52:10 
;;
;; Last Modified by:   Marwane Khsime 
;; Last Modified time: 2017-03-13 09:52:10
;;

[BITS 64]

global  my_strcasecmp
                            ; int   my_strcasecmp(const char *, const char *)

section .text

my_strcasecmp:
    push    rbp             ; init the my_strcasecmp functioon.
    mov     rbp, rsp        ; move.

my_strcasecmp_loop:
    mov     al, [rdi]                   ; move the value of rdi to al (1 byte), first argument.
    mov     bl, [rsi]                   ; move the value of rsi to bl (1 byte), second argument.
    cmp     al, bl                      ; compare al and bl, if they are no equal, call check cases.
    jne     my_strcasecmp_check_cases   ; => check cases function check the character with case sensible option
    cmp     al, 0                       ; check if we are at the end of the first string.
    je      my_strcasecmp_end           ; if it's true, go to end.
    cmp     bl, 0                       ; check if we are at the end of the second string.
    je      my_strcasecmp_end           ; if it's true, go to end.
    inc     rsi                         ; increment rdi and rsi.
    inc     rdi                         ;
    jmp     my_strcasecmp_loop          ; loop again.

my_strcasecmp_check_cases:
    cmp     al, bl
    jl      my_strcasecmp_check_case_one        ;    if al < bl
    jmp     my_strcasecmp_check_case_two        ;    if al > bl

;   if the second character is lower than the second
;
my_strcasecmp_check_case_one:
    cmp     bl, 97              ; check if bl is a letter
    jl      my_strcasecmp_end   ;
    cmp     bl, 122             ;
    jg      my_strcasecmp_end   ;
    sub     bl, 32              ; if it's true, sub bl to get the upper letter
    jmp     my_strcasecmp_end   ; go to end

;   if the first character is lower than the second
;
my_strcasecmp_check_case_two:
    cmp     al, 97              ; check if al is a letter
    jl      my_strcasecmp_end   ;
    cmp     al, 122             ;
    jg      my_strcasecmp_end   ;
    sub     al, 32              ; if it's true, sub al to get the upper letter
    jmp     my_strcasecmp_end   ; go to end

my_strcasecmp_end:
    sub     al, bl          ; get the difference between the two values.
    movsx   rax, al         ; move al in rax with byte's signe.

    mov     rsp, rbp        ; prologue.
    pop     rbp             ; pop the pointer on rbp.
    ret
