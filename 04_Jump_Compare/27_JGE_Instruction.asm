; Author: Sharif Yousuf (SharifdotG)
; Program 27 - JGE (Jump if Greater or Equal) Instruction

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB "AX is greater than or equal to BX!$"

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AX, 10
    MOV BX, 5

    CMP AX, BX
    JGE GREATER_EQUAL
    JMP EXIT

GREATER_EQUAL:
    MOV AH, 09H
    LEA DX, MSG1
    INT 21H

EXIT:
    MOV AH, 4CH   ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H       ; Call DOS interrupt 21H to terminate the program

MAIN ENDP
END MAIN
