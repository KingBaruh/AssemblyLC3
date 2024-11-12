
.ORIG X412C
CheckPrime:	
; Input: R0 (number to check for primality)
; It is assumed that R0 is not a negative number
; Output: R2 (1 if prime, 0 if not prime)

	ST R0,R0_SAVE_CHECK_PRIME	; Save the input number
	ST R1,R1_SAVE_CHECK_PRIME
	ST R3,R3_SAVE_CHECK_PRIME
	ST R4,R4_SAVE_CHECK_PRIME   ; Flag for the loop
	ST R5,R5_SAVE_CHECK_PRIME	; Pointer for the DIV subroutine
	ST R7,R7_SAVE_CHECK_PRIME
	
	AND R2,R2,#0				; Initialize the output to 0 (not prime)
	
	; Special cases for 0, 1	
	ADD R0,R0,#0
	BRz END_CHECK_PRIME			; If input is 0, not prime
	ADD R0,R0,#-1
	BRz END_CHECK_PRIME			; If input is 1, not prime
	ADD R0,R0,#1				; Return R0 to is original  number
	
	LD R5,PTR_Div				; Load the address of the DIV subroutine
	ADD R1,R0,#-1				; R1 = R0-1
	
	; Main loop for checking primality
	MAIN_LOOP:
		ADD R4,R1,#-1			; Counter for the loop, the loop run when (R1>1)
		BRz R0_IS_PRIME			; If (R1-1) is 0, R0 is prime
		JSRR R5					; Call the DIV subroutine
		ADD R3,R3,#0			; R3 is the remainder of R0
		BRz R0_IS_NOT_PRIME		; If remainder is 0, R0 is not prime
		ADD R1,R1,#-1			; Decrement R1 
		BR MAIN_LOOP
		
	R0_IS_NOT_PRIME:
		LD R2,NOT_PRIME			; Set R2 to 0 (not prime)
		BR END_CHECK_PRIME
		
	R0_IS_PRIME:
		LD R2,IS_PRIME			; Set R2 to 1 (prime)
	
	END_CHECK_PRIME:
		; Restore saved registers
		LD R0,R0_SAVE_CHECK_PRIME	
		LD R1,R1_SAVE_CHECK_PRIME
		LD R3,R3_SAVE_CHECK_PRIME
		LD R4,R4_SAVE_CHECK_PRIME
		LD R5,R5_SAVE_CHECK_PRIME
		LD R7,R7_SAVE_CHECK_PRIME
	
RET

R0_SAVE_CHECK_PRIME	.FILL #0
R1_SAVE_CHECK_PRIME .FILL #0
R3_SAVE_CHECK_PRIME .FILL #0
R4_SAVE_CHECK_PRIME .FILL #0
R5_SAVE_CHECK_PRIME .FILL #0
R7_SAVE_CHECK_PRIME	.FILL #0	
PTR_Div .FILL X4064				; Address of the DIV subroutine	
IS_PRIME .FILL #1				; Value indicating prime
NOT_PRIME .FILL #0				; Value indicating not prime

.END
