; Author: Sharif Yousuf (SharifdotG)
; Program 14 - Sum, Subtraction, and Multiplication Problem

; a = 9, b = 3, c = 2, d = 2, e = 1
; Calculate the following expression:
; a - b * c + d * e = 9 - 3 * 2 + 2 * 1 = 9 - 6 + 2 = 5

.model small      ; Use 'small' memory model: code and data fit within 64KB
.stack 100h       ; Reserve 256 bytes (100h) for the stack

.data             ; Begin data segment
a db 9            ; Define variable 'a' with initial value 9
b db 3            ; Define variable 'b' with initial value 3
c db 2            ; Define variable 'c' with initial value 2
d db 2            ; Define variable 'd' with initial value 2
e db 1            ; Define variable 'e' with initial value 1
msg db 'Result: $' ; Define variable 'msg' to store the message
result db ?       ; Define variable 'result' to store the final result

.code             ; Begin code segment

main proc         ; Main procedure entry point
    ; Initialize the data segment
    mov ax, @data ; Load the data segment address into 'ax'
    mov ds, ax    ; Move 'ax' into 'ds' to set up the data segment

    ; Calculate the expression: a - b * c + d * e
    mov al, b     ; Move the value of 'b' into 'al'
    mov bl, c     ; Move the value of 'c' into 'bl'
    mul bl        ; Multiply 'al' by 'bl' (result in 'AX')
    mov bl, al    ; Move the result of 'b * c' into 'bl'

    mov al, a     ; Move the value of 'a' into 'al'
    sub al, bl    ; Subtract 'b * c' from 'a' (result in 'al')

    mov cl, d     ; Move the value of 'd' into 'cl'
    mov bl, e     ; Move the value of 'e' into 'bl'
    mul bl        ; Multiply 'al' by 'bl' (result in 'AX')
    
    ; Add the previous result to d * e
    add al, cl    ; Add 'd' (the value in CL) to 'al'
    ; Note: Since d and e are small, we can directly add them without worrying about overflow.

    mov result, al ; Move the final result into 'result'

    ; Output the message string
    mov ah, 9     ; Set function number 9 (Display String) in 'ah'
    lea dx, msg   ; Load the address of 'msg' into 'dx'
    int 21h       ; Call DOS interrupt 21h to display the message

    ; Output the result
    mov dl, result ; Move the result into 'dl'
    add dl, 48     ; Convert the result to ASCII
    mov ah, 2      ; Set function number 2 (Display Character) in 'ah'
    int 21h        ; Call DOS interrupt 21h to display the result

exit:             ; Label for program exit
    mov ah, 4ch   ; Set function number 4Ch (Terminate Program) in 'ah'
    int 21h       ; Call DOS interrupt 21h to terminate the program

main endp         ; End of main procedure

end main          ; End of program, starting execution at 'main'
