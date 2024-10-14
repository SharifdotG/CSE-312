; Author: Sharif Yousuf (SharifdotG)
; Program 04 - New Line

.model small      ; Use 'small' memory model: code and data fit within 64KB
.stack 100h       ; Reserve 256 bytes (100h) for the stack

.code             ; Begin code segment

main proc         ; Main procedure entry point

    ; Output character 'a'
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, 'a'   ; Load ASCII value of character 'a' into 'dl'
    int 21h       ; Call DOS interrupt 21h to display character 'a'

    ; Output newline
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, 10    ; ASCII value of Line Feed (LF, new line)
    int 21h       ; Call DOS interrupt 21h to move to a new line
    mov dl, 13    ; ASCII value of Carriage Return (CR)
    int 21h       ; Call DOS interrupt 21h to return the cursor to the beginning of the line

    ; Output character 'b'
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, 'b'   ; Load ASCII value of character 'b' into 'dl'
    int 21h       ; Call DOS interrupt 21h to display character 'b'
           
exit:             ; Label for program exit
    mov ah, 4ch   ; Set function number 4Ch (Terminate Program) in 'ah'
    int 21h       ; Call DOS interrupt 21h to terminate the program

main endp         ; End of main procedure

end main          ; End of program, starting execution at 'main'
