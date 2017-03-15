;;
;; Author: Marwane Khsime 
;; Date: 2017-03-14 11:39:17 
;;
;; Last Modified by:   Marwane Khsime 
;; Last Modified time: 2017-03-14 11:39:17
;;

[BITS 64]

global  my_strpbrk
        ; size_t strspn(const char *s, const char *accept);

section .text

my_strpbrk:
    push    rbp             ; init my_strpbrk header
    mov     rbp, rsp        ;
    xor     r9, r9          ; init counter

my_strpbrk_loop:
    mov     al, [rdi + r9]
    cmp     al, 0                   ; check if we are at the end of the string
    je      my_strpbrk_end_error    ; if it's true, so we don't have found a character of 'accept' in s, go to end err
    mov     r8, rsi

my_strpbrk_loop_rsi:
    mov     cl, [r8]                ; cl stores the value at the r8's address
    cmp     cl, 0                   ; check if we are at the end of the second string
    je      my_strpbrk_loop_again   ; if it's true, go back to main loop
    cmp     cl, al                  ; compare characters and check if they match
    je      my_strpbrk_end_success  ; if it's true, go to end
    inc     r8                      ; increment r8
    jmp     my_strpbrk_loop_rsi     ; loop again

my_strpbrk_loop_again:
    inc     r9
    jmp     my_strpbrk_loop

my_strpbrk_end_success:
    add     rdi, r9
    mov     rax, rdi
    jmp     my_strpbrk_end

my_strpbrk_end_error:
    mov     rax, 0
    jmp     my_strpbrk_end

my_strpbrk_end:
    mov     rsp, rbp
    pop     rbp
    ret