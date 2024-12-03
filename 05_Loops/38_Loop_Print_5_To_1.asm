; Author: Sharif Yousuf (SharifdotG)
; Program 38 - Print 5 to 1 Using Loops

.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    MOV CX, 5       ; Load 5 into 'CX' register for loop count
    MOV BL, 5

LOOP_START:
    MOV AH, 02H
    MOV DL, BL
    ADD DL, 30H
    INT 21H

    DEC BL
    LOOP LOOP_START

    JMP EXIT

EXIT:
    MOV AH, 4CH   ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H       ; Call DOS interrupt 21H to terminate the program

MAIN ENDP
END MAIN
