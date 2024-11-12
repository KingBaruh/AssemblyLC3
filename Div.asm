
.ORIG X4064
Div:
;INPUT: R0,R1 . OUTPUT: R2=R0/R1 , R3=R0%R1
	ST R0, R0_SAVE_DIV      ; Save the original value of R0
	ST R1, R1_SAVE_DIV		; Save the original value of R1
	ST R4, R4_SAVE_DIV		; The role of R4 is to be the sign of R2
	ST R7, R7_SAVE_DIV
	
	AND R2,R2,#0            ; Initialize R2 (quotient) to zero
	AND R3,R3,#0            ; Initialize R3 (remainder) to zero
	
	AND R4,R4,#0            ; Make R4 positive (for sign)
	ADD R4,R4,#1
	
	ADD R1,R1, #0           ; Check if R1 = 0
	BRnp R1_IS_LEGAL        ; Branch if R1 is negative or zero
	
	R1_IS_ILEGAL:
		ADD R2,R2,#-1	    ; If R1 = 0, set both R2 and R3 to -1
		ADD R3,R3,#-1
		BR END_DIV          ; Exit the division routine
	
	R1_IS_LEGAL:
		ADD R0,R0,#0        ; If R0 is 0, set both R2 and R3 to 0
		BRz END_DIV         ; Exit the division routine
	
	CHECK_R0_SIGN:			; Now, R0!=0 And R1!=0
		ADD R0,R0,#0		
		BRp CHECK_R1_SIGN   ; Branch if R0 is positive
		
		NOT R4,R4			; If R0<0, switch sign (R4) and make R0>0
		ADD R4,R4,#1
		NOT R0,R0			; Make R0 positive
		ADD R0,R0,#1
		
	CHECK_R1_SIGN:
		ADD R1,R1,#0		
		BRp MAKE_R1_NEGATIVE   ; Branch if R1 is positive
		
		NOT R4,R4			; If R1<0, switch sign (R4) and make R1>0
		ADD R4,R4,#1
		NOT R1,R1			; Make R1 positive
		ADD R1,R1,#1
		
							; R1 IS ALWAYES POSITIVE BEFORE THIS LEBAL
	MAKE_R1_NEGATIVE:		; R1 must be negative in the LOOP_DIV because we need to do R0 - R1
		NOT R1,R1        
		ADD R1,R1,#1
	
	LOOP_DIV:				; R0>0, R1<0
		ADD R0,R0,R1		; R0 = R0 - R1
		BRn END_LOOP		; Branch if R0 is negative
		ADD R2,R2,#1		; Increment R2 (quotient) for every loop
		BR LOOP_DIV
	
	END_LOOP:
		NOT R1,R1			; Because R1 < 0, R3 = R0 + R1 (calculate remainder)
		ADD R1,R1,#1
		ADD R3,R0,R1		; R3 = R0+R1	
		
	CHECK_SIGN:
		ADD R4,R4,#0
		BRp END_DIV			; Branch if the sign is positive, exit the division routine
		NOT R2,R2			; If the sign is negative, negate the quotient
		ADD R2,R2,#1
		
	END_DIV:
		LD R0, R0_SAVE_DIV	; Restore the original values
		LD R1, R1_SAVE_DIV
		LD R4, R4_SAVE_DIV
		LD R7, R7_SAVE_DIV	

RET
R0_SAVE_DIV .FILL #0
R1_SAVE_DIV .FILL #0
R4_SAVE_DIV .FILL #0
R5_SAVE_DIV .FILL #0
R7_SAVE_DIV .FILL #0
	
.END
