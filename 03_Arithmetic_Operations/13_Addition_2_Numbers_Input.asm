; Author: Sharif Yousuf (SharifdotG)
; Program 13 - Addition of two numbers (Input from user)

.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    MOV AH, 01H
    INT 21H
    SUB AL, 30H ; Convert ASCII to number

    MOV BL, AL

    MOV AH, 01H
    INT 21H
    SUB AL, 30H

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
