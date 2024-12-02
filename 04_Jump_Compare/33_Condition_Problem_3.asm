; Author: Sharif Yousuf (SharifdotG)
; Program 33 - Condition Problem 3: Check if the number is positive, negative or zero

.MODEL SMALL
.STACK 100H

.DATA
    ZERO_MSG DB "The number is zero!$"
    POSITIVE_MSG DB "The number is positive!$"
    NEGATIVE_MSG DB "The number is negative!$"

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, 0

    CMP AL, 0
    JE ZERO
    JG POSITIVE
    JL NEGATIVE

ZERO:
    MOV AH, 09H
    LEA DX, ZERO_MSG
    INT 21H
    JMP EXIT

POSITIVE:
    MOV AH, 09H
    LEA DX, POSITIVE_MSG
    INT 21H
    JMP EXIT

NEGATIVE:
    MOV AH, 09H
    LEA DX, NEGATIVE_MSG
    INT 21H

EXIT:
    MOV AH, 4CH   ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H       ; Call DOS interrupt 21H to terminate the program

MAIN ENDP
END MAIN
