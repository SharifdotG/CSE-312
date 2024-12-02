; Author: Sharif Yousuf (SharifdotG)
; Program 23 - Equation Problem 2 (a + b - c * d * e)

.MODEL SMALL
.STACK 100H

.DATA
    a DB 5
    b DB 4
    c DB 1
    d DB 2
    e DB 3

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AL, c
    MOV BL, d

    MUL BL     ; AL = AL * BL => AL = c * d => AL = 1 * 2 => AL = 2
    MOV BL, e
    MUL BL     ; AL = AL * BL => AL = AL * e => AL = 2 * 3 => AL = 6

    MOV BL, a
    ADD BL, b  ; BL = BL + b => BL = a + b => BL = 5 + 4 => BL = 9
    SUB BL, AL ; BL = BL - AL => BL = a + b - c * d * e => BL = 9 - 6 => BL = 3

    MOV AH, 02H
    MOV DL, BL
    ADD DL, 30H
    INT 21H

EXIT:
    MOV AH, 4CH ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H     ; Call DOS interrupt 21H to terminate the program

MAIN ENDP
END MAIN
