;;
;; Author: Marwane Khsime 
;; Date: 2017-03-14 11:39:17 
;;
;; Last Modified by:   Marwane Khsime 
;; Last Modified time: 2017-03-14 11:39:17
;;

[BITS 64]

global  my_strcspn
        ; size_t strspn(const char *s, const char *accept);

section .text

my_strcspn:
    push    rbp             ; init my_strcspn header
    mov     rbp, rsp        ;
    xor     r9, r9          ; init counter

my_strcspn_loop:
    mov     al, [rdi + r9]
    cmp     al, 0                   ; check if we are at the end of the string
    je      my_strcspn_end          ; if it's true, go to end
    mov     r8, rsi

my_strcspn_loop_rsi:
    mov     cl, [r8]                ; cl stores the value at the r8's address
    cmp     cl, 0                   ; check if we are at the end of the second string
    je      my_strcspn_loop_again   ; if it's true, go back to main loop
    cmp     cl, al                  ; compare characters and check if they match
    je      my_strcspn_end          ; if it's true, go to end
    inc     r8                      ; increment r8
    jmp     my_strcspn_loop_rsi     ; loop again

my_strcspn_loop_again:
    inc     r9
    jmp     my_strcspn_loop

my_strcspn_end:
    mov     rax, r9
    mov     rsp, rbp
    pop     rbp
    ret