; Take an input n & calculate the sum of the series up to 10th term.
; The series is 10 + 9 + 8 + 7 + 6 + 5 + 4 + 3 + 2 + 1

.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    MOV CX, 10      ; Counter for the loop, representing 10 terms
    MOV AX, 10      ; Starting value of the series
    MOV BX, 0       ; Accumulator to store the sum

CALCULATE:
    ADD BX, AX      ; Add the current value to the sum
    DEC AX          ; Decrease the current term by 1
    LOOP CALCULATE  ; Decrement CX and jump if CX != 0
    
    ; The sum is stored in BX

EXIT:
    MOV AH, 4CH     ; Terminate the program
    INT 21H

MAIN ENDP
END MAIN