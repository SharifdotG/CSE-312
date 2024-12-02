; Author: Sharif Yousuf (SharifdotG)
; Program 29 - JLE (Jump if Less or Equal) Instruction

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB "AX is less than or equal to BX!$"

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AX, 5
    MOV BX, 10

    CMP AX, BX
    JLE LESS_EQUAL
    JMP EXIT

LESS_EQUAL:
    MOV AH, 09H
    LEA DX, MSG1
    INT 21H

EXIT:
    MOV AH, 4CH   ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H       ; Call DOS interrupt 21H to terminate the program

MAIN ENDP
END MAIN
