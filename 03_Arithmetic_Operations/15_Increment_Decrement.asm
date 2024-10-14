; Author: Sharif Yousuf (SharifdotG)
; Program 17 - Increment and Decrement

.model small      ; Use 'small' memory model: code and data fit within 64KB
.stack 100h       ; Reserve 256 bytes (100h) for the stack

.data             ; Begin data segment
msg1 db "Enter first number: $" ; Prompt for the first number
num1 db ?                    ; Declare a byte to store the first number
msg2 db "After increment: $"  ; Message after incrementing
msg3 db "Enter second number: $" ; Prompt for the second number
num2 db ?                    ; Declare a byte to store the second number
msg4 db "After decrement: $"  ; Message after decrementing

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
    sub al, 48    ; Convert ASCII character to integer (e.g., '3' -> 3)
    mov num1, al  ; Store the input number into 'num1'

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

    ; Increment the first number
    mov al, num1  ; Move the first number to 'al'
    inc al        ; Increment the value in 'al'
    mov num1, al  ; Store the incremented value back in 'num1'

    ; Output the incremented number
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    add al, 48    ; Convert back to ASCII (e.g., 3 -> '3')
    mov dl, al    ; Load the incremented number into 'dl'
    int 21h       ; Call DOS interrupt 21h to display the incremented number

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
    
    ; Input the second number
    mov ah, 1     ; Set function number 1 (Input Character from keyboard) in 'ah'
    int 21h       ; Call DOS interrupt 21h to get input character into 'al'
    sub al, 48    ; Convert ASCII character to integer
    mov num2, al  ; Store the input number into 'num2'

    ; Output newline
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, 10    ; Load ASCII value of Line Feed (LF) into 'dl' (move to a new line)
    int 21h       ; Call DOS interrupt 21h to execute the newline
    mov dl, 13    ; Load ASCII value of Carriage Return (CR) into 'dl' (return cursor to the beginning)
    int 21h       ; Call DOS interrupt 21h to execute the carriage return

    ; Output the fourth string (msg4)
    mov ah, 9     ; Set function number 9 (Display String) in 'ah'
    lea dx, msg4  ; Load the address of 'msg4' into 'dx'
    int 21h       ; Call DOS interrupt 21h to display the fourth string
    
    ; Decrement the second number
    mov al, num2  ; Move the second number to 'al'
    dec al        ; Decrement the value in 'al'
    mov num2, al  ; Store the decremented value back in 'num2'

    ; Output the decremented number
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    add al, 48    ; Convert back to ASCII (e.g., 2 -> '2')
    mov dl, al    ; Load the decremented number into 'dl'
    int 21h       ; Call DOS interrupt 21h to display the decremented number

exit:             ; Label for program exit
    mov ah, 4ch   ; Set function number 4Ch (Terminate Program) in 'ah'
    int 21h       ; Call DOS interrupt 21h to terminate the program

main endp         ; End of main procedure

end main          ; End of program, starting execution at 'main'
