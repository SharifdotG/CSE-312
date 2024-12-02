; Author: Sharif Yousuf (SharifdotG)
; Program 32 - Condition Problem 2: Compare 3 numbers and print the greater one

.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    MOV AL, 5
    MOV BL, 4
    MOV CL, 3

    CMP AL, BL
    JG AL_GREATER
    CMP BL, CL
    JG BL_GREATER

AL_GREATER:
    CMP AL, CL
    JG PRINT_AL
    JMP PRINT_CL

BL_GREATER:
    CMP BL, CL
    JG PRINT_BL
    JMP PRINT_CL

PRINT_AL:
    MOV AH, 02H
    MOV DL, AL
    ADD DL, 30H
    INT 21H
    JMP EXIT

PRINT_BL:
    MOV AH, 02H
    MOV DL, BL
    ADD DL, 30H
    INT 21H
    JMP EXIT

PRINT_CL:
    MOV AH, 02H
    MOV DL, CL
    ADD DL, 30H
    INT 21H
    JMP EXIT

EXIT:
    MOV AH, 4CH   ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H       ; Call DOS interrupt 21H to terminate the program

MAIN ENDP
END MAIN
