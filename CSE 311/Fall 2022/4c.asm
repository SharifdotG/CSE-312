; Write an assembly program to find out the sum of the following series up to N (where 0 < n < 9) and put the sum in AX.
; 1 + 3 + 5 + 7 + .....

.MODEL SMALL
.STACK 100H

.DATA
    n DB ?

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Take input from the user
    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV n, AL
    
    MOV CX, n       ; Counter for the loop, representing n terms
    MOV AX, 1       ; Starting value of the series
    MOV BX, 0       ; Accumulator to store the sum

CALCULATE:
    ADD BX, AX      ; Add the current value to the sum
    ADD AX, 2       ; Increase the current term by 2
    LOOP CALCULATE  ; Decrement CX and jump if CX != 0
    
    ; The sum is stored in BX

EXIT:
    MOV AH, 4CH     ; Terminate the program
    INT 21H

MAIN ENDP
END MAIN