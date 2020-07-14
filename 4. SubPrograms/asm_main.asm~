;
; file: asm_main.asm
; Description: Subprogram project
; Author: Joshua Santillan
; Date: November, 23, 2019

%include "asm_io.inc"
;
; initialized data is put in the .data segment
;
segment .data
a: dd 923471
b: dd 8


; uninitialized data is put in the .bss segment
;
segment .bss
input1 resd 1

;
; code is put in the .text segment
;
segment .text
        global  asm_main
asm_main:
        enter   0,0		; setup routine
        pusha
; assembly code begins here.
	mov	eax,[a]
	mov	ebx,[b]
	push	eax
	push	ebx
	call	check_digit
        call print_nl
        call print_int
        call print_nl
	pop	eax
	pop	ebx
; assembly code ends here.
        popa
        mov     eax, 0		; return back to C
        leave
        ret

check_digit:
	push	ebp		; save originaleEBP value on stack
	mov	ebp,esp		; new EBP = ESP
; subprogram code begins here
	mov	eax,[ebp + 12]	; eax is now pushed eax
	mov	ebx,[ebp + 8]	; ebx is now pushed ebx
	call	print_int
	call 	print_nl
        mov     ecx, 10
        while:
            cmp     eax, ebx
            cdq 
            je if_equal
            div     ecx
            cmp     eax,0
            jg      while
            jmp     not_equal
        if_equal:
            mov     eax,1
            jmp     endwhile
        not_equal:
            mov     eax,0
        endwhile:
; subprogram code ends here
	pop	ebp
	ret


