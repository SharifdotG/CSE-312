; Author: Sharif Yousuf (SharifdotG)
; Program 40 - Stack PUSH POP Operation

.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    MOV AX, 3    ; Set AX register to 3
    PUSH AX      ; Push AX register value to the stack

    MOV AX, 5
    PUSH AX

    MOV AX, 7
    PUSH AX

    POP AX       ; Pop the top value from the stack to AX register

    MOV AH, 02H
    MOV DL, AL
    ADD DL, 30H
    INT 21H

    POP AX

    MOV AH, 02H
    MOV DL, AL
    ADD DL, 30H
    INT 21H

    POP AX

    MOV AH, 02H
    MOV DL, AL
    ADD DL, 30H
    INT 21H

EXIT:
    MOV AH, 4CH   ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H       ; Call DOS interrupt 21H to terminate the program

MAIN ENDP
END MAIN
