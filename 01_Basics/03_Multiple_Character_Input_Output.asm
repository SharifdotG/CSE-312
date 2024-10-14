; Author: Sharif Yousuf (SharifdotG)
; Program 03 - Multiple Character Input and Output

.model small      ; Use 'small' memory model: code and data fit within 64KB
.stack 100h       ; Reserve 256 bytes (100h) for the stack

.code             ; Begin code segment

main proc         ; Main procedure entry point

    ; Input first character from the user
    mov ah, 1     ; Set function number 1 (Input Character from keyboard) in 'ah'
    int 21h       ; Call DOS interrupt 21h to get input character into 'al'
    mov bl, al    ; Store the first input character from 'al' into 'bl'

    ; Input second character from the user
    mov ah, 1     ; Set function number 1 (Input Character from keyboard) in 'ah'
    int 21h       ; Call DOS interrupt 21h to get input character into 'al'
    mov cl, al    ; Store the second input character from 'al' into 'cl'

    ; Input third character from the user
    mov ah, 1     ; Set function number 1 (Input Character from keyboard) in 'ah'
    int 21h       ; Call DOS interrupt 21h to get input character into 'al'
    mov ch, al    ; Store the third input character from 'al' into 'ch'

    ; Output first character
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, bl    ; Load 'bl' (first character) into 'dl' for output
    int 21h       ; Call DOS interrupt 21h to display the character in 'dl'

    ; Output second character
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, cl    ; Load 'cl' (second character) into 'dl' for output
    int 21h       ; Call DOS interrupt 21h to display the character in 'dl'

    ; Output third character
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, ch    ; Load 'ch' (third character) into 'dl' for output
    int 21h       ; Call DOS interrupt 21h to display the character in 'dl'

exit:             ; Label for program exit
    mov ah, 4ch   ; Set function number 4Ch (Terminate Program) in 'ah'
    int 21h       ; Call DOS interrupt 21h to terminate the program

main endp         ; End of main procedure

end main          ; End of program, starting execution at 'main'
