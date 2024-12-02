; Author: Sharif Yousuf (SharifdotG)
; Program 17 - Subtraction of 2 Numbers

.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    MOV AL, 5
    MOV BL, 4

    SUB AL, BL ; Subtract BL from AL (AL = AL - BL)
    ADD AL, 30H

    MOV AH, 
    MOV DL, AL
    INT 21H

EXIT:
    MOV AH, 4CH ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H     ; Call DOS interrupt 21H to terminate the program

MAIN ENDP
END MAIN
