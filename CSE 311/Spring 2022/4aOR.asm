; Write an assembly program to input an alphabet and convert it into its opposite case.
; Except alphabet if any other key is pressed then it will display the string "INVALID INPUT".

.MODEL SMALL
.STACK 100H

.DATA
    INVALID_MSG DB "INVALID INPUT.$"

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Take input from the user
    MOV AH, 01H
    INT 21H
    MOV BL, AL

    ; Check if the input is an uppercase letter
    CMP BL, 'A'
    JL INVALID
    CMP BL, 'Z'
    JG CHECK_LOWER

    ; Convert the uppercase letter to lowercase
    ADD BL, 32
    JMP PRINT

CHECK_LOWER:
    ; Check if the input is a lowercase letter
    CMP BL, 'a'
    JL INVALID
    CMP BL, 'z'
    JG INVALID

    ; Convert the lowercase letter to uppercase
    SUB BL, 32
    JMP PRINT

INVALID:
    ; Print the result
    LEA DX, INVALID_MSG
    MOV AH, 09H
    INT 21H
    JMP EXIT

PRINT:
    ; Print the result
    MOV AH, 02H
    MOV DL, BL
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN