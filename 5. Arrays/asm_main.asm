;
; File: asm_main.asm
; Author: Joshua Santillan
; Date: Nov 28, 2019
; description: Create an array of integers and multiply it by some scalar
%include "asm_io.inc"
;
; initialized data is put in the .data segment
;
segment .data
        arr dd 0, 1, 2, 3, 4 
        arrlength dd 5
        input db "Choose a scalar to multiply by: ", 0


; uninitialized data is put in the .bss segment
;
segment .bss
        scalar resd 1 
;
; code is put in the .text segment
;
segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
        ; address/length of array being pushed
        mov eax, arr
        push eax
        mov eax, [arrlength]
        push eax
        
        mov eax, input
        call print_string
        call read_int               ;read in input from user to multiply by 
        push eax

        call mult_arr
        pop eax
        pop eax
        pop eax

        mov ecx, [arrlength]
        mov edx, 0
printloop: ;; prints valus of array
        mov eax, [arr+edx]
        call print_int
        call print_nl
        add edx, 4
        loop printloop


; *********** End Assignment Code **********************

        popa
        mov     eax, 0
        leave                     
        ret

mult_arr:
        push ebp
        mov ebp, esp
        mov ebx, [ebp+16]
        mov ecx, [ebp+12]
        mov edx, 0
    scalarloop:
            mov eax, [ebx + edx]
            imul eax, [ebp+8] ; multiply array position by read in sclar and go to next position.
            mov [ebx+ edx], eax
            add edx, 4
            loop scalarloop



        pop ebp
        ret
