; Author: Sharif Yousuf (SharifdotG)
; Program 02 - Print Multiple Characters

.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    MOV AH, 02H
    MOV DL, 'd' ; 100 or 64H will print same output
    INT 21H

    MOV DL, 'o' ; 111 or 6FH will print same output
    INT 21H

    MOV DL, 't' ; 116 or 74H will print same output
    INT 21H

    MOV DL, 'G' ; 71 or 47H will print same output
    INT 21H

EXIT:
    MOV AH, 4CH ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H     ; Call DOS interrupt 21H to terminate the program
    
MAIN ENDP
END MAIN
