; Author: Sharif Yousuf (SharifdotG)
; Program 12 - Addition of three numbers

.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    MOV AL, 1
    MOV BL, 2
    MOV CL, 3

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
