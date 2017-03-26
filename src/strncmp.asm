;;
;; Author: Marwane Khsime 
;; Date: 2017-03-13 09:52:10 
;;
;; Last Modified by:   Marwane Khsime 
;; Last Modified time: 2017-03-13 09:52:10
;;

[BITS 64]

global  strncmp:function
        ; int   strncmp(const char *s1, const char *s2, size_t n)

section .text

strncmp:
    xor     rcx, rcx        ; init the counter
    cmp     rdx, 0          ;
    je      strncmp_end_error  ;

strncmp_loop:
    mov     al, [rdi]       ; move the value of rdi to al (1 byte), first argument.
    mov     r8b, [rsi]       ; move the value of rsi to r8b (1 byte), second argument.
    cmp     al, r8b          ; compare al and r8b, if they are no equal, jump to end.
    jne     strncmp_end  ;
    cmp     al, 0           ; check if we are at the end of the first string.
    je      strncmp_end  ; if it's true, go to end.
    cmp     r8b, 0           ; check if we are at the end of the second string.
    je      strncmp_end  ; if it's true, go to end.
    inc     rsi             ; increment rdi, rsi, and rcx.
    inc     rdi             ;
    inc     rcx             ;
    cmp     rcx, rdx        ;
    je      strncmp_end  ;
    jmp     strncmp_loop ; loop again.

strncmp_end:
    sub     al, r8b          ; get the difference between the two values.
    movsx   rax, al         ; move al in rax with byte's signe.
    ret

strncmp_end_error:
    mov     rax, 0         ; move al in rax with byte's signe.
    ret
