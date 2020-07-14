;
;Name: Joshua Santillan
;Date: 9/20/19
;Description: calling functions using registers and types
; file: asm_main.asm


%include "asm_io.inc"
;
; initialized data is put in the .data segment
;
segment .data

string1    dd "test",0
char1    dd "j"
num1    dd 6

; uninitialized data is put in the .bss segment
;
segment .bss
name2 resd 1
;
; code is put in the .text segment
;
segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
; next print out result message as series of steps
        mov eax,string1
        call print_string
        call print_nl
        
        mov eax,[char1]
        call print_char
        call print_nl
        
        mov eax,[num1]
        call print_int
        call print_nl
        
        
        call read_int ; will read the next input
        call print_nl
        popa
        mov     eax, 0            ; return back to C
        leave
        ret
