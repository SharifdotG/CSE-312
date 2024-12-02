; Author: Sharif Yousuf (SharifdotG)
; Program 03 - Input A Character

.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    MOV AH, 01H   ; Set function number 01H (Read Character) in 'AH'
    INT 21H

    MOV AH, 02H
    MOV DL, AL
    INT 21H

EXIT:
    MOV AH, 4CH ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H     ; Call DOS interrupt 21H to terminate the program
    
MAIN ENDP
END MAIN
