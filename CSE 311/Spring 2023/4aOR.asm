; Write an assembly program to Input two integer values from consoie (Byte form) X, C
; where, 0 < X <= 9, and C = 0 or 1.
; If C = 1 then find out X is even number or not.
; If C = 0 then find out X is odd number or not.

.MODEL SMALL
.STACK 100H

.DATA
    x DB ?
    C DB ?
    EVEN_MSG DB "The number is even.$"
    NOT_EVEN_MSG DB "The number is not even.$"
    ODD_MSG DB "The number is odd.$"
    NOT_ODD_MSG DB "The number is not odd.$"

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Take input from the user
    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV x, AL

    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV C, AL

    ; Check if C = 0
    CMP C, 1
    JE EVEN

    ; Check if C = 1
    CMP C, 0
    JE ODD

EVEN:
    ; Check if x is even
    MOV AL, x
    AND AL, 1
    CMP AL, 0
    JNE NOT_EVEN

    ; Print the result
    LEA DX, EVEN_MSG
    MOV AH, 09H
    INT 21H
    JMP EXIT

NOT_EVEN:
    ; Print the result
    LEA DX, NOT_EVEN_MSG
    MOV AH, 09H
    INT 21H
    JMP EXIT

ODD:
    ; Check if x is odd
    MOV AL, x
    AND AL, 1
    CMP AL, 1
    JNE NOT_ODD

    ; Print the result
    LEA DX, ODD_MSG
    MOV AH, 09H
    INT 21H
    JMP EXIT

NOT_ODD:
    ; Print the result
    LEA DX, NOT_ODD_MSG
    MOV AH, 09H
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN