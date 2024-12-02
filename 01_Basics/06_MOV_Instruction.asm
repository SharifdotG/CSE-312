; Author: Sharif Yousuf (SharifdotG)
; Program 06 - MOV Instruction

.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    MOV AL, 'A' ; Move the ASCII value of 'A' to AL register
    MOV BL, 'B' ; Move the ASCII value of 'B' to BL register
    MOV CL, 'C' ; Move the ASCII value of 'C' to CL register

    MOV AH, 02H
    MOV DL, AL
    INT 21H

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
