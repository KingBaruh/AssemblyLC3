
.ORIG x4384
Calculator:     
; Arguments: R0, R1 are numbers (by numerical value)
; Output: The subroutine prints something like "R0(operator)R1=(result)", as seen in the PDF.
	ST R0, R0_SAVE_Calculator
	ST R1, R1_SAVE_Calculator	
	ST R2, R2_SAVE_Calculator 			
	ST R3, R3_SAVE_Calculator					
	ST R4, R4_SAVE_Calculator 					
	ST R5, R5_SAVE_Calculator 			
	ST R6, R6_SAVE_Calculator			
	ST R7, R7_SAVE_Calculator 
	
	LD R6,PTR_PrintNum_Calculator			; Load the pointer to the PrintNum subroutine into R6		
	ADD R2,R0,#0							; R2=R0 Original Argument INPUT
	
	LEA R0,STRING_Calculator				; Load the message for the user 
	PUTS									; Print the message
	GETC 									; Get the operator input	
	OUT 									; Print the operator
	
	ADD R4,R0,#0							; R4=operator INPUT  
	LD R0,ASKII_VALUE_ENTER_Calculator		; Load the ASCII value for enter and print 
	OUT 

	ADD R0,R2,#0							; Return R0 to original Argument INPUT
	
	JSRR R6									; Print the original R0 Argument INPUT 
	ADD R2,R0,#0							; R2=R0 Original Argument INPUT
	ADD R0,R4,#0							; Print the operator INPUT
	OUT										
	ADD R0,R1,#0							; Print the R1 Argument INPUT
	JSRR R6									; Print the R1 Argument INPUT 
	ADD R0,R2,#0							; Return R0 to original Argument INPUT
	
	
	; Check operator and perform corresponding operation	
	Calculator_PLUS_CHECK:
		LD R5,ASKII_VALUE_PLUS_Calculator	; Load the ASCII value for plus operator
		ADD R5,R5,R4						; Check if the input operator is plus
		BRnp Calculator_MINUS_CHECK:		; If not, check for minus
		
		ADD R2,R0,R1 						; Execute the plus operation (R2=R0+R1)
		BR PRINT_END_Calculator				; Proceed to print the result
		
	Calculator_MINUS_CHECK:
		LD R5,ASKII_VALUE_MINUS_Calculator  ; Load the ASCII value for minus operator
		ADD R5,R5,R4						; Check if the input operator is minus
		BRnp Calculator_MUL_CHECK:			; If not, check for multiplication
		
		NOT R1,R1							; Make R1 negative
		ADD R1,R1,#1
		ADD R2,R0,R1 						; Execute the minus operation (R2=R0-R1)
		BR PRINT_END_Calculator				; Proceed to print the result
		
	Calculator_MUL_CHECK:
		LD R5,ASKII_VALUE_MUL_Calculator	; Load the ASCII value for multiplication operator
		ADD R5,R5,R4						; Check if the input operator is multiplication
		BRnp Calculator_DIV_CHECK:			; If not, check for division
		
		LD R6,PTR_MUL_Calculator			; Load the pointer to the multiplication subroutine		
		JSRR R6								; Execute the multiplication operation (R2=R0*R1)
		BR PRINT_END_Calculator				; Proceed to print the result
		
	Calculator_DIV_CHECK:
		LD R5,ASKII_VALUE_DIV_Calculator	; Load the ASCII value for division operator
		ADD R5,R5,R4						; Check if the input operator is division
		BRnp Calculator_EXP_CHECK:			; If not, check for exponentiation
		
		LD R6,PTR_DIV_Calculator			; Load the pointer to the division subroutine	
		JSRR R6								; Execute the division operation (R2=R0/R1)
		BR PRINT_END_Calculator				; Proceed to print the result
		
	Calculator_EXP_CHECK:
		LD R5,ASKII_VALUE_PLUS_Calculator	; Load the ASCII value for exponentiation operator
		ADD R5,R5,R4						; Check if the input operator is exponentiation
			
		LD R6,PTR_EXP_Calculator			; Load the pointer to the exponentiation subroutine	
		JSRR R6								; Execute the exponentiation operation (R2=R0^R1)
	
	
	PRINT_END_Calculator:						; Print the result
		LD R0,ASKII_VALUE_EQUALS_Calculator		; Load the ASCII value for equals sign
		OUT 									; Print the equals sign
		ADD R0,R2,#0							; Load the result of the operation to R0 for print
		LD R6,PTR_PrintNum_Calculator			; Load the pointer to the PrintNum subroutine into R6	
		JSRR R6									; Print the result
	
	; Restore saved registers
	LD R0, R0_SAVE_Calculator
	LD R1, R1_SAVE_Calculator
	LD R2, R2_SAVE_Calculator
	LD R3, R3_SAVE_Calculator
	LD R4, R4_SAVE_Calculator
	LD R5, R5_SAVE_Calculator
	LD R6, R6_SAVE_Calculator
	LD R7, R7_SAVE_Calculator
	
	
RET   
		
R0_SAVE_Calculator .FILL #0
R1_SAVE_Calculator .FILL #0
R2_SAVE_Calculator .FILL #0
R3_SAVE_Calculator .FILL #0
R4_SAVE_Calculator .FILL #0
R5_SAVE_Calculator .FILL #0
R6_SAVE_Calculator .FILL #0
R7_SAVE_Calculator .FILL #0

PTR_PrintNum_Calculator .FILL x4320

PTR_MUL_Calculator .FILL X4000
PTR_DIV_Calculator .FILL X4064
PTR_EXP_Calculator .FILL X40C8

STRING_Calculator .STRINGZ "Enter an arithmetic operation: "
ASKII_VALUE_PLUS_Calculator .FILL #-43
ASKII_VALUE_MINUS_Calculator .FILL #-45
ASKII_VALUE_MUL_Calculator .FILL #-42
ASKII_VALUE_DIV_Calculator .FILL #-47 
ASKII_VALUE_EXP_Calculator .FILL #-94
ASKII_VALUE_ENTER_Calculator .FILL #10
ASKII_VALUE_EQUALS_Calculator .FILL #61

.end
