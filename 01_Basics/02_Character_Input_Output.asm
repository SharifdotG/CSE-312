; Author: Sharif Yousuf (SharifdotG)
; Program 02 - Character Input and Output

.model small      ; Use 'small' memory model: code and data fit within 64KB
.stack 100h       ; Reserve 256 bytes (100h) for the stack

.code             ; Begin code segment

main proc         ; Main procedure entry point
    mov ah, 1     ; Set function number 1 (Input Character from keyboard) in 'ah'
    int 21h       ; Call DOS interrupt 21h to get input character into 'al'
    mov bl, al    ; Store the input character from 'al' into 'bl' (for later use)

    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, bl    ; Load 'bl' (input character) into 'dl' for output
    int 21h       ; Call DOS interrupt 21h to display the character in 'dl'
           
exit:             ; Label for program exit
    mov ah, 4ch   ; Set function number 4Ch (Terminate Program) in 'ah'
    int 21h       ; Call DOS interrupt 21h to terminate the program
main endp         ; End of main procedure

end main          ; End of program, starting execution at 'main'
