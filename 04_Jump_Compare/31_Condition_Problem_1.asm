; Author: Sharif Yousuf (SharifdotG)
; Program 31 - Condition Problem 1: Compare two numbers and print the greater one

.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    MOV AL, 5
    MOV BL, 4

    CMP AL, BL
    JG PRINT_AL
    JMP PRINT_BL

PRINT_AL:
    MOV AH, 02H
    MOV DL, AL
    ADD DL, 30H
    INT 21H
    JMP EXIT

PRINT_BL:
    MOV AH, 02H
    MOV DL, BL
    ADD DL, 30H
    INT 21H
    JMP EXIT

EXIT:
    MOV AH, 4CH   ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H       ; Call DOS interrupt 21H to terminate the program

MAIN ENDP
END MAIN
