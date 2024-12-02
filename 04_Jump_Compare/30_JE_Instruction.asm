; Author: Sharif Yousuf (SharifdotG)
; Program 30 - JE (Jump if Equal) Instruction

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB "AX is equal to BX!$"

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AX, 5
    MOV BX, 5

    CMP AX, BX
    JE EQUAL
    JMP EXIT

EQUAL:
    MOV AH, 09H
    LEA DX, MSG1
    INT 21H

EXIT:
    MOV AH, 4CH   ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H       ; Call DOS interrupt 21H to terminate the program

MAIN ENDP
END MAIN
