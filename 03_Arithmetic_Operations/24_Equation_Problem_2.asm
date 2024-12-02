; Author: Sharif Yousuf (SharifdotG)
; Program 23 - Equation Problem 2 (a * b - c * d + e)

.MODEL SMALL
.STACK 100H

.DATA
    a DB 4
    b DB 2
    c DB 2
    d DB 3
    e DB 5

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, a
    MOV BL, b

    MUL BL     ; AL = AL * BL => AL = a * b => AL = 4 * 2 => AL = 8
    MOV CL, AL

    MOV AL, c
    MOV BL, d

    MUL BL     ; AL = AL * BL => AL = c * d => AL = 2 * 3 => AL = 6
    SUB CL, AL ; CL = CL - AL => CL = a * b - c * d => CL = 8 - 6 => CL = 2

    MOV AL, e
    ADD CL, AL ; CL = CL + AL => CL = a * b - c * d + e => CL = 2 + 5 => CL = 7

    MOV AH, 02H
    MOV DL, CL
    ADD DL, 30H
    INT 21H

EXIT:
    MOV AH, 4CH ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H     ; Call DOS interrupt 21H to terminate the program

MAIN ENDP
END MAIN
