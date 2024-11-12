; 318739174, 50%
; 211641956, 50%
.ORIG X4000
Mul:						
;INPUT: R0 AND R1 , OUTPUT R2=R0*R1
	ST R0, R0_SAVE_MUL		; Save the original value of R0
	ST R1, R1_SAVE_MUL		; Save the original value of R1
	ST R7, R7_SAVE_MUL
	
	AND R2,R2,#0			; Initialize R2 (product) to zero
	
	ADD R0,R0,#0		    ; Check if either R0 or R1 is 0
	BRz MUL_END				; If either is 0, the result is 0
	ADD R1,R1,#0
	BRz MUL_END
	
	ADD R0,R0,#0			; Now we know that both R0 and R1 are non-zero
	BRp MUL_LOOP 			; If R0 is positive, proceed to the multiplication loop
	
	; When R0 is negative, swap signs because we want to use the loop, and it operates on R0, which must be positive						
	SWAP_SIGNS:				
	NOT R0,R0
	ADD R0,R0,#1
	NOT R1,R1	
	ADD R1,R1,#1			; Now that R0 is positive, proceed to the multiplication loop
		
	MUL_LOOP:
		ADD R2,R2,R1		; R2 = R2 + R1, adding R1 to the product R0 times
		ADD R0,R0,#-1 		; Decrement R0 (always positive)
		BRp MUL_LOOP		; Continue the loop while R0 is positive
		
	MUL_END:
	
		LD R0, R0_SAVE_MUL	; Restore the original values
		LD R1, R1_SAVE_MUL
		LD R7, R7_SAVE_MUL		

RET
	
R0_SAVE_MUL .FILL #0
R1_SAVE_MUL .FILL #0
R7_SAVE_MUL .FILL #0

.END
