; Author: Sharif Yousuf (SharifdotG)
; Program 05 - Input Multiple Characters Together

.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    MOV AH, 01H
    INT 21H
    MOV BL, AL  ; Move the input character to register 'BL'

    MOV AH, 01H
    INT 21H
    MOV CL, AL  ; Move the input character to register 'CL'

    MOV AH, 02H
    MOV DL, BL
    INT 21H

    MOV AH, 02H
    MOV DL, CL
    INT 21H

EXIT:
    MOV AH, 4CH ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H     ; Call DOS interrupt 21H to terminate the program
    
MAIN ENDP
END MAIN
