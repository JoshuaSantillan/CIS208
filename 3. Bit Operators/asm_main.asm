;
; name: Joshua Santillan
; file: asm_main.asm
; date: Nov 3, 2019
; desc: using bitwise operators to shift

%include "asm_io.inc"
;
; initialized data is put in the .data segment
;
segment .data
        syswrite: equ 4
        stdout: equ 1
        exit: equ 1
        SUCCESS: equ 0
        kernelcall: equ 80h



; uninitialized data is put in the .bss segment
;
segment .bss

;
; code is put in the .text segment
;
segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
; *********** Start  Assignment Code *******************
    mov     eax, 2
    call    print_int
    call    print_nl
    mov     ecx, 30
start_loop:
    shl     eax, 1
    call    print_int
    call    print_nl
    loop    start_loop
; *********** End Assignment Code **********************

        popa
        mov     eax, SUCCESS       ; return back to the C program
        leave                     
        ret


