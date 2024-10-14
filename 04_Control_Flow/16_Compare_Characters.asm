; Author: Sharif Yousuf (SharifdotG)
; Program 15 - Compare Characters

.model small      ; Use 'small' memory model: code and data fit within 64KB
.stack 100h       ; Reserve 256 bytes (100h) for the stack

.data             ; Begin data segment
msg1 db "Enter a character: $"               ; Prompt message for user input
var1 db ?                                     ; Declare variable 'var1' without initializing it
msg2 db "You entered 'a' or 'A' character.$"  ; Message for valid input
msg3 db "You did not enter 'a' or 'A' character.$" ; Message for invalid input

.code             ; Begin code segment

main proc         ; Main procedure entry point
    ; Initialize the data segment
    mov ax, @data ; Load the data segment address into 'ax'
    mov ds, ax    ; Move 'ax' into 'ds' to set up the data segment

    ; Display the prompt message to the user
    mov ah, 9     ; Set function number 9 (Display String) in 'ah'
    lea dx, msg1  ; Load the address of 'msg1' into 'dx'
    int 21h       ; Call DOS interrupt 21h to display the prompt string

    ; Input the character into 'var1'
    mov ah, 1     ; Set function number 1 (Input Character from keyboard) in 'ah'
    int 21h       ; Call DOS interrupt 21h to get input character from keyboard into 'al'
    mov var1, al  ; Move the character from 'al' into 'var1'

    ; Output newline (Line Feed and Carriage Return)
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, 10    ; Load ASCII value for Line Feed (LF) to move the cursor to the next line
    int 21h       ; Call DOS interrupt 21h to execute Line Feed
    mov dl, 13    ; Load ASCII value for Carriage Return (CR) to return cursor to the beginning of the line
    int 21h       ; Call DOS interrupt 21h to execute Carriage Return

    ; Check if the entered character is 'a' or 'A'
    cmp var1, 'a' ; Compare the entered character with 'a'
    je  is_a      ; Jump to 'is_a' if the character is 'a'
    cmp var1, 'A' ; Compare the entered character with 'A'
    je  is_a      ; Jump to 'is_a' if the character is 'A'
    jmp not_a     ; Jump to 'not_a' if the character is not 'a' or 'A'

is_a:
    ; Display the message for 'a' or 'A' character
    mov ah, 9     ; Set function number 9 (Display String) in 'ah'
    lea dx, msg2  ; Load the address of 'msg2' into 'dx'
    int 21h       ; Call DOS interrupt 21h to display the valid input message
    jmp exit      ; Jump to 'exit' to terminate the program

not_a:
    ; Display the message for characters other than 'a' or 'A'
    mov ah, 9     ; Set function number 9 (Display String) in 'ah'
    lea dx, msg3  ; Load the address of 'msg3' into 'dx'
    int 21h       ; Call DOS interrupt 21h to display the invalid input message
        
exit:             ; Label for program exit
    mov ah, 4ch   ; Set function number 4Ch (Terminate Program) in 'ah'
    int 21h       ; Call DOS interrupt 21h to terminate the program

main endp         ; End of main procedure

end main          ; End of program, starting execution at 'main'
