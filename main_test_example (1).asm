.ORIG x3000

; ---------- Test program for integer multiplication ---------- 
LD R0, Test_Num1	; R0 = Test_Num1
LD R1, Test_Num2	; R1 = Test_Num2
LD R3, MulFuncPtr	; R3 = The address of Mul
JSRR R3			; R2 = Mul(R0, R1)
LD R1, Test_Res		; R1 = Test_Res

; At this point R1 holds (-1) * correct answer
; While R2 holds the result that the function returned

ADD R2, R2, R1		; R2 = R2 + R1, and remember that R1 is (-1) * The answer!
BRz RES_GOOD		; If R2 = 0 then jump to Res_Good else continue to Res_Bad
RES_BAD:
	LEA R0, TEST_ERR_STR
	PUTS
	BR DONE
RES_GOOD:
	LEA R0, TEST_CORRECT_STR
	PUTS
DONE:	HALT 		; Program is done and will now exit

TEST_ERR_STR .STRINGZ "Result is wrong"
TEST_CORRECT_STR .STRINGZ "Result is correct "
Test_Num1 .FILL #6
Test_Num2 .FILL #70
Test_Res .FILL #-420 ; (-1)*6*70
MulFuncPtr .FILL X4000 ; Pointer to Mul subroutine: R2 <-- R0 * R1

.END