; Author: Sharif Yousuf (SharifdotG)
; Program 22 - Multiplication of 2 Numbers (Variable)

.MODEL SMALL
.STACK 100H

.DATA
    NUM1 DB 2
    NUM2 DB 4

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AL, NUM1
    MOV BL, NUM2

    MUL BL

    MOV AH, 02H
    MOV DL, AL
    ADD DL, 30H
    INT 21H

EXIT:
    MOV AH, 4CH ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H     ; Call DOS interrupt 21H to terminate the program

MAIN ENDP
END MAIN
