; Author: Sharif Yousuf (SharifdotG)
; Program 23 - Equation Problem 1 (a + b * c)

.MODEL SMALL
.STACK 100H

.DATA
    a DB 1
    b DB 2
    c DB 3

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AL, b
    MOV BL, c

    MUL BL    ; AL = AL * BL => AL = b * c => AL = 2 * 3 => AL = 6
    ADD AL, a ; AL = AL + a => AL = 6 + 1 => AL = 7

    MOV AH, 02H
    MOV DL, AL
    ADD DL, 30H
    INT 21H

EXIT:
    MOV AH, 4CH ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H     ; Call DOS interrupt 21H to terminate the program

MAIN ENDP
END MAIN
