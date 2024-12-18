; Author: Sharif Yousuf (SharifdotG)
; Program 01 - Print A Character

.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    MOV AH, 02H ; Set function number 02H (Print Character) in 'AH'
    MOV DL, 'a' ; 97 or 61H will print same output
    INT 21H
           
EXIT:
    MOV AH, 4CH ; Set function number 4CH (Terminate Program) in 'AH'
    INT 21H     ; Call DOS interrupt 21H to terminate the program
    
MAIN ENDP
END MAIN
