; Author: Sharif Yousuf (SharifdotG)
; Program 26 - JG (Jump if Greater) Instruction

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB "AX is greater than BX!$"

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AX, 10
    MOV BX, 5

    CMP AX, BX    ; Compare AX and BX
    JG GREATER    ; Jump to GREATER if AX > BX
    JMP EXIT      ; Jump to EXIT

GREATER:          ; Label GREATER (If AX > BX)
    MOV AH, 09H
    LEA DX, MSG1
    INT 21H

EXIT:             ; Label EXIT (End of program)
    MOV AH, 4CH   ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H       ; Call DOS interrupt 21H to terminate the program

MAIN ENDP
END MAIN
