; Author: Sharif Yousuf (SharifdotG)
; Program 16 - Compare 2 Numbers

.model small      ; Use 'small' memory model: code and data fit within 64KB
.stack 100h       ; Reserve 256 bytes (100h) for the stack

.data             ; Begin data segment
msg1 db "Enter first number: $" ; Declare and initialize a string message
num1 db ?                    ; Declare a byte to store the first number
msg2 db "Enter second number: $" ; Declare and initialize a string message
num2 db ?                    ; Declare a byte to store the second number
msg3 db "The numbers are equal.$" ; Message for equal numbers
msg4 db "The first number is greater.$" ; Message for first number greater
msg5 db "The second number is greater.$" ; Message for second number greater

.code             ; Begin code segment

main proc         ; Main procedure entry point
    ; Initialize data segment
    mov ax, @data ; Load the data segment address into 'ax'
    mov ds, ax    ; Move 'ax' into 'ds' to set up data segment
    
    ; Output the first string (msg1)
    mov ah, 9     ; Set function number 9 (Display String) in 'ah'
    lea dx, msg1  ; Load the address of 'msg1' into 'dx'
    int 21h       ; Call DOS interrupt 21h to display the string

    ; Input the first number
    mov ah, 1     ; Set function number 1 (Input Character from keyboard) in 'ah'
    int 21h       ; Call DOS interrupt 21h to get input character into 'al'
    sub al, 48    ; Convert ASCII to numeric value (0-9)
    mov num1, al  ; Store the input character from 'al' into 'num1'

    ; Output newline
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, 10    ; Load ASCII value of Line Feed (LF) into 'dl'
    int 21h       ; Execute newline
    mov dl, 13    ; Load ASCII value of Carriage Return (CR) into 'dl'
    int 21h       ; Execute carriage return

    ; Output the second string (msg2)
    mov ah, 9     ; Set function number 9 (Display String) in 'ah'
    lea dx, msg2  ; Load the address of 'msg2' into 'dx'
    int 21h       ; Call DOS interrupt 21h to display the string

    ; Input the second number
    mov ah, 1     ; Set function number 1 (Input Character from keyboard) in 'ah'
    int 21h       ; Call DOS interrupt 21h to get input character into 'al'
    sub al, 48    ; Convert ASCII to numeric value (0-9)
    mov num2, al  ; Store the input character from 'al' into 'num2'

    ; Output newline
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, 10    ; Load ASCII value of Line Feed (LF) into 'dl'
    int 21h       ; Execute newline
    mov dl, 13    ; Load ASCII value of Carriage Return (CR) into 'dl'
    int 21h       ; Execute carriage return

    ; Compare the two numbers
    mov bl, num1     ; Move first number to BL
    mov bh, num2     ; Move second number to BH
    cmp bl, bh       ; Compare the two numbers
    je equal         ; If equal, jump to 'equal' label
    jg greater1      ; If first number is greater, jump to 'greater1' label
    jl greater2      ; If second number is greater, jump to 'greater2' label

equal:           ; Label for equal numbers
    ; Output the equal message (msg3)
    mov ah, 9     ; Set function number 9 (Display String) in 'ah'
    lea dx, msg3  ; Load the address of 'msg3' into 'dx'
    int 21h       ; Call DOS interrupt 21h to display the string
    jmp exit      ; Jump to 'exit' label to terminate the program

greater1:        ; Label for first number greater
    ; Output the first greater message (msg4)
    mov ah, 9     ; Set function number 9 (Display String) in 'ah'
    lea dx, msg4  ; Load the address of 'msg4' into 'dx'
    int 21h       ; Call DOS interrupt 21h to display the string
    jmp exit      ; Jump to 'exit' label to terminate the program

greater2:        ; Label for second number greater
    ; Output the second greater message (msg5)
    mov ah, 9     ; Set function number 9 (Display String) in 'ah'
    lea dx, msg5  ; Load the address of 'msg5' into 'dx'
    int 21h       ; Call DOS interrupt 21h to display the string
        
exit:             ; Label for program exit
    mov ah, 4ch   ; Set function number 4Ch (Terminate Program) in 'ah'
    int 21h       ; Call DOS interrupt 21h to terminate the program

main endp         ; End of main procedure

end main          ; End of program, starting execution at 'main'
