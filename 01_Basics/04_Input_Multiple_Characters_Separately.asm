; Author: Sharif Yousuf (SharifdotG)
; Program 04 - Input Multiple Characters Separately

.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    MOV AH, 01H
    INT 21H

    MOV AH, 02H
    MOV DL, AL
    INT 21H

    MOV AH, 01H
    INT 21H

    MOV AH, 02H
    MOV DL, AL
    INT 21H

EXIT:
    MOV AH, 4CH ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H     ; Call DOS interrupt 21H to terminate the program
    
MAIN ENDP
END MAIN
