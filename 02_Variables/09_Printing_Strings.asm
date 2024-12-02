; Author: Sharif Yousuf (SharifdotG)
; Program 09 - Printing Strings

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB "SharifdotG!$"                       ; Define a string variable 'MSG1' and assign value "SharifdotG!"
    MSG2 DB "The Best of the Best of the Best!$" ; Define a string variable 'MSG2' and assign value "The Best of the Best of the Best!"

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H  ; Set function number 9 (Display String) in 'AH'
    LEA DX, MSG1 ; Load effective address of 'MSG1' to DX
    INT 21H

    MOV AH, 02H
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H

    MOV AH, 09H
    LEA DX, MSG2
    INT 21H

EXIT:
    MOV AH, 4CH ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H     ; Call DOS interrupt 21H to terminate the program
    
MAIN ENDP
END MAIN
