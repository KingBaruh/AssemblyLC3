.ORIG x3400

; ---------- Test program for integer exp ---------- 
LD R0, Test_Num1_1	; R0 = Test_Num1
LD R1, Test_Num1_2	; R1 = Test_Num2
LD R3, ExpFuncPtr	; R3 = The address of Exp
JSRR R3			; R2 = exp(R0, R1)
LD R1, Test_Res1		; R1 = Test_Res

ADD R2, R2, R1		; R2 = R2 + R1, and remember that R1 is (-1) * The answer!
BRz RES_GOOD1		; If R2 = 0 then jump to Res_Good else continue to Res_Bad
RES_BAD1:
	LEA R0, TEST_ERR_STR
	PUTS
	BR DONE
RES_GOOD1:
	LEA R0, TEST_CORRECT_STR
	PUTS

LD R0, Test_Num2_1	; R0 = Test_Num1
LD R1, Test_Num2_2	; R1 = Test_Num2
LD R3, ExpFuncPtr	; R3 = The address of Exp
JSRR R3			; R2 = exp(R0, R1)
LD R1, Test_Res2		; R1 = Test_Res

ADD R2, R2, R1		; R2 = R2 + R1, and remember that R1 is (-1) * The answer!
BRz RES_GOOD2		; If R2 = 0 then jump to Res_Good else continue to Res_Bad
RES_BAD2:
	LEA R0, TEST_ERR_STR
	PUTS
	BR DONE
RES_GOOD2:
	LEA R0, TEST_CORRECT_STR
	PUTS

LD R0, Test_Num3_1	; R0 = Test_Num1
LD R1, Test_Num3_2	; R1 = Test_Num2
LD R3, ExpFuncPtr	; R3 = The address of Exp
JSRR R3			; R2 = exp(R0, R1)
LD R1, Test_Res3		; R1 = Test_Res

ADD R2, R2, R1		; R2 = R2 + R1, and remember that R1 is (-1) * The answer!
BRz RES_GOOD3		; If R2 = 0 then jump to Res_Good else continue to Res_Bad
RES_BAD3:
	LEA R0, TEST_ERR_STR
	PUTS
	BR DONE
RES_GOOD3:
	LEA R0, TEST_CORRECT_STR
	PUTS

LD R0, Test_Num4_1	; R0 = Test_Num1
LD R1, Test_Num4_2	; R1 = Test_Num2
LD R3, ExpFuncPtr	; R3 = The address of Exp
JSRR R3			; R2 = exp(R0, R1)
LD R1, Test_Res4		; R1 = Test_Res

ADD R2, R2, R1		; R2 = R2 + R1, and remember that R1 is (-1) * The answer!
BRz RES_GOOD4		; If R2 = 0 then jump to Res_Good else continue to Res_Bad
RES_BAD4:
	LEA R0, TEST_ERR_STR
	PUTS
	BR DONE
RES_GOOD4:
	LEA R0, TEST_CORRECT_STR
	PUTS
	
LD R0, Test_Num5_1	; R0 = Test_Num1
LD R1, Test_Num5_2	; R1 = Test_Num2
LD R3, ExpFuncPtr	; R3 = The address of Exp
JSRR R3			; R2 = exp(R0, R1)
LD R1, Test_Res5		; R1 = Test_Res

ADD R2, R2, R1		; R2 = R2 + R1, and remember that R1 is (-1) * The answer!
BRz RES_GOOD5		; If R2 = 0 then jump to Res_Good else continue to Res_Bad
RES_BAD5:
	LEA R0, TEST_ERR_STR
	PUTS
	BR DONE
RES_GOOD5:
	LEA R0, TEST_CORRECT_STR
	PUTS
	
LD R0, Test_Num6_1	; R0 = Test_Num1
LD R1, Test_Num6_2	; R1 = Test_Num2
LD R3, ExpFuncPtr	; R3 = The address of Exp
JSRR R3			; R2 = exp(R0, R1)
LD R1, Test_Res6		; R1 = Test_Res

ADD R2, R2, R1		; R2 = R2 + R1, and remember that R1 is (-1) * The answer!
BRz RES_GOOD6		; If R2 = 0 then jump to Res_Good else continue to Res_Bad
RES_BAD6:
	LEA R0, TEST_ERR_STR
	PUTS
	BR DONE
RES_GOOD6:
	LEA R0, TEST_CORRECT_STR
	PUTS
DONE:	HALT 		; Program is done and will now exit

TEST_ERR_STR .STRINGZ "Result is wrong\n"
TEST_CORRECT_STR .STRINGZ "Result is correct\n"
Test_Num1_1 .FILL #1
Test_Num1_2 .FILL #12
Test_Res1 .FILL #-1; 1^12=1

Test_Num2_1 .FILL #1
Test_Num2_2 .FILL #-12
Test_Res2 .FILL #1; 1^-12, error

Test_Num3_1 .FILL #0
Test_Num3_2 .FILL #122
Test_Res3 .FILL #0; 0^122=0

Test_Num4_1 .FILL #0
Test_Num4_2 .FILL #0
Test_Res4 .FILL #1; 0^0 error

Test_Num5_1 .FILL #1
Test_Num5_2 .FILL #0
Test_Res5 .FILL #-1; 1^0=1

Test_Num6_1 .FILL #4
Test_Num6_2 .FILL #2
Test_Res6 .FILL #-16; 4^2=16

ExpFuncPtr .FILL X40C8 ; Pointer to exp subroutine: R2 <-- R0 ^ R1

.END