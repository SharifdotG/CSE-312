; Author: Sharif Yousuf (SharifdotG)
; Program 11 - Three Number Sum

.model small      ; Use 'small' memory model: code and data fit within 64KB
.stack 100h       ; Reserve 256 bytes (100h) for the stack

.data             ; Begin data segment
msg1 db "Enter first number: $" ; Declare first string, ending with '$'
num1 db ?                    ; Declare a byte to store the first number
msg2 db "Enter second number: $" ; Declare second string, ending with '$'
num2 db ?                    ; Declare a byte to store the second
msg3 db "Enter third number: $" ; Declare third string, ending with '$'
num3 db ?                    ; Declare a byte to store the third
msg4 db "The sum is: $" ; Declare fourth string, ending with '$'
sum db ?                    ; Declare a byte to store the sum

.code             ; Begin code segment

main proc         ; Main procedure entry point
    ; Initialize the data segment
    mov ax, @data ; Load the data segment address into 'ax'
    mov ds, ax    ; Move 'ax' into 'ds' to set up the data segment
    
    ; Output the first string (msg1)
    mov ah, 9     ; Set function number 9 (Display String) in 'ah'
    lea dx, msg1  ; Load the address of 'msg1' into 'dx'
    int 21h       ; Call DOS interrupt 21h to display the string

    ; Input the first number
    mov ah, 1     ; Set function number 1 (Input Character from keyboard) in 'ah'
    int 21h       ; Call DOS interrupt 21h to get input character into 'al'
    mov num1, al  ; Store the input character from 'al' into 'num1'

    ; Output newline
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, 10    ; Load ASCII value of Line Feed (LF) into 'dl' (move to a new line)
    int 21h       ; Call DOS interrupt 21h to execute the newline
    mov dl, 13    ; Load ASCII value of Carriage Return (CR) into 'dl' (return cursor to the beginning)
    int 21h       ; Call DOS interrupt 21h to execute the carriage return

    ; Output the second string (msg2)
    mov ah, 9     ; Set function number 9 (Display String) in 'ah'
    lea dx, msg2  ; Load the address of 'msg2' into 'dx'
    int 21h       ; Call DOS interrupt 21h to display the second string

    ; Input the second number
    mov ah, 1     ; Set function number 1 (Input Character from keyboard) in 'ah'
    int 21h       ; Call DOS interrupt 21h to get input character into 'al'
    mov num2, al  ; Store the input character from 'al' into 'num2'

    ; Output newline
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, 10    ; Load ASCII value of Line Feed (LF) into 'dl' (move to a new line)
    int 21h       ; Call DOS interrupt 21h to execute the newline
    mov dl, 13    ; Load ASCII value of Carriage Return (CR) into 'dl' (return cursor to the beginning)
    int 21h       ; Call DOS interrupt 21h to execute the carriage return

    ; Output the third string (msg3)
    mov ah, 9     ; Set function number 9 (Display String) in 'ah'
    lea dx, msg3  ; Load the address of 'msg3' into 'dx'
    int 21h       ; Call DOS interrupt 21h to display the third string

    ; Input the third number
    mov ah, 1     ; Set function number 1 (Input Character from keyboard) in 'ah'
    int 21h       ; Call DOS interrupt 21h to get input character into 'al'
    mov num3, al  ; Store the input character from 'al' into 'num3'

    ; Convert ASCII characters to their numeric values
    mov bl, num1       ; Move first character to BL
    sub bl, 48         ; Convert ASCII to numeric
    mov bh, num2       ; Move second character to BH
    sub bh, 48         ; Convert ASCII to numeric
    mov cl, num3       ; Move third character to CL
    sub cl, 48         ; Convert ASCII to numeric

    ; Calculate the sum of the three numbers
    add bl, bh         ; Add the first two numbers
    add bl, cl         ; Add the third number
    mov sum, bl        ; Store the sum in 'sum'
    
    ; Output newline
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, 10    ; Load ASCII value of Line Feed (LF) into 'dl' (move to a new line)
    int 21h       ; Call DOS interrupt 21h to execute the newline
    mov dl, 13    ; Load ASCII value of Carriage Return (CR) into 'dl' (return cursor to the beginning)
    int 21h       ; Call DOS interrupt 21h to execute the carriage return

    ; Output the fourth string (msg4)
    mov ah, 9     ; Set function number 9 (Display String) in 'ah'
    lea dx, msg4  ; Load the address of 'msg3' into 'dx'
    int 21h       ; Call DOS interrupt 21h to display the third string
    
    ; Output the sum
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, sum   ; Load the value of 'sum' into 'dl'
    add dl, 48    ; Convert the numeric value to its ASCII equivalent
    int 21h       ; Call DOS interrupt 21h to display the character in 'dl'

exit:             ; Label for program exit
    mov ah, 4ch   ; Set function number 4Ch (Terminate Program) in 'ah'
    int 21h       ; Call DOS interrupt 21h to terminate the program

main endp         ; End of main procedure

end main          ; End of program, starting execution at 'main'
