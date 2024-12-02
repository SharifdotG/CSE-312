; Author: Sharif Yousuf (SharifdotG)
; Program 07 - New Line

.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    MOV AL, 'A'
    MOV BL, 'B'

    MOV AH, 02H
    MOV DL, AL
    INT 21H

    MOV AH, 02H
    MOV DL, 10 ; 10 or 0AH is the ASCII value of New Line (Line Feed)
    INT 21H
    MOV DL, 13 ; 13 or 0DH is the ASCII value of Carriage Return
    INT 21H

    MOV AH, 02H
    MOV DL, BL
    INT 21H

EXIT:
    MOV AH, 4CH ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H     ; Call DOS interrupt 21H to terminate the program
    
MAIN ENDP
END MAIN
