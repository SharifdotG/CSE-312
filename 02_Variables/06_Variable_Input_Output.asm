; Author: Sharif Yousuf (SharifdotG)
; Program 06 - Variable Input and Output

.model small      ; Use 'small' memory model: code and data fit within 64KB
.stack 100h       ; Reserve 256 bytes (100h) for the stack

.data             ; Begin data segment
var1 db ?         ; Declare variable 'var1' without initializing it
var2 db ?         ; Declare variable 'var2' without initializing it

.code             ; Begin code segment

main proc         ; Main procedure entry point
    ; Initialize data segment
    mov ax, @data ; Load the data segment address into 'ax'
    mov ds, ax    ; Move 'ax' into 'ds' to set up data segment

    ; Input first variable 'var1'
    mov ah, 1     ; Set function number 1 (Input Character from keyboard) in 'ah'
    int 21h       ; Call DOS interrupt 21h to get input character into 'al'
    mov var1, al  ; Store the input character from 'al' into 'var1'

    ; Input second variable 'var2'
    mov ah, 1     ; Set function number 1 (Input Character from keyboard) in 'ah'
    int 21h       ; Call DOS interrupt 21h to get input character into 'al'
    mov var2, al  ; Store the input character from 'al' into 'var2'

    ; Output newline
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, 10    ; ASCII value of Line Feed (LF, new line)
    int 21h       ; Call DOS interrupt 21h to move to a new line
    mov dl, 13    ; ASCII value of Carriage Return (CR)
    int 21h       ; Call DOS interrupt 21h to return the cursor to the beginning of the line

    ; Output first variable 'var1'
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, var1  ; Load the value of 'var1' into 'dl'
    int 21h       ; Call DOS interrupt 21h to display the character in 'dl'

    ; Output newline
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, 10    ; ASCII value of Line Feed (LF, new line)
    int 21h       ; Call DOS interrupt 21h to move to a new line
    mov dl, 13    ; ASCII value of Carriage Return (CR)
    int 21h       ; Call DOS interrupt 21h to return the cursor to the beginning of the line

    ; Output second variable 'var2'
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, var2  ; Load the value of 'var2' into 'dl'
    int 21h       ; Call DOS interrupt 21h to display the character in 'dl'
        
exit:             ; Label for program exit
    mov ah, 4ch   ; Set function number 4Ch (Terminate Program) in 'ah'
    int 21h       ; Call DOS interrupt 21h to terminate the program

main endp         ; End of main procedure

end main          ; End of program, starting execution at 'main'
