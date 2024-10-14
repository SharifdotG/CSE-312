; Author: Sharif Yousuf (SharifdotG)
; Program 05 - Variable Printing

.model small      ; Use 'small' memory model: code and data fit within 64KB
.stack 100h       ; Reserve 256 bytes (100h) for the stack

.data             ; Begin data segment
var1 db 1         ; Declare variable 'var1' and initialize it with 1
var2 db 2         ; Declare variable 'var2' and initialize it with 2

.code             ; Begin code segment

main proc         ; Main procedure entry point
    ; Initialize data segment
    mov ax, @data ; Load the data segment address into 'ax'
    mov ds, ax    ; Move 'ax' into 'ds' to set up data segment

    ; Print first variable 'var1'
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, var1  ; Load the value of 'var1' (1) into 'dl'
    add dl, 48    ; Convert the numeric value to its ASCII equivalent (1 -> '1')
    int 21h       ; Call DOS interrupt 21h to display the character in 'dl'

    ; Output newline
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, 10    ; ASCII value of Line Feed (LF, new line)
    int 21h       ; Call DOS interrupt 21h to move to a new line
    mov dl, 13    ; ASCII value of Carriage Return (CR)
    int 21h       ; Call DOS interrupt 21h to return the cursor to the beginning of the line

    ; Print second variable 'var2'
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, var2  ; Load the value of 'var2' (2) into 'dl'
    add dl, 48    ; Convert the numeric value to its ASCII equivalent (2 -> '2')
    int 21h       ; Call DOS interrupt 21h to display the character in 'dl'
        
exit:             ; Label for program exit
    mov ah, 4ch   ; Set function number 4Ch (Terminate Program) in 'ah'
    int 21h       ; Call DOS interrupt 21h to terminate the program

main endp         ; End of main procedure

end main          ; End of program, starting execution at 'main'
