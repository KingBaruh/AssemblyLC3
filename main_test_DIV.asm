.ORIG x3200

; ---------- Test program for integer DIV ---------- 
LD R0, Test_Num1_1	; R0 = Test_Num1
LD R1, Test_Num1_2	; R1 = Test_Num2
LD R3, DivFuncPtr	; R3 = The address of DIV
JSRR R3				; 
LD R1, Test_Res_1_R2	; R1 = R2
LD R5, Test_Res_1_R3	; R5 = R3


ADD R2, R2, R1		; R2 = R2 + R1, and remember that R1 is (-1) * The answer!
BRz RES_R2_GOOD1	; If R2 = 0 then jump to Res_Good else continue to Res_Bad
RES_R2_BAD1:
	LEA R0, TEST_ERR_R2_STR
	PUTS
	BR NEXT1
RES_R2_GOOD1:
	LEA R0, TEST_CORRECT_R2_STR
	PUTS
NEXT1:
ADD R3, R3, R5		; R3 = R3 + R5, and remember that R5 is (-1) * The answer!
BRz RES_R3_GOOD1		; If R3 = 0 then jump to Res_Good else continue to Res_Bad
RES_R3_BAD1:
	LEA R0, TEST_ERR_R3_STR
	PUTS
	BR DONE
RES_R3_GOOD1:
	LEA R0, TEST_CORRECT_R3_STR
	PUTS
	
LD R0, Test_Num2_1	; R0 = Test_Num1
LD R1, Test_Num2_2	; R1 = Test_Num2
LD R3, DivFuncPtr	; R3 = The address of DIV
JSRR R3				; 
LD R1, Test_Res_2_R2	; R1 = R2
LD R5, Test_Res_2_R3	; R5 = R3


ADD R2, R2, R1		; R2 = R2 + R1, and remember that R1 is (-1) * The answer!
BRz RES_R2_GOOD2	; If R2 = 0 then jump to Res_Good else continue to Res_Bad
RES_R2_BAD2:
	LEA R0, TEST_ERR_R2_STR
	PUTS
	BR NEXT2
RES_R2_GOOD2:
	LEA R0, TEST_CORRECT_R2_STR
	PUTS
NEXT2:
ADD R3, R3, R5		; R3 = R3 + R5, and remember that R5 is (-1) * The answer!
BRz RES_R3_GOOD2		; If R3 = 0 then jump to Res_Good else continue to Res_Bad
RES_R3_BAD2:
	LEA R0, TEST_ERR_R3_STR
	PUTS
	BR DONE
RES_R3_GOOD2:
	LEA R0, TEST_CORRECT_R3_STR
	PUTS
	
LD R0, Test_Num3_1	; R0 = Test_Num1
LD R1, Test_Num3_2	; R1 = Test_Num2
LD R3, DivFuncPtr	; R3 = The address of DIV
JSRR R3				; 
LD R1, Test_Res_3_R2	; R1 = R2
LD R5, Test_Res_3_R3	; R5 = R3


ADD R2, R2, R1		; R2 = R2 + R1, and remember that R1 is (-1) * The answer!
BRz RES_R2_GOOD3	; If R2 = 0 then jump to Res_Good else continue to Res_Bad
RES_R2_BAD3:
	LEA R0, TEST_ERR_R2_STR
	PUTS
	BR NEXT3
RES_R2_GOOD3:
	LEA R0, TEST_CORRECT_R2_STR
	PUTS
NEXT3:
ADD R3, R3, R5		; R3 = R3 + R5, and remember that R5 is (-1) * The answer!
BRz RES_R3_GOOD3		; If R3 = 0 then jump to Res_Good else continue to Res_Bad
RES_R3_BAD3:
	LEA R0, TEST_ERR_R3_STR
	PUTS
	BR DONE
RES_R3_GOOD3:
	LEA R0, TEST_CORRECT_R3_STR
	PUTS

LD R0, Test_Num4_1	; R0 = Test_Num1
LD R1, Test_Num4_2	; R1 = Test_Num2
LD R3, DivFuncPtr	; R3 = The address of DIV
JSRR R3				; 
LD R1, Test_Res_4_R2	; R1 = R2
LD R5, Test_Res_4_R3	; R5 = R3


ADD R2, R2, R1		; R2 = R2 + R1, and remember that R1 is (-1) * The answer!
BRz RES_R2_GOOD4	; If R2 = 0 then jump to Res_Good else continue to Res_Bad
RES_R2_BAD4:
	LEA R0, TEST_ERR_R2_STR
	PUTS
	BR NEXT4
RES_R2_GOOD4:
	LEA R0, TEST_CORRECT_R2_STR
	PUTS
NEXT4:
ADD R3, R3, R5		; R3 = R3 + R5, and remember that R5 is (-1) * The answer!
BRz RES_R3_GOOD4		; If R3 = 0 then jump to Res_Good else continue to Res_Bad
RES_R3_BAD4:
	LEA R0, TEST_ERR_R3_STR
	PUTS
	BR DONE
RES_R3_GOOD4:
	LEA R0, TEST_CORRECT_R3_STR
	PUTS

LD R0, Test_Num5_1	; R0 = Test_Num1
LD R1, Test_Num5_2	; R1 = Test_Num2
LD R3, DivFuncPtr	; R3 = The address of DIV
JSRR R3				; 
LD R1, Test_Res_5_R2	; R1 = R2
LD R5, Test_Res_5_R3	; R5 = R3


ADD R2, R2, R1		; R2 = R2 + R1, and remember that R1 is (-1) * The answer!
BRz RES_R2_GOOD5	; If R2 = 0 then jump to Res_Good else continue to Res_Bad
RES_R2_BAD5:
	LEA R0, TEST_ERR_R2_STR
	PUTS
	BR NEXT5
RES_R2_GOOD5:
	LEA R0, TEST_CORRECT_R2_STR
	PUTS
NEXT5:
ADD R3, R3, R5		; R3 = R3 + R5, and remember that R5 is (-1) * The answer!
BRz RES_R3_GOOD5		; If R3 = 0 then jump to Res_Good else continue to Res_Bad
RES_R3_BAD5:
	LEA R0, TEST_ERR_R3_STR
	PUTS
	BR DONE
RES_R3_GOOD5:
	LEA R0, TEST_CORRECT_R3_STR
	PUTS
	
DONE:	HALT 		; Program is done and will now exit

TEST_ERR_R2_STR .STRINGZ "Result R_2 is wrong\n"
TEST_CORRECT_R2_STR .STRINGZ "Result R_2 is correct\n"
TEST_ERR_R3_STR .STRINGZ "Result R_3 is wrong\n"
TEST_CORRECT_R3_STR .STRINGZ "Result R_3 is correct\n "

Test_Num1_1 .FILL #110
Test_Num1_2 .FILL #-3
Test_Res_1_R2 .FILL #36 
Test_Res_1_R3 .FILL #-2

Test_Num2_1 .FILL #0
Test_Num2_2 .FILL #25
Test_Res_2_R2 .FILL #0
Test_Res_2_R3 .FILL #0

Test_Num3_1 .FILL #25
Test_Num3_2 .FILL #0
Test_Res_3_R2 .FILL #1
Test_Res_3_R3 .FILL #1

Test_Num4_1 .FILL #-110
Test_Num4_2 .FILL #3
Test_Res_4_R2 .FILL #36 
Test_Res_4_R3 .FILL #-2

Test_Num5_1 .FILL #28
Test_Num5_2 .FILL #9
Test_Res_5_R2 .FILL #-3
Test_Res_5_R3 .FILL #-1

DivFuncPtr .FILL X4064 ; Pointer to DIV subroutine

.END
