;
; file: asm_main.asm

%include "asm_io.inc"
;
; initialized data is put in the .data segment
;
segment .data
msg1 dd "Enter the first value: ",0
msg2 dd "Enter the second value: ",0

; uninitialized data is put in the .bss segment
;
segment .bss
a resd 1
b resd 1

;
; code is put in the .text segment
;
segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
; next print out result message as series of steps
    ;; part 1: does the loob and gives out 2550
        mov eax, 0
        mov ecx, 0
        mov ebx, 101
while:
        add eax, ecx
        add ecx, 2 
        cmp ecx, ebx
        jl while
        call print_int
        call print_nl
;; adding
        mov eax, msg1
        call print_string
        call read_int
        mov [a],eax; move read value into eax
        mov eax, msg2
        call print_string
        call read_int
        mov [b],eax
        
        mov eax,[a]
        mov ecx,[b]
loop_two_start:
        mov eax, ecx
        mul eax
        add ebx,ecx
        inc ecx ;; iterator
        cmp eax, 100 ;; compars value to 100
        jle loop_two_start
        call print_int
        call print_nl
loop_start:
        imul eax,2 ; let eax be k
        sub eax,1 ; 2k-1 sigma will add up all odds where k>0
        call print_int
        call print_nl
        cmp eax,[b] ; let n = [b]
        jl loop_start ;; when less than
        call print_int
        call print_nl

        popa
        mov     eax, 0            ; return back to C
        leave
        ret
