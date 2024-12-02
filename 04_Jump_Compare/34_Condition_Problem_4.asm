; Author: Sharif Yousuf (SharifdotG)
; Program 34 - Condition Problem 4: Check if the 6 characters is a palindrome or not

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB "Enter 6 characters: $"
    MSG2 DB "Palindrome$"
    MSG3 DB "Not Palindrome$"
    CHAR1 DB ?
    CHAR2 DB ?
    CHAR3 DB ?
    CHAR4 DB ?
    CHAR5 DB ?
    CHAR6 DB ?
    NEWLINE DB 13, 10, '$'

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA DX, MSG1
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H
    MOV CHAR1, AL

    MOV AH, 01H
    INT 21H
    MOV CHAR2, AL

    MOV AH, 01H
    INT 21H
    MOV CHAR3, AL

    MOV AH, 01H
    INT 21H
    MOV CHAR4, AL

    MOV AH, 01H
    INT 21H
    MOV CHAR5, AL

    MOV AH, 01H
    INT 21H
    MOV CHAR6, AL

    MOV AH, 09H
    LEA DX, NEWLINE
    INT 21H

    MOV BL, CHAR1
    MOV BH, CHAR6
    CMP BL, BH
    JNE NOT_PALINDROME

    MOV BL, CHAR2
    MOV BH, CHAR5
    CMP BL, BH
    JNE NOT_PALINDROME

    MOV BL, CHAR3
    MOV BH, CHAR4
    CMP BL, BH
    JNE NOT_PALINDROME

    LEA DX, MSG2
    MOV AH, 09H
    INT 21H

    JMP EXIT

NOT_PALINDROME:
    LEA DX, MSG3
    MOV AH, 09H
    INT 21H

EXIT:
    MOV AH, 4CH   ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H       ; Call DOS interrupt 21H to terminate the program

MAIN ENDP
END MAIN
