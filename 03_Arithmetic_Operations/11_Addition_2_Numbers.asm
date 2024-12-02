; Author: Sharif Yousuf (SharifdotG)
; Program 11 - Addition of two numbers

.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    MOV AL, 5
    MOV BL, 4

    ADD AL, BL  ; Add BL to AL (AL = AL + BL)
    ADD AL, 30H ; Convert number to ASCII

    MOV AH, 02H
    MOV DL, AL
    INT 21H

EXIT:
    MOV AH, 4CH ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H     ; Call DOS interrupt 21H to terminate the program

MAIN ENDP
END MAIN
