; 318739174, 50%
; 211641956, 50%
.ORIG X40C8
Exp:
;INPUT: R0,R1 | OUTPUT: R2=R0^R1
	ST R0,R0_EXP_SAVE		; Save the original value of R0
	ST R1,R1_EXP_SAVE		; Save the original value of R1
	ST R3,R3_EXP_SAVE		; POWER counter (exponent)
	ST R5,R5_EXP_SAVE		; Pointer to Mul subroutine
	ST R7,R7_EXP_SAVE
	
	AND R2,R2,#0			; Initialize the output (result)
	AND R3,R3,#0			; Initialize the POWER counter to zero
	LD R5,PTR_MuL			; Load the address of the Mul subroutine into R5
	
	ADD R0,R0,#0			; Check if R0 < 0
	BRn ILEGAL_INPUT		; If R0 < 0, jump to ILEGAL_INPUT
	ADD R1,R1,#0			; Check if R1 < 0
	BRn ILEGAL_INPUT		; If R1 < 0, jump to ILEGAL_INPUT
	ADD R1,R1,#0			; Check if R1 = 0
	BRz CHECK_R0_IS_ZERO	; If R1 = 0, jump to CHECK_R0_IS_ZERO
	
	; LEGAL_INPUT: R1 is positive, R0 is non-negative
	LEGAL_INPUT:
		;CHECK_IF_R1_IS_ONE_EXP:
			ADD R1,R1,#-1
			BRp RETURN_R1_TO_ORIG_VALUE_EXP
			ADD R2,R0,#0
			BR END_EXP
			
		RETURN_R1_TO_ORIG_VALUE_EXP	
			ADD R1,R1,#1
			
		ADD R3,R3,R1		; Set POWER to R1 (initialize exponent)
		ADD R1,R0,#0		; Set R1 to the initial value of R0
			
		EXP_LOOP:
			ADD R3,R3,#-1	; Decrement the POWER counter
			BRnz END_EXP	; If POWER is not zero, continue the loop
			JSRR R5			; Call the Mul subroutine (R0 * R1)
			ADD R1,R2,#0	; Save the Mul result (in R2) to R1
			BR EXP_LOOP		; Continue the loop
		
	; CHECK_R0_IS_ZERO: R1 = 0,Checks If R0 is zero
	CHECK_R0_IS_ZERO:
		ADD R0,R0,#0		; Check if R0 > 0
		BRz ILEGAL_INPUT	; If R0 = 0, jump to ILEGAL_INPUT
		ADD R2,R2,#1		; Make R2 = 1 , for evrey R0 > 0 : R0^0=1
		BR END_EXP			; Exit the subroutine
	
	; ILEGAL_INPUT: result is undefined	
	ILEGAL_INPUT:
		ADD R2,R2,#-1		; Set result to -1 (undefined)
		BR END_EXP			; Exit the subroutine
		
	END_EXP:
	LD R0,R0_EXP_SAVE		; Restore saved registers and return
	LD R1,R1_EXP_SAVE
	LD R3,R3_EXP_SAVE
	LD R5,R5_EXP_SAVE
	LD R7,R7_EXP_SAVE
RET
	
R0_EXP_SAVE .FILL #0
R1_EXP_SAVE .FILL #0
R3_EXP_SAVE .FILL #0
R5_EXP_SAVE .FILL #0
R7_EXP_SAVE .FILL #0
PTR_MuL .FILL x4000

.END
