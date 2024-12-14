; Take three integer values x, y, C from the user, where 0 <= x, y <= 9, and C = 0 or 1.
; If C = 0 print the minimum of x, y and if C = 1 print the maximum of x, y

.MODEL SMALL
.STACK 100H

.DATA
    x DB ?
    y DB ?
    C DB ?

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
    MOV y, AL

    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV C, AL

    ; Check if C = 0
    CMP C, 0
    JE MIN

    ; Check if C = 1
    CMP C, 1
    JE MAX

MIN:
    ; Check if x < y
    MOV AL, x
    MOV BL, y
    CMP AL, BL
    JGE PRINT_Y
    JMP PRINT_X

PRINT_X:
    ; Print x
    MOV AH, 02H
    MOV DL, x
    ADD DL, 30H
    INT 21H
    JMP EXIT

PRINT_Y:
    ; Print y
    MOV AH, 02H
    MOV DL, y
    ADD DL, 30H
    INT 21H
    JMP EXIT

MAX:
    ; Check if x > y
    MOV AL, x
    MOV BL, y
    CMP AL, BL
    JLE PRINT_Y
    JMP PRINT_X

EXIT:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN