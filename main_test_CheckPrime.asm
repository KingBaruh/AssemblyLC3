.ORIG x3600

; ---------- Test program for integer CheckPrime ---------- 
LD R0, Test_Num1	; R0 = Test_Num1
LD R3, CheckPrimeFuncPtr	; R3 = The address of CheckPrime
JSRR R3			; R2 = CheckPrime(R0)
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
	
LD R0, Test_Num2	; R0 = Test_Num2
LD R3, CheckPrimeFuncPtr	; R3 = The address of CheckPrime
JSRR R3			; R2 = CheckPrime(R0)
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

LD R0, Test_Num3	; R0 = Test_Num2
LD R3, CheckPrimeFuncPtr	; R3 = The address of CheckPrime
JSRR R3			; R2 = CheckPrime(R0)
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

LD R0, Test_Num4	; R0 = Test_Num2
LD R3, CheckPrimeFuncPtr	; R3 = The address of CheckPrime
JSRR R3			; R2 = CheckPrime(R0)
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
	
DONE:	HALT 		; Program is done and will now exit

TEST_ERR_STR .STRINGZ "Result is wrong\n"
TEST_CORRECT_STR .STRINGZ "Result is correct\n"
Test_Num1 .FILL #7
Test_Num2 .FILL #27
Test_Num3 .FILL #0
Test_Num4 .FILL #1

Test_Res .FILL #-1 
Test_Res2 .FILL #0
Test_Res3 .FILL #0
Test_Res4 .FILL #0

CheckPrimeFuncPtr .FILL X412C ; Pointer to exp subroutine

.END