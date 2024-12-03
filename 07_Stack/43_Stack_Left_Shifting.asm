; Author: Sharif Yousuf (SharifdotG)
; Program 41 - Stack Left Shifting Operation

.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    MOV AL, 3    ; 3 = 0000 0011 (Before shifting)
    PUSH AX

    SHL AL, 1    ; 6 = 0000 0110 (Shift Left by 1 bit)
    PUSH AX

    POP AX

    MOV AH, 02H
    MOV DL, AL   ; DL = 6 (Shifted value)
    ADD DL, 30H
    INT 21H

    POP AX

    MOV AH, 02H
    MOV DL, AL   ; DL = 3 (Original value)
    ADD DL, 30H
    INT 21H

EXIT:
    MOV AH, 4CH   ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H       ; Call DOS interrupt 21H to terminate the program

MAIN ENDP
END MAIN
