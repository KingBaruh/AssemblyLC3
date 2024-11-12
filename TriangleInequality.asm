; 318739174, 50%
; 211641956, 50%
.ORIG X4190
TriangleInequality:
; Input: R0, R1, R2 (three side lengths of a triangle)
; Output: R3 (1 if triangle inequality holds, 0 otherwise)
	
	ST R0,R0_SAVE_TRIANGLE			; Save the input side lengths
	ST R1,R1_SAVE_TRIANGLE			; Save the input side lengths
	ST R2,R2_SAVE_TRIANGLE			; Save the input side lengths	
	ST R4,R4_SAVE_TRIANGLE			; Temporary register for calculations
	ST R7,R7_SAVE_TRIANGLE
	
	AND R3,R3,#0					; Initialize the output to 0
	
	; Check if any of the side lengths is negative	
	CHECK_R0_NEGATIVE:
		ADD R0,R0,#0
		BRn ILLEGAL_INPUT			; If R0 is negative, jump to illegal input handling
		
	CHECK_R1_NEGATIVE:
		ADD R1,R1,#0
		BRn ILLEGAL_INPUT			; If R1 is negative, jump to illegal input handling
		
	CHECK_R2_NEGATIVE:
		ADD R2,R2,#0
		BRn ILLEGAL_INPUT			; If R2 is negative, jump to illegal input handling
	
	FIRST_CHECK:    				; Check if R1+R2>=R0
		NOT R4,R0
		ADD R4,R4,#1				; R4 = -R0
		ADD R4,R4,R1				; R4 = -R0+R1
		ADD R4,R4,R2				; R4 = -R0+R1+R2
		BRn END_TriangleInequality 	; If negative, jump to the end because R3 is already 0
		
	SECOUND_CHECK:    			    ; Check if R0+R2>=R1
		NOT R4,R1					
		ADD R4,R4,#1				; R4 = -R1
		ADD R4,R4,R0				; R4 = -R1+R0
		ADD R4,R4,R2				; R4 = -R1+R0+R2
		BRn END_TriangleInequality	; If negative, jump to the end because R3 is already 0
		
	THIRD_CHECK:    			    ; Check if R0+R1>=R2
		NOT R4,R2
		ADD R4,R4,#1				; R4 = -R2
		ADD R4,R4,R0				; R4 = -R2+R0
		ADD R4,R4,R1				; R4 = -R2+R0+R1
		BRn END_TriangleInequality  ; If negative, jump to the end because R3 is already 0
	
	IS_Triangle_Inequality
		ADD R3,R3,#1				; Set R3 to 1 (triangle inequality holds)
		BR END_TriangleInequality
		
	ILLEGAL_INPUT:					
		ADD R3,R3,#-1				; Set R3 to -1 (indicating illegal input)
	
	END_TriangleInequality:
		; Restore saved registers
		LD R0,R0_SAVE_TRIANGLE
		LD R1,R1_SAVE_TRIANGLE
		LD R2,R2_SAVE_TRIANGLE
		LD R4,R4_SAVE_TRIANGLE
		LD R7,R7_SAVE_TRIANGLE

RET
	
R0_SAVE_TRIANGLE .FILL #0
R1_SAVE_TRIANGLE .FILL #0
R2_SAVE_TRIANGLE .FILL #0
R4_SAVE_TRIANGLE .FILL #0
R7_SAVE_TRIANGLE .FILL #0

.END
