;;
;; Author: Marwane Khsime 
;; Date: 2017-03-14 11:39:17 
;;
;; Last Modified by:   Marwane Khsime 
;; Last Modified time: 2017-03-14 11:39:17
;;

[BITS 64]

global  strcspn:function
        ; size_t strspn(const char *s, const char *accept);

section .text

strcspn:
    xor     r9, r9          ; init counter

strcspn_loop:
    mov     al, [rdi + r9]
    cmp     al, 0                   ; check if we are at the end of the string
    je      strcspn_end          ; if it's true, go to end
    mov     r8, rsi

strcspn_loop_rsi:
    mov     cl, [r8]                ; cl stores the value at the r8's address
    cmp     cl, 0                   ; check if we are at the end of the second string
    je      strcspn_loop_again   ; if it's true, go back to main loop
    cmp     cl, al                  ; compare characters and check if they match
    je      strcspn_end          ; if it's true, go to end
    inc     r8                      ; increment r8
    jmp     strcspn_loop_rsi     ; loop again

strcspn_loop_again:
    inc     r9
    jmp     strcspn_loop

strcspn_end:
    mov     rax, r9
    ret