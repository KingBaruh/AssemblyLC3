.ORIG x3000

; ---------- Test program for integer multiplication ---------- 
LD R0, Test_Num1_1	; R0 = Test_Num1
LD R1, Test_Num1_2	; R1 = Test_Num2
LD R3, MulFuncPtr	; R3 = The address of Mul
JSRR R3			; R2 = Mul(R0, R1)
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
LD R3, MulFuncPtr	; R3 = The address of Mul
JSRR R3			; R2 = Mul(R0, R1)
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
LD R3, MulFuncPtr	; R3 = The address of Mul
JSRR R3			; R2 = Mul(R0, R1)
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
LD R3, MulFuncPtr	; R3 = The address of Mul
JSRR R3			; R2 = Mul(R0, R1)
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
LD R3, MulFuncPtr	; R3 = The address of Mul
JSRR R3			; R2 = Mul(R0, R1)
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
LD R3, MulFuncPtr	; R3 = The address of Mul
JSRR R3			; R2 = Mul(R0, R1)
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

LD R0, Test_Num7_1	; R0 = Test_Num1
LD R1, Test_Num7_2	; R1 = Test_Num2
LD R3, MulFuncPtr	; R3 = The address of Mul
JSRR R3			; R2 = Mul(R0, R1)
LD R1, Test_Res7		; R1 = Test_Res

ADD R2, R2, R1		; R2 = R2 + R1, and remember that R1 is (-1) * The answer!
BRz RES_GOOD7		; If R2 = 0 then jump to Res_Good else continue to Res_Bad
RES_BAD7:
	LEA R0, TEST_ERR_STR
	PUTS
	BR DONE
RES_GOOD7:
	LEA R0, TEST_CORRECT_STR
	PUTS
	
DONE:	HALT 		; Program is done and will now exit

TEST_ERR_STR .STRINGZ "Result is wrong\n"
TEST_CORRECT_STR .STRINGZ "Result is correct\n"
Test_Num1_1 .FILL #6
Test_Num1_2 .FILL #70
Test_Res1 .FILL #-420 ; (-1)*6*70

Test_Num2_1 .FILL #0
Test_Num2_2 .FILL #1666
Test_Res2 .FILL #0 ; 0*1666=0
 
Test_Num3_1 .FILL #915
Test_Num3_2 .FILL #-16
Test_Res3 .FILL #14640 ; 915*(-16)=-14640

Test_Num4_1 .FILL #-11
Test_Num4_2 .FILL #555
Test_Res4 .FILL #6105 ; (-11)*555=-6105

Test_Num5_1 .FILL #-12
Test_Num5_2 .FILL #-12
Test_Res5 .FILL #-144 ; (-12)*(-12)=144

Test_Num6_1 .FILL #12
Test_Num6_2 .FILL #123
Test_Res6 .FILL #-1476 ; 12*123=1476

Test_Num7_1 .FILL #1
Test_Num7_2 .FILL #1
Test_Res7 .FILL #-1 ; 1*1=1

MulFuncPtr .FILL X4000 ; Pointer to Mul subroutine: R2 <-- R0 * R1

.END
