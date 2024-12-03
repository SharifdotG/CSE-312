; Author: Sharif Yousuf (SharifdotG)
; Program 44 - Multiple Procedures

.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    MOV AL, 3
    MOV BL, 2
    CALL ADD_NUMBERS

    MOV AH, 02H
    MOV DL, AL
    ADD DL, 30H
    INT 21H

    CALL NEW_LINE

    MOV AL, 6
    MOV BL, 2
    CALL SUBTRACT_NUMBERS

    MOV AH, 02H
    MOV DL, AL
    ADD DL, 30H
    INT 21H

    CALL NEW_LINE

    MOV AL, 4
    MOV BL, 2
    CALL MULTIPLY_NUMBERS

    MOV AH, 02H
    MOV DL, AL
    ADD DL, 30H
    INT 21H

EXIT:
    MOV AH, 4CH      ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H          ; Call DOS interrupt 21H to terminate the program

MAIN ENDP

ADD_NUMBERS PROC
    ADD AL, BL
    RET
ADD_NUMBERS ENDP

SUBTRACT_NUMBERS PROC
    SUB AL, BL
    RET
SUBTRACT_NUMBERS ENDP

MULTIPLY_NUMBERS PROC
    MUL BL
    RET
MULTIPLY_NUMBERS ENDP

NEW_LINE PROC
    MOV AH, 02H
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    RET
NEW_LINE ENDP

END MAIN
