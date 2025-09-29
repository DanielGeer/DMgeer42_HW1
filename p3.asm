BITS 32

section .data
startmsg DB 'The Dividing Program ',0xa
lenstartmsg EQU $ - startmsg
promptmsg DB 'Please enter a single digit number: '
lenpromptmsg EQU $ - promptmsg
answermsg DB 'The quotient is: '
lenanswermsg EQU $ - answermsg
remaindermsg DB 'The remainder is: '
lenremaindermsg EQU $ - answermsg
newlinemsg db 0xa
lennewlinemsg EQU $ - newlinemsg

section .bss
    num1 RESB 5
    num2 RESB 5
    quotient RESB 5
    remainder RESB 5
section .text
global _start
_start:     
    ;title
    mov ebx, 1
    mov eax, 4
    mov ecx, startmsg
    mov edx, lenstartmsg
    int 80h

    ;1st prompt
    mov ebx, 1
    mov eax, 4
    mov ecx, promptmsg
    mov edx, lenpromptmsg
    int 80h

    ;Read 1st digit
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 5
    int 80h

    ;2nd prompt
    mov ebx, 1
    mov eax, 4
    mov ecx, promptmsg
    mov edx, lenpromptmsg
    int 80h
    
    ;Read 2nd digit
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 5
    int 80h

    ;Answer
    mov edx, 0
    mov al, [num1]
    sub byte[num2], '0'
    sub ax, '0'
    idiv byte[num2]
    add al, '0'
    add ah, '0'
    mov [quotient], al
    mov [remainder], ah
    int 80h 

    ;Finalmsg for quotient
    mov ebx, 1
    mov eax, 4
    mov ecx, answermsg
    mov edx, lenanswermsg
    int 80h
    
    ;print quotient
    mov eax, 4
    mov ebx, 1
    mov ecx, quotient
    mov edx, 5
    int 80h

    ;new line
    mov ebx, 1
    mov eax, 4
    mov ecx, newlinemsg
    mov edx, lennewlinemsg
    int 80h

    ;Finalmsg for remainder
    mov ebx, 1
    mov eax, 4
    mov ecx, remaindermsg
    mov edx, lenremaindermsg
    int 80h
    
    ;print remainder
    ;mov eax, 4
    ;mov ebx, 1
    ;mov ecx, num2
    ;mov edx, 5
    ;int 80h

    ;new line
    mov ebx, 1
    mov eax, 4
    mov ecx, newlinemsg
    mov edx, lennewlinemsg
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h

