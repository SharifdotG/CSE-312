; Author: Sharif Yousuf (SharifdotG)
; Program 18 - Subtraction of 3 Numbers (User Input)

.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    MOV AH, 01H
    INT 21H
    SUB AL, 30H

    MOV BL, AL

    MOV AH, 01H
    INT 21H
    SUB AL, 30H

    MOV CL, AL

    SUB BL, CL ; Subtract CL from BL (BL = BL - CL)
    ADD BL, 30H

    MOV AH, 02H
    MOV DL, BL
    INT 21H

EXIT:
    MOV AH, 4CH ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H     ; Call DOS interrupt 21H to terminate the program

MAIN ENDP
END MAIN
