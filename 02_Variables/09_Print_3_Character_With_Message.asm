; Author: Sharif Yousuf (SharifdotG)
; Program 09 - Print 3 Characters with Message

.model small      ; Use 'small' memory model: code and data fit within 64KB
.stack 100h       ; Reserve 256 bytes (100h) for the stack

.data             ; Begin data segment
message1 db "Enter 3 characters: $"   ; Message prompting the user to input 3 characters, ending with '$' for DOS interrupt 21h function 9
var1 db ?         ; Declare variable 'var1' without initialization (for storing first character)
var2 db ?         ; Declare variable 'var2' without initialization (for storing second character)
var3 db ?         ; Declare variable 'var3' without initialization (for storing third character)
message2 db "University Name: $"   ; Message prompting the display of the characters as 'University Name'

.code             ; Begin code segment

main proc         ; Main procedure entry point
    ; Initialize data segment
    mov ax, @data ; Load the address of the data segment into 'ax'
    mov ds, ax    ; Move 'ax' into 'ds' to set the data segment
    
    ; Display the first message to prompt the user for input
    mov ah, 9     ; Set function number 9 (Display String) in 'ah'
    lea dx, message1  ; Load the address of 'message1' into 'dx'
    int 21h       ; Call DOS interrupt 21h to display the string

    ; Input the first character into 'var1'
    mov ah, 1     ; Set function number 1 (Input Character from keyboard) in 'ah'
    int 21h       ; Call DOS interrupt 21h to get input character from keyboard into 'al'
    mov var1, al  ; Move the character from 'al' into 'var1'

    ; Input the second character into 'var2'
    mov ah, 1     ; Set function number 1 again to capture second input
    int 21h       ; Call DOS interrupt 21h to capture second input character into 'al'
    mov var2, al  ; Store the second character in 'var2'

    ; Input the third character into 'var3'
    mov ah, 1     ; Set function number 1 to capture third input
    int 21h       ; Call DOS interrupt 21h to capture third input character into 'al'
    mov var3, al  ; Store the third character in 'var3'

    ; Output a newline (Line Feed and Carriage Return)
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, 10    ; ASCII value for Line Feed (LF) to move the cursor to the next line
    int 21h       ; Call DOS interrupt 21h to move the cursor to a new line
    mov dl, 13    ; ASCII value for Carriage Return (CR) to return cursor to the beginning of the line
    int 21h       ; Call DOS interrupt 21h to execute the carriage return

    ; Display the second message before outputting the entered characters
    mov ah, 9     ; Set function number 9 (Display String) in 'ah'
    lea dx, message2  ; Load the address of 'message2' into 'dx'
    int 21h       ; Call DOS interrupt 21h to display the string

    ; Output the first character stored in 'var1'
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, var1  ; Load the value of 'var1' (first character) into 'dl'
    int 21h       ; Call DOS interrupt 21h to display the character

    ; Output the second character stored in 'var2'
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, var2  ; Load the value of 'var2' (second character) into 'dl'
    int 21h       ; Call DOS interrupt 21h to display the character

    ; Output the third character stored in 'var3'
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, var3  ; Load the value of 'var3' (third character) into 'dl'
    int 21h       ; Call DOS interrupt 21h to display the character
        
exit:             ; Label for program exit
    mov ah, 4ch   ; Set function number 4Ch (Terminate Program) in 'ah'
    int 21h       ; Call DOS interrupt 21h to terminate the program

main endp         ; End of main procedure

end main          ; End of program, starting execution at 'main'
