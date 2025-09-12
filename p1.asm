BITS 32

section .data
startmsg db 'The Adding Program'
promptmsg db 'Please enter a single digit number: '
answermsg db 'The answer is: '
lenstartmsg equ $ - startmsg
lenpromptmsg equ $ - promptmsg
len equ $ - answermsg

section .bss
    num1 RESB 5
    num2 RESB 5
    sum RESB 5
section .text
global _start
_start:     ;title
    mov edx, lenstartmsg
    mov ecx, startmsg
    mov ebx, 1
    mov eax, 4
    int 80h
    ;1st prompt
    mov edx, lenpromptmsg
    mov ecx, promptmsg
    mov ebx, 1
    mov eax, 4
    int 80h
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 5

    ;2nd prompt
    mov edx, lenpromptmsg
    mov ecx, promptmsg
    mov ebx, 1
    mov eax, 4
    int 80h

    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 5
    int 80h
    mov eax, 4
    mov ebx, 1
    mov ecx, num1
    mov edx,5
    int 80h

    mov eax,1
    mov ebx,0
    int 80h

