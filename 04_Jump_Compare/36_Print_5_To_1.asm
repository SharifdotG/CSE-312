; Author: Sharif Yousuf (SharifdotG)
; Program 36 - Print 5 to 1 using JMP & CMP Instructions

.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    MOV BL, 5
    MOV CL, 1

PRINT_LOOP:
    MOV AH, 02H
    MOV DL, BL
    ADD DL, 30H
    INT 21H

    MOV AH, 02H
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    
    DEC BL
    CMP BL, CL
    JGE PRINT_LOOP

    JMP EXIT

EXIT:
    MOV AH, 4CH   ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H       ; Call DOS interrupt 21H to terminate the program

MAIN ENDP
END MAIN
