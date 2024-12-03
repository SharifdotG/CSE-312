; Author: Sharif Yousuf (SharifdotG)
; Program 42 - Stack Right Shifting Operation

.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    MOV AL, 6    ; 6 = 0000 0110 (Before shifting)
    PUSH AX

    SHR AL, 1    ; 3 = 0000 0011 (Shift Right by 1 bit)
    PUSH AX

    POP AX

    MOV AH, 02H
    MOV DL, AL   ; DL = 3 (Shifted value)
    ADD DL, 30H
    INT 21H

    POP AX

    MOV AH, 02H
    MOV DL, AL   ; DL = 6 (Original value)
    ADD DL, 30H
    INT 21H

EXIT:
    MOV AH, 4CH   ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H       ; Call DOS interrupt 21H to terminate the program

MAIN ENDP
END MAIN
