.ORIG x3800

; ---------- Test program for integer TRIANGLE ---------- 
LD R0, Test_Num1_1	; R0 = Test_Num1
LD R1, Test_Num1_2	; R1 = Test_Num2
LD R2, Test_Num1_3	; R2 = Test_Num2
LD R4, Triangle_FuncPtr	; R4 = The address of triangle
JSRR R4				; R4 
LD R1, Test_Res1		; R1 = Test_Res

; At this point R1 holds (-1) * correct answer
; While R3 holds the result that the function returned

ADD R3, R3, R1		; R3 = R3 + R1, and remember that R1 is (-1) * The answer!
BRz RES_GOOD1		; If R3 = 0 then jump to Res_Good else continue to Res_Bad
RES_BAD1:
	LEA R0, TEST_ERR_STR
	PUTS
	BR DONE
RES_GOOD1:
	LEA R0, TEST_CORRECT_STR
	PUTS
	
LD R0, Test_Num2_1	; R0 = Test_Num1
LD R1, Test_Num2_2	; R1 = Test_Num2
LD R2, Test_Num2_3	; R2 = Test_Num2
LD R4, Triangle_FuncPtr	; R4 = The address of triangle
JSRR R4				; R4 
LD R1, Test_Res2		; R1 = Test_Res

; At this point R1 holds (-1) * correct answer
; While R3 holds the result that the function returned

ADD R3, R3, R1		; R3 = R3 + R1, and remember that R1 is (-1) * The answer!
BRz RES_GOOD2		; If R3 = 0 then jump to Res_Good else continue to Res_Bad
RES_BAD2:
	LEA R0, TEST_ERR_STR
	PUTS
	BR DONE
RES_GOOD2:
	LEA R0, TEST_CORRECT_STR
	PUTS
	
LD R0, Test_Num3_1	; R0 = Test_Num1
LD R1, Test_Num3_2	; R1 = Test_Num2
LD R2, Test_Num3_3	; R2 = Test_Num2
LD R4, Triangle_FuncPtr	; R4 = The address of triangle
JSRR R4				; R4 
LD R1, Test_Res3		; R1 = Test_Res

; At this point R1 holds (-1) * correct answer
; While R3 holds the result that the function returned

ADD R3, R3, R1		; R3 = R3 + R1, and remember that R1 is (-1) * The answer!
BRz RES_GOOD3		; If R3 = 0 then jump to Res_Good else continue to Res_Bad
RES_BAD3:
	LEA R0, TEST_ERR_STR
	PUTS
	BR DONE
RES_GOOD3:
	LEA R0, TEST_CORRECT_STR
	PUTS
	
DONE:	HALT 		; Program is done and will now exit

TEST_ERR_STR .STRINGZ "Result is wrong\n"
TEST_CORRECT_STR .STRINGZ "Result is correct\n"
Test_Num1_1 .FILL #1
Test_Num1_2 .FILL #2
Test_Num1_3 .FILL #-3
Test_Res1 .FILL #1 ;

Test_Num2_1 .FILL #6
Test_Num2_2 .FILL #9
Test_Num2_3 .FILL #10
Test_Res2 .FILL #-1 ;

Test_Num3_1 .FILL #1
Test_Num3_2 .FILL #5
Test_Num3_3 .FILL #8
Test_Res3 .FILL #0 ;
Triangle_FuncPtr .FILL X4190 ; Pointer to TRIANGLE subroutine

.END