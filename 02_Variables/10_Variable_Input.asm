; Author: Sharif Yousuf (SharifdotG)
; Program 10 - Variable Input

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB "Enter CHAR1 character: $"
    CHAR1 DB ? ; Define CHAR1 byte variable 'CHAR1'
    MSG2 DB "You entered: $"
    NEWLINE DB 10, 13, "$"

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H
    LEA DX, MSG1
    INT 21H

    MOV AH, 01H
    INT 21H
    MOV CHAR1, AL

    MOV AH, 09H
    LEA DX, NEWLINE
    INT 21H

    MOV AH, 09H
    LEA DX, MSG2
    INT 21H
    
    MOV AH, 02H
    MOV DL, CHAR1
    INT 21H

EXIT:
    MOV AH, 4CH ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H     ; Call DOS interrupt 21H to terminate the program
    
MAIN ENDP
END MAIN
