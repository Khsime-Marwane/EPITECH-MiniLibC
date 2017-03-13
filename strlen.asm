[BITS 64]

global  my_strlen

section .text

my_strlen:
    push    rbp                 ; init the my_strlen function
    mov     rbp, rsp            ; move 
    xor     rcx, rcx            ; init the counter

my_strlen_loop:
    mov     al, [rdi]           ; move the value of rdi to al (1 byte)
    cmp     al, 0               ; check if the byte is not NUL
    je      my_strlen_end       ; end of the loop, NUL byte matched
    inc     rcx                 ; increment rcx and rdi
    inc     rdi                 ;
    jmp     my_strlen_loop      ; continue the loop

my_strlen_end:
    mov     rax, rcx            ; Assign rcx to rax (contain the value returned)
    mov     rsp, rbp            ; epilogue
    pop     rbp                 ; pop the pointer on rbp
    ret                         ; return the value
