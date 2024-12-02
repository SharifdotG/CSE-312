; Author: Sharif Yousuf (SharifdotG)
; Program 27 - JL (Jump if Less) Instruction

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB "AX is less than BX!$"

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AX, 5
    MOV BX, 10

    CMP AX, BX
    JL LESS
    JMP EXIT

LESS:
    MOV AH, 09H
    LEA DX, MSG1
    INT 21H

EXIT:             ; Label EXIT (End of program)
    MOV AH, 4CH   ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H       ; Call DOS interrupt 21H to terminate the program

MAIN ENDP
END MAIN
