;;
;; Author: Marwane Khsime 
;; Date: 2017-03-26 00:27:28 
;;
;; Last Modified by:   Marwane Khsime 
;; Last Modified time: 2017-03-26 00:27:28
;;

[BITS 64]
global strcasecmp:function

section .text

strcasecmp:
	jmp strcasecmp_get_first

strcasecmp_low1:
	add al, 32					; decrement first char
	jmp strcasecmp_get_second

strcasecmp_low2:
	add r8b, 32
	jmp strcasecmp_compare		; decrement second char

strcasecmp_get_first:
	mov al, [rdi]
	cmp al, 65
	jl strcasecmp_get_second
	cmp al, 90
	jl strcasecmp_low1

strcasecmp_get_second:
	mov r8b, [rsi]
	cmp r8b, 65
	jl strcasecmp_compare
	cmp r8b, 90
	jl strcasecmp_low2

strcasecmp_compare:
	cmp al, r8b					; check if chars are different
	jne end						; if it's true, go to end
	cmp al, 0					; check if we are at the end of the first string
	je end						; if it's true, go to end
	cmp r8b, 0					; same here
	je end						;
	inc rsi
	inc rdi
	jmp strcasecmp_get_first	; loop again

end:
	sub al, r8b
	movsx rax, al
	ret