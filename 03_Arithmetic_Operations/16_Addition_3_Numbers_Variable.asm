; Author: Sharif Yousuf (SharifdotG)
; Program 16 - Addition of three numbers (Variable)

.MODEL SMALL
.STACK 100H

.DATA
    NUM1 DB 1
    NUM2 DB 2
    NUM3 DB 3

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AL, NUM1
    MOV BL, NUM2
    MOV CL, NUM3

    ADD AL, BL  ; Add BL to AL (AL = AL + BL)
    ADD AL, CL  ; Add CL to AL (AL = AL + CL)
    ADD AL, 30H

    MOV AH, 02H
    MOV DL, AL
    INT 21H

EXIT:
    MOV AH, 4CH ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H     ; Call DOS interrupt 21H to terminate the program

MAIN ENDP
END MAIN
