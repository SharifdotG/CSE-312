; Author: Sharif Yousuf (SharifdotG)
; Program 01 - Print A Character

.model small      ; Use 'small' memory model: code and data fit within 64KB
.stack 100h       ; Reserve 256 bytes (100h) for the stack

.code             ; Begin code segment

main proc         ; Main procedure entry point
    mov ah, 2     ; Set function number 2 (Display Character) in register 'ah'
    mov dl, 'a'   ; Load ASCII value of character 'a' into 'dl' (data register)
    int 21h       ; Call DOS interrupt 21h to execute function (print character)
           
exit:             ; Label for program exit
    mov ah, 4ch   ; Set function number 4Ch (Terminate Program) in 'ah'
    int 21h       ; Call DOS interrupt 21h to terminate the program
main endp         ; End of main procedure

end main          ; End of program, starting execution at 'main'
