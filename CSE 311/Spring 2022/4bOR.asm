; Write an assembly program to count the number of characters until "Carriage Return" character is pressed.

.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    MOV CX, 0       ; Initialize 'CX' register to 0
    MOV AH, 01H     ; Set function number 01H (Read Character) in 'AH'

READ:
    INT 21H         ; Read a character from the standard input

    CMP AL, 0DH     ; Check if the character is "Carriage Return" character
    JE EXIT         ; If "Carriage Return" character is pressed, jump to EXIT

    INC CX          ; Increment 'CX' register by 1
    JMP READ        ; Jump to READ

    ; CX register now contains the number of characters until "Carriage Return" character is pressed

EXIT:
    MOV AH, 4CH     ; Terminate the program
    INT 21H

MAIN ENDP
END MAIN