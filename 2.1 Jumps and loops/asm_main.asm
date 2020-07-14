;name: joshua santillan
; description: using if else statements and a loop
; file: asm_main.asm
; date: 10/14/19
%include "asm_io.inc"
;
; initialized data is put in the .data segment
;
segment .data

part1 db "Comparison using jumps :",0
part2 db "Iterating 1-10 :", 0
one_je db "equal values using ==",0
two_jne db "not operator ", 0
three_jl db "less than operator",0
four_jle db "less than or equal to operator",0
five_jg db "greater than operator",0
six_jge db "greater than or equal to operator",0
if_true db "conditon was true",0
if_false db "condition was false",0
a dd 0
b dd 0
c dd 10
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
; next print out result message as series of steps
        mov eax, part1
        call print_string
        call print_nl

        ; 0==0
        ;je
        
        mov eax, 0
        mov ebx, 0
        
        cmp eax,ebx ; compare the two values to see if equal
        je thenblock1
        mov eax, if_false
        call print_string
        mov eax, 0
        call print_int
        call print_nl
        jmp next1
thenblock1:
        mov eax, if_true
        call print_string
        mov eax, one_je
        call print_string
        call print_nl
next1:
    ; 1 != 0 (jne block)
    mov eax, 0
    mov ebx, 1
    cmp eax, ebx
    jne thenblock2
    mov eax, if_false
    call print_string
    mov eax, 0
    call print_int
    call print_nl
    jmp next2
thenblock2:
    mov eax, if_true
    call print_string
    mov eax, two_jne
    call print_string
    call print_nl
next2:
    ;1<2 (jl)
    mov eax, 1
    mov eax, 2

    cmp eax,ebx
    jl thenblock3
    mov eax, if_false
    call print_string
    mov eax, 1
    call print_int
    call print_nl
    jmp next3
thenblock3:
        mov eax, if_true
        call print_string
        mov eax, three_jl
        call print_string
        call print_nl
next3:
    ; 1<=2
    mov eax, 1
    mov ebx, 2

    cmp eax,ebx
    jle thenblock4
    mov eax, if_false
    call print_string
    mov eax, 1
    call print_int
    call print_nl
    jmp next4
thenblock4:
    mov eax, if_false
    call print_string
    mov eax, four_jle
    call print_string
    call print_nl
next4:
    ;3>2 (greater than)
    mov eax, 3
    mov eax, 2

    cmp eax, ebx
    jg thenblock5
    mov eax, if_false
    call print_string
    mov eax, 3
    call print_int
    call print_nl
    jmp next5
thenblock5:
        mov eax, if_false
        call print_string
        mov eax, five_jg
        call print_string
        call print_nl
next5:
        ; 1>=0 greater equal
        mov eax, 1
        mov ebx, 0
        cmp eax,ebx
        jge thenblock6
        mov eax, if_false
        call print_string
        mov eax, 1
        call print_int
        call print_nl
thenblock6:
    mov eax, if_false
    call print_string
    mov eax, six_jge
    call print_string
    call print_nl

    
; *** The Following is my Loop *** ;
        mov eax, part2
        call print_string
        call print_nl
        mov eax,[a] ; the sum
        mov ecx,[c] ; this is i

loop_start:
    add eax,1       ; add 1 to a each iteration
    call print_int
    call print_nl
    loop loop_start
        popa
        mov     eax, [a]            ; return back to C
        leave
        ret
