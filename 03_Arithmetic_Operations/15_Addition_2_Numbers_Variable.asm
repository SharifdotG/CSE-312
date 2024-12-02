; Author: Sharif Yousuf (SharifdotG)
; Program 15 - Addition of two numbers (Variable)

.MODEL SMALL
.STACK 100H

.DATA
    NUM1 DB 5
    NUM2 DB 4

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AL, NUM1
    MOV BL, NUM2

    ADD AL, BL  ; Add BL to AL (AL = AL + BL)
    ADD AL, 30H

    MOV AH, 02H
    MOV DL, AL
    INT 21H

EXIT:
    MOV AH, 4CH ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H     ; Call DOS interrupt 21H to terminate the program

MAIN ENDP
END MAIN
