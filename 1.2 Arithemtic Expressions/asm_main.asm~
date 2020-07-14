;Name: Joshua Santillan
;Date: 9/18/19
;Description: Adds registers and subtracts
; file: asm_main.asm

%include "asm_io.inc"
;
; initialized data is put in the .data segment
;
segment .data

A: dd 1
B: dd 2
C: dd 3
D: dd 4
; uninitialized data is put in the .bss segment
;
segment .bss
;b1: would be a label
;
; code is put in the .text segment
;
segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
; next print out result message as series of steps
        mov     eax,[A]; move a to register eax
        sub     eax,[B] ; Sub B from eax reg
        mov     ebx,[B]; move B into ebx reg
        sub     ebx,[C] ; sub C from ebc
        add     ebx,[D]; add D to ebx
        add     eax,[A] ; add A to eax
        add     eax,ebx; add two registers ( the partnethesis )
        call    print_int
        call    print_nl
        popa
        mov     eax, 0            ; return back to C
        leave
        ret
