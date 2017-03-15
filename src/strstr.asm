;;
;; Author: Marwane Khsime 
;; Date: 2017-03-13 10:35:54 
;;
;; Last Modified by:   Marwane Khsime 
;; Last Modified time: 2017-03-13 10:35:54
;;

[BITS 64]

global  my_strstr
        ; char *strstr(const char *haystack, const char *needle);

section .text

my_strstr:
    push    rbp             ; init the my_strstr functioon.
    mov     rbp, rsp        ; move.

my_strstr_main_loop:
    mov     r9b, [rdi]
    cmp     r9b, [rsi]
    je      my_strstr_init_check_match

my_strstr_check_match_stop:
    cmp     r9b, 0
    je      my_strstr_error
    inc     rdi
    jmp     my_strstr_main_loop

;   Reset the counter to 0
;   And check if the needle match with the haystack from rdi index.
my_strstr_init_check_match:
    xor     rcx, rcx

my_strstr_check_match:
    mov     r9b, [rdi + rcx]
    mov     r8b, [rsi + rcx]
    cmp     r8b, 0                      ; if we are at the end of needle (match)
    je      my_strstr_matched
    cmp     r9b, r8b                    ; compare the needle and the haystack byte by byte.
    jne     my_strstr_check_match_stop  ; if it doesn't match, stop the loop and resume main loop.
    inc     rcx
    jmp     my_strstr_check_match       ; iterate the loop

my_strstr_matched:
    mov rax, rdi                        ; move the pointer of rdi in rax (will be returned)
    jmp my_strstr_end

my_strstr_error:
    mov     rax, 0

my_strstr_end:
    mov     rsp, rbp                ; epilogue
    pop     rbp                     ; pop the pointer on rbp
    ret     0                       ; return the value