; Author: Sharif Yousuf (SharifdotG)
; Program 37 - Print an array of numbers

.MODEL SMALL
.STACK 100H

.DATA
    ARR DB 1, 2, 3, 4, 5, 6, 7, 8, 9
    MSG DB "Array elements: $"

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 9
    MOV SI, 0

    MOV AH, 09H
    LEA DX, MSG
    INT 21H

    MOV AH, 02H
    
PRINT_LOOP:
    MOV DL, ARR[SI]
    ADD DL, 30H
    INT 21H

    INC SI
    LOOP PRINT_LOOP

EXIT:
    MOV AH, 4CH   ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H       ; Call DOS interrupt 21H to terminate the program

MAIN ENDP
END MAIN
