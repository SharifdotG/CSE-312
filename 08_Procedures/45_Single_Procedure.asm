; Author: Sharif Yousuf (SharifdotG)
; Program 43 - Single Procedure to Add Two Numbers

.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    MOV AL, 3
    MOV BL, 2
    CALL ADD_NUMBERS ; Call the procedure to add two numbers

    MOV AH, 02H
    MOV DL, AL
    ADD DL, 30H
    INT 21H

EXIT:
    MOV AH, 4CH      ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H          ; Call DOS interrupt 21H to terminate the program

ADD_NUMBERS PROC     ; Procedure to add two numbers
    ADD AL, BL
    RET              ; Return from the procedure
ADD_NUMBERS ENDP     ; End of the procedure

MAIN ENDP
END MAIN
