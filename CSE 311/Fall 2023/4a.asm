; Take three integer values x, y, z from the user, where 0 <= x, y <= 4, x > y, and z = 0 or 1.
; If z = 0 print x * y (MUL X, Y) and if z = 1 print x / y (DIV X,Y) in the console.

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

    ; Check if z = 0
    CMP C, 0
    JNE DIVIDE

    ; Multiply x and y
    MOV AL, x
    MOV BL, y
    MUL BL

    ; Print the result
    MOV AH, 02H
    MOV DL, AL
    ADD DL, 30H
    INT 21H
    JMP EXIT

DIVIDE:
    ; Divide x by y
    MOV AL, x
    MOV BL, y
    DIV BL

    ; Print the result
    MOV AH, 02H
    MOV DL, AL
    ADD DL, 30H
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN