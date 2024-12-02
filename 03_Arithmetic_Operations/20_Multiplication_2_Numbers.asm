; Author: Sharif Yousuf (SharifdotG)
; Program 20 - Multiplication of 2 Numbers

.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    MOV AL, 2
    MOV BL, 4

    MUL BL      ; Multiply AL by BL

    MOV AH, 02H
    MOV DL, AL
    ADD DL, 30H
    INT 21H

EXIT:
    MOV AH, 4CH ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H     ; Call DOS interrupt 21H to terminate the program

MAIN ENDP
END MAIN
