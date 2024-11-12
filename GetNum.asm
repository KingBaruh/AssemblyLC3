; 318739174, 50%
; 211641956, 50%
.orig x41F4
GetNum:
; Arguments: None.
; Output: R2 = A number, as input by the user. Actual numerical value, NOT ASCII value!
	ST R0, R0_SAVE_GetNum 			; Input from the user
	ST R1, R1_SAVE_GetNum			
	ST R3, R3_SAVE_GetNum			; Flag for not a number error		
	ST R4, R4_SAVE_GetNum 			; Flag for overflow error
	ST R5, R5_SAVE_GetNum			; Register for the sign of R2
	ST R6, R6_SAVE_GetNum 			; Flag indicating if any number character has been input
	ST R7, R7_SAVE_GetNum 
	
	LEA R0,OPENING_MSG				; Load opening message
	PUTS							; Print opening message
	
	INITIALIZE_VALUES_GetNum:
		AND R1,R1,#0 						; Initialize R1 to 0 for future use
		AND R2,R2,#0						; Initialize output to 0
		AND R3,R3,#0						; While R3=0, we are not having not a number error, if R3=-1 error
		AND R4,R4,#0						; While R4=0, there is no overflow; if R4=-1, it indicates an overflow error
		
		AND R5,R5,#0							
		ADD R5,R5,#1						; Default sign is positive (R5=1)
		
		AND R6,R6,#0						; A flag that indicates if any number character has been inputted. If R6=0, no number character has been inputted.
	
	; Main loop to get input characters from the user
	MAIN_LOOP_GetNum:
		GETC								; Input a character from the user
		OUT									; Output the entered character (echo back to user)
		LD R1 ENTER_KEY_VALUE				; Check if the entered character is ENTER key
		ADD R1,R1,R0
		BRz END_LOOP_GetNum					; If ENTER key is pressed, exit the loop
		
		; Check if there is any error
		ADD R3,R3,#0						; We check there is an input is error flag
		BRnp MAIN_LOOP_GetNum				; If error, continue loop until THE USER entered THR ENTER KEY
		
		
		JSR CheckInputCharacter				; We check if the input is valid
		ADD R3,R3,#0
		BRn MAIN_LOOP_GetNum				; If error, continue loop until THE USER entered THR ENTER KEY
		
		ADD R4,R4,#0						; We check if there is an OVERFLOW error 
		BRn MAIN_LOOP_GetNum				; If error, continue loop until THE USER entered THR ENTER KEY
		
        ; Handle minus sign input		
		LD R1,MINUS_KEY_VALUE
		ADD R1,R1,R0						; We check if the user entered minus key(-)
		BRnp INPUT_IS_A_NUMBER				; If so we go to INPUT_IS_A_NUMBER label
		
		INPUT_IS_MINUS_KEY:					; The user entered minus key(-)
			NOT R5,R5						; Make R5=-1
			ADD R5,R5,#1
			BR MAIN_LOOP_GetNum				; Continue the main loop
		
        ; Process input if it's a number character		
		INPUT_IS_A_NUMBER:
			ADD R6,R6,#0
			BRp INPUT_IS_A_NUMBER_STEP2		; If R6=0 make R6=1, Flag that a number character has been input
			ADD R6,R6,#1
			
			INPUT_IS_A_NUMBER_STEP2:
				JSR R2_MUL_TEN				; Multiply the current number by 10
				ADD R4,R4,#0				; Check if thers was an overflow when we multiply the current number by 10
				BRn MAIN_LOOP_GetNum		; If there is an OVERFLOW continue loop until THE USER entered THR ENTER KEY
				
				LD R1,ZERO_KEY_VALUE		; Load the value representing the zero key
				ADD R1,R1,R0				; Load the numeric value of R0 in R1
				
				; Handle sign and add the digit to the number
				SIGN_CHECK_MAIN_LOOP:
					ADD R5,R5,#0						; Check the sign flag
					BRp INPUT_IS_A_NUMBER_LAST_STEP		; If positive, proceed to last step
		
				SWITCH_SIGN_R1_IN_MAIN_LOOP:			; If negative, toggle the sign of the digit
					NOT R1,R1							; Make R1=-R1
					ADD R1,R1,#1
				
				; Add the digit to the number
				INPUT_IS_A_NUMBER_LAST_STEP:
					ADD R2,R2,R1						; Add the digit to the number
				
				JSR CheckOverflow						; Check if the result has overflowed						
		BR MAIN_LOOP_GetNum								; Continue the loop
		
	; End of loop when ENTER key is pressed	
	END_LOOP_GetNum:
		ADD R6,R6,#0						; Check if any number character has been input
		BRz Print_Not_a_number_ERROR		; If no number character has been input, print error message
		
		ADD R3,R3,#0						; Check for non-numeric input error
		BRn Print_Not_a_number_ERROR		; If non-numeric input, print error message
		
		ADD R4,R4,#0						; Check for overflow error
		BRn Print_Overflow_number_ERROR		; If overflow, print error message
		
		BR END_GetNum						; Exit the subroutine	
	
    ; Print error message if no number character has been input	
	Print_Not_a_number_ERROR:
		LEA R0 NOT_A_NUMBER_ERORR_MSG		; Load and output error message for no number input
		PUTS
		BR INITIALIZE_VALUES_GetNum			; Reset and restart the input process
	
	; Print error message if overflow has occurred	
	Print_Overflow_number_ERROR:
		LEA R0 OVERFLOW_NUMBER_ERROR_MSG	; Load and output error message for overflow
		PUTS
		BR INITIALIZE_VALUES_GetNum			; Reset and restart the input process
		
	; Restore saved registers	
	END_GetNum:
		LD R0, R0_SAVE_GetNum 
		LD R1, R1_SAVE_GetNum 
		LD R3, R3_SAVE_GetNum 
		LD R4, R4_SAVE_GetNum 
		LD R5, R5_SAVE_GetNum 
		LD R6, R6_SAVE_GetNum 
		LD R7, R7_SAVE_GetNum 	

; Return from the subroutine	
RET							

; Data section
R0_SAVE_GetNum .FILL #0
R1_SAVE_GetNum .FILL #0
R3_SAVE_GetNum .FILL #0
R4_SAVE_GetNum .FILL #0
R5_SAVE_GetNum .FILL #0
R6_SAVE_GetNum .FILL #0
R7_SAVE_GetNum .FILL #0	

; Constants
ENTER_KEY_VALUE .FILL #-10
MINUS_KEY_VALUE .FILL #-45
ZERO_KEY_VALUE .FILL #-48
NINE_KEY_VALUE .FILL #-57

OPENING_MSG .STRINGZ "Enter an integer number: "
NOT_A_NUMBER_ERORR_MSG .STRINGZ "Error! You did not enter a number. Please enter again: "
OVERFLOW_NUMBER_ERROR_MSG .STRINGZ "Error! Number overflowed! Please enter again: "

; R2_MUL_TEN subroutine
; Input: R2 (a number to be multiplied by 10)
; Output: R2 (result of R2 multiplied by 10)
R2_MUL_TEN:
	
	ST R1, R1_SAVE_R2_MUL_TEN   ; Save R1
	ST R3, R3_SAVE_R2_MUL_TEN   ; Save R3 
	ST R7, R7_SAVE_R2_MUL_TEN   ; Save R7
	
	AND R1,R1,#0
	ADD R1,R1,R2			    ; Load R1 the value of R2
	
	AND R3, R3, #0              ; Initialize R3 to 0
	ADD R3, R3, #9              ; Set R3 to 9
	
	ADD R2, R2, #0		        ; Check if R2 is 0
	BRz R2_MUL_TEN_END		    ; If R2 is 0, the result is also 0
	
	R2_MUL_TEN_LOOP:
		ADD R2, R2, R1		    ; R2=R2+R1
		
		JSR CheckOverflow		; For every R2=R2+R1, we need to check if there was an OVERFLOW  
		ADD R4,R4,#0			; If OVERFLOW, go to the end of the subroutine
		BRn R2_MUL_TEN_END
		
		ADD R3, R3, #-1 		; Decrement R3 (loop counter)
		BRp R2_MUL_TEN_LOOP		; Continue the loop while R3 is positive
	
	R2_MUL_TEN_END:
		; Restore saved registers	
		LD R3, R3_SAVE_R2_MUL_TEN  
		LD R7, R7_SAVE_R2_MUL_TEN 	

RET

; Data section
R1_SAVE_R2_MUL_TEN .FILL #0
R3_SAVE_R2_MUL_TEN .FILL #0   
R7_SAVE_R2_MUL_TEN .FILL #0

; CheckOverflow subroutine
; Input: R2 (value to check for overflow)
; Output: R4 (flag indicating overflow condition)
CheckOverflow:
	ST R7,R7_SAVE_CheckOverflow     ; Save R7	
	
	SIGN_CHECK_IN_CheckOverflow:	; Check what is the sign that we need to stay
		ADD R5,R5,#0
		BRp SIGN_IS_POS				
	
	; The sign is negative
	SIGN_IS_NEG:
		ADD R2,R2,#0 				; Check the sign of R2
		BRnz END_CheckOverflow		; If R2 is negative or zero, jump to the end
		BR SET_OVERFLOW_FLAG		; The sign is negative and R2 is positive that means we got OVERFLOW
		
	; The sign is positive
	SIGN_IS_POS:
		ADD R2,R2,#0         		; Check the sign of R2
		BRzp END_CheckOverflow   	; If R2 is positive or zero, jump to the end. if not that means we got OVERFLOW
	
	; If R2 is opposite of the sign, decrement the overflow flag (R4)
	SET_OVERFLOW_FLAG:		
			ADD R4,R4,#-1			; Decrement R4 to indicate overflow
			
	; End of subroutine
	END_CheckOverflow: 
		; Restore saved registers	
		LD R7,R7_SAVE_CheckOverflow
		
 ; Return from subroutine	
RET                       

; Data section
R7_SAVE_CheckOverflow .FILL #0

; CheckInputCharacter subroutine
; Input: R0 (character to check)
; Output: R3
CheckInputCharacter:
	ST R1, R1_SAVE_CheckInputCharacter   ; Save R1
	ST R7, R7_SAVE_CheckInputCharacter	 ; Save R7
	
	LD R1, MINUS_KEY_VALUE				 ; Load the value representing the minus key and add it to R0
	ADD R1, R1, R0
	BRz CHECK_IF_MINUS_IS_FIRST_CHARACTER          ; If R0 represents the minus key, jump to CHECK_IF_MINUS_IS_FIRST_CHARACTER label
	
	; Check if: ascii of 0 <= R0 <= ascii of 9
	LD R1, ZERO_KEY_VALUE				 ; Load to R1 the value representing the zero
	ADD R1, R1, R0						 ; Check if:  ascii of 0 <= R0
	BRn ILLEGEL_CHARACTER_INPUT          ; If the result is negative, it's an illegal input	
	
	LD R1, NINE_KEY_VALUE			     ; Load to R1 the value representing the nine key
	ADD R1, R1, R0						 ; Check if:  R0 <= ascii of 9
	BRp ILLEGEL_CHARACTER_INPUT     	 ; If the result is positive, it's an illegal input
	
	BR END_CheckInputCharacter			 ; If we reach this line that means:  ascii of 0 <= R0 <= ascii of 9
	
	CHECK_IF_MINUS_IS_FIRST_CHARACTER:
		ADD R5,R5,#0					 ; Check if there was already an minus character input
		BRn ILLEGEL_CHARACTER_INPUT		 ; If there was, its an ERROR and branch to ILLEGEL_CHARACTER_INPUT label
		
		ADD R6,R6,#0					 ; Check if there was already number character thet been entered
		BRp ILLEGEL_CHARACTER_INPUT      ; If there was, its an ERROR and branch to ILLEGEL_CHARACTER_INPUT label
		
		BR END_CheckInputCharacter		 ; If we reach this line that means: minus is the first character that been entered
	
	
	ILLEGEL_CHARACTER_INPUT:			 ; If we reach this line that means we got an error and we need to set R3 flag to be negative
		ADD R3, R3, #-1            		 ; Decrement R3 to indicate an illegal character input
		
	; End of subroutine	
	END_CheckInputCharacter:
		; Restore saved registers	
		LD R1, R1_SAVE_CheckInputCharacter  
		LD R7, R7_SAVE_CheckInputCharacter
	
; Return from the subroutine	
RET                               

; Data section
R1_SAVE_CheckInputCharacter .FILL #0    
R7_SAVE_CheckInputCharacter .FILL #0


.END
