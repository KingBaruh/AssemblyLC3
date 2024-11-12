
.ORIG X3000
main:

	LD R6,PTR_GetNum_MAIN					; Load the address of the GetNum subroutine into R6 
	JSRR R6									; Call the GetNum subroutine to get the first number
	ADD R0,R2,#0							; Move the first number from R2 to R0
	JSRR R6									; Call the GetNum subroutine again to get the second number
	ADD R1,R2,#0							; Move the second number from R2 to R1
	LD R6,PTR_Calculator_MAIN				; Load the address of the Calculator subroutine into R6
	JSRR R6									; Call the Calculator subroutine to perform the calculation

HALT										; Halt the program

PTR_GetNum_MAIN .FILL x41F4					; Address of the GetNum subroutine
PTR_Calculator_MAIN .FILL x4384				; Address of the Calculator subroutine

.END
