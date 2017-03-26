;;
;; Author: Marwane Khsime 
;; Date: 2017-03-13 10:35:54 
;;
;; Last Modified by:   Marwane Khsime 
;; Last Modified time: 2017-03-13 10:35:54
;;

[BITS 64]

global  strstr:function
        ; char *strstr(const char *haystack, const char *needle);

section .text

strstr:
    mov     r9b, [rsi]
    cmp     r9b, 0
    je      strstr_matched

strstr_main_loop:
    mov     r9b, [rdi]
    cmp     r9b, [rsi]
    je      strstr_init_check_match

strstr_check_match_stop:
    cmp     r9b, 0
    je      strstr_error
    inc     rdi
    jmp     strstr_main_loop

;   Reset the counter to 0
;   And check if the needle match with the haystack from rdi index.
strstr_init_check_match:
    xor     rcx, rcx

strstr_check_match:
    mov     r9b, [rdi + rcx]
    mov     r8b, [rsi + rcx]
    cmp     r8b, 0                      ; if we are at the end of needle (match)
    je      strstr_matched
    cmp     r9b, r8b                    ; compare the needle and the haystack byte by byte.
    jne     strstr_check_match_stop  ; if it doesn't match, stop the loop and resume main loop.
    inc     rcx
    jmp     strstr_check_match       ; iterate the loop

strstr_matched:
    mov rax, rdi                        ; move the pointer of rdi in rax (will be returned)
    jmp strstr_end

strstr_error:
    mov     rax, 0

strstr_end:
    ret     0                       ; return the value