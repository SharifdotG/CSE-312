; Author: Sharif Yousuf (SharifdotG)
; Program 08 - Print Variables

.MODEL SMALL
.STACK 100H

.DATA ; Data segment
    CHAR1 DB 'A' ; Define a variable 'CHAR1' of type Byte and assign value 'A'
    CHAR2 DB 'B' ; Define a variable 'CHAR2' of type Byte and assign value 'B'

.CODE

MAIN PROC
    MOV AX, @DATA ; Load address of Data segment to AX register
    MOV DS, AX    ; Set Data segment register to AX

    MOV AH, 02H
    MOV DL, CHAR1
    INT 21H
    MOV DL, CHAR2
    INT 21H

EXIT:
    MOV AH, 4CH ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H     ; Call DOS interrupt 21H to terminate the program
    
MAIN ENDP
END MAIN
