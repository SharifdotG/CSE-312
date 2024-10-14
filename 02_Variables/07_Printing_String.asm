; Author: Sharif Yousuf (SharifdotG)
; Program 07 - Printing String

.model small      ; Use 'small' memory model: code and data fit within 64KB
.stack 100h       ; Reserve 256 bytes (100h) for the stack

.data             ; Begin data segment
msg1 db "Hello from SharifdotG! $"   ; Declare first string, ending with '$' for DOS interrupt 21h function 9
msg2 db "Welcome CSE 312: Microprocessors & Assembly Lab! $"   ; Declare second string, ending with '$'

.code             ; Begin code segment

main proc         ; Main procedure entry point
    ; Initialize the data segment
    mov ax, @data ; Load the data segment address into 'ax'
    mov ds, ax    ; Move 'ax' into 'ds' to set up the data segment

    ; Output the first string (msg1)
    mov ah, 9     ; Set function number 9 (Display String) in 'ah'
    lea dx, msg1  ; Load the address of 'msg1' into 'dx'
    int 21h       ; Call DOS interrupt 21h to display the string

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

exit:             ; Label for program exit
    mov ah, 4ch   ; Set function number 4Ch (Terminate Program) in 'ah'
    int 21h       ; Call DOS interrupt 21h to terminate the program

main endp         ; End of main procedure

end main          ; End of program, starting execution at 'main'
