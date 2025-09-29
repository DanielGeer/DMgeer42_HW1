BITS 32

section .data
startmsg DB 'The Multiplying Program ',0xa
lenstartmsg EQU $ - startmsg
promptmsg DB 'Please enter a single digit number: '
lenpromptmsg EQU $ - promptmsg
answermsg DB 'The answer is: ' 
lenanswermsg EQU $ - answermsg
newlinemsg db 0xa,0xd
lennewlinemsg EQU $ - newlinemsg

section .bss
    num1 RESB 5
    num2 RESB 5
    product RESB 5
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
    mov al, [num1]
    sub byte[num2], '0'
    sub AX, '0'
    imul byte[num2]
    add al, '0'
    mov [product], al
    int 80h 

    ;Finalmsg 
    mov ebx, 1
    mov eax, 4
    mov ecx, answermsg
    mov edx, lenanswermsg
    int 80h
    
    ;print product
    mov eax, 4
    mov ebx, 1
    mov ecx, product
    mov edx, 5
    int 80h

    ;new line
    mov ebx, 1
    mov eax, 4
    mov ecx, newlinemsg
    mov edx, lennewlinemsg
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h

