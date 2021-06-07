@checkPrimeNumber.s

.cpu cortex-a53
.fpu neon-fp-armv8

.data

.text
.align 2
.global checkPrimeNumber
.type checkPrimeNumber, %function

checkPrimeNumber:

	push {fp, lr}
	add fp, sp, #4

	mov r5, r0

	@int j, flag = 1
	
	mov r6, #2  @int j=2 
	udiv r3, r5, r6 @n/2 

	mov r4, #1  @flag = 1

	@for(j=2; j<= n/2; ++j)
	
loop:
	
	cmp r6, r3	@check if j<= n/2	
	bgt done_loop
	
	@modulus operation
	udiv r4, r5, r6 @r4 = n/j
	mul r4, r4, r6  @r4 = (n/j)*j
	sub r4, r5, r4  @r4 = n - (n/j)*j
	mov r0, r4

	@if(n%j == 0) 
	cmp r0, #0	@compare value in r4 to 0
	beq set_flag	@if equal to 0 branch to change flag

	add r6, r6, #1	@increment j
	b loop

set_flag:	
	mov r0, #0	@changes flag to 0
	b done_loop	@breaks out of loop

done_loop:
	
	mov r0, r4	@moves flag into r0

	sub sp, fp, #4
	pop {fp, pc}

