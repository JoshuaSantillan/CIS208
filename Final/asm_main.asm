; File: asm_main.asm
; Author: Joshua Santillan
; Date: Dec 10, 2019
; description: Final Project, create a program that will manipulate arrays without changing the original
%include "asm_io.inc"
;
; initialized data is put in the .data segment
;
segment .data
        a1 dd 180, 32, 455, 499, 388, 480, 239, 346, 257,84
        arrlength dd 10
        scale dd 10
        a2 dd 0 , 0 , 0 , 0 , 0, 0 , 0, 0, 0, 0
        a3 dd 0 , 0 , 0 , 0 , 0, 0 , 0, 0, 0, 0
        a4 dd 0 , 0 , 0 , 0 , 0, 0 , 0, 0, 0, 0
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
        mov eax, a1
        mov ebx, [scale]
        mov ecx, [arrlength]
        push eax
        push ebx
        push ecx
        call array_scalar
        call array_add
        pop ecx
        pop ebx
        pop eax

        mov eax, a1
        mov ebx, a3
        mov ecx,[arrlength]
        push eax
        push ebx
        push ecx
        call onethree
        pop ecx
        pop ebx
        pop eax

        mov ecx, [arrlength]
        mov edx, 0
printloop: ;; prints valus of array
        mov eax, [a1+edx]
        call print_int
        mov eax, " "
        call print_char
        add edx, 4
        loop printloop
        
        call print_nl
        mov ecx, [arrlength]
        mov edx, 0
printloop2: ;; prints valus of array
        mov eax, [a2+edx]
        call print_int
        mov eax, " "
        call print_char
        add edx, 4
        loop printloop2

        call print_nl
        mov ecx, [arrlength]
        mov edx, 0
printloop3: ;; prints valus of array
        mov eax, [a3+edx]
        call print_int
        mov eax, " "
        call print_char
        add edx, 4
        loop printloop3

        call print_nl
        mov ecx, [arrlength]
        mov edx, 0
printloop4: ;; prints valus of array
        mov eax, [a4+edx]
        call print_int
        mov eax, " "
        call print_char
        add edx, 4
        loop printloop4
        call print_nl
; *********** End Assignment Code **********************

        popa
        mov     eax, 0
        leave                     
        ret
array_scalar:
        push    ebp
        mov     ebp,esp

        cld
        mov ecx, [ebp +8]
        mov ebx, [ebp +12]
        mov esi, [ebp + 16]
        mov edi, a3

    loop2:
        mov edx,[esi]
        imul edx, ebx
        mov eax,edx
        stosd
        lodsd
        loop loop2
        pop ebp
        ret
array_add:
        push    ebp
        mov     ebp,esp

        cld
        mov ecx, [ebp +8]
        mov ebx, [ebp +12]
        mov esi, [ebp + 16]
        mov edi, a2

    loop1:
        mov edx,[esi]
        add edx, ebx
        mov eax,edx
        stosd
        lodsd
        loop loop1

        pop ebp
        ret

onethree:
        push    ebp
        mov     ebp,esp

        cld
        mov ecx, [ebp +8]
        mov ebx, [ebp +12]
        mov esi, [ebp + 16]
        mov edi, a4
    loop4:
        mov edx, [esi]
        add edx, [ebx]
        mov eax, edx
        stosd 
        lodsd
        add ebx, 4
        loop loop4
       
        pop ebp
        ret
