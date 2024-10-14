; Author: Sharif Yousuf (SharifdotG)
; Program - Loop 5 to 1

.model small      ; Use 'small' memory model: code and data fit within 64KB
.stack 100h       ; Reserve 256 bytes (100h) for the stack

.data             ; Begin data segment
msg1 db "The Loop has started!$" ; Message displayed before entering the loop
msg2 db "The Loop has ended!$"   ; Message displayed after the loop ends

.code             ; Begin code segment

main proc         ; Main procedure entry point
    ; Initialize the data segment
    mov ax, @data ; Load the address of the data segment into 'ax'
    mov ds, ax    ; Move 'ax' into 'ds' to set up the data segment
    
    ; Output the first string (msg1)
    mov ah, 9     ; Set function number 9 (Display String) in 'ah'
    lea dx, msg1  ; Load the address of 'msg1' into 'dx'
    int 21h       ; Call DOS interrupt 21h to display the string
    
    ; Output newline to separate messages
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, 10    ; Load ASCII value of Line Feed (LF) into 'dl' (move to a new line)
    int 21h       ; Call DOS interrupt 21h to execute the newline
    mov dl, 13    ; Load ASCII value of Carriage Return (CR) into 'dl' (return cursor to the beginning)
    int 21h       ; Call DOS interrupt 21h to execute the carriage return

    ; Initialize loop variables
    mov bl, 5     ; Set loop counter 'bl' to 5
    mov bh, 1     ; Set lower limit 'bh' to 1

    cmp bl, bh    ; Compare current value of 'bl' with 'bh'
    jge loop      ; If 'bl' >= 'bh', jump to loop

    jmp loop_end  ; If not, jump to loop end

loop:
    ; Output the current value of 'bl'
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, bl    ; Load the current value of 'bl' into 'dl'
    add dl, 48    ; Convert the value to ASCII (for display)
    int 21h       ; Call DOS interrupt 21h to display the value

    ; Output newline after each number
    mov ah, 2     ; Set function number 2 (Display Character) in 'ah'
    mov dl, 10    ; Load ASCII value of Line Feed (LF) into 'dl' (move to a new line)
    int 21h       ; Call DOS interrupt 21h to execute the newline
    mov dl, 13    ; Load ASCII value of Carriage Return (CR) into 'dl' (return cursor to the beginning)
    int 21h       ; Call DOS interrupt 21h to execute the carriage return

    ; Decrement the loop counter
    dec bl        ; Decrement the value of 'bl'

    cmp bl, bh    ; Compare the updated value of 'bl' with 'bh'
    jge loop      ; If 'bl' >= 'bh', repeat the loop

loop_end:
    ; Output the second string (msg2)
    mov ah, 9     ; Set function number 9 (Display String) in 'ah'
    lea dx, msg2  ; Load the address of 'msg2' into 'dx'
    int 21h       ; Call DOS interrupt 21h to display the second string

    jmp exit      ; Jump to program exit

exit:             ; Label for program exit
    mov ah, 4ch   ; Set function number 4Ch (Terminate Program) in 'ah'
    int 21h       ; Call DOS interrupt 21h to terminate the program

main endp         ; End of main procedure

end main          ; End of program, starting execution at 'main'
