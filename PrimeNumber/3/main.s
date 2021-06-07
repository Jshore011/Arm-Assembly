@main.s

.cpu cortex-a53
.fpu neon-fp-armv8

.data
prompt1: .asciz "Enter first positive integer: "
prompt2: .asciz "Enter second positive integer: "
int: .asciz "%d"
output1: .asciz "Prime numbers between %d and %d are: "
prime_output: .asciz "%d "
newline: .asciz "\n"

.text
.align 2
.global main
.type main, %function


main:
	push {fp,lr}
	add fp, sp, #4

	@prompt the user to enter first positive integer
	ldr r0, =prompt1
	bl printf

	@gets first integer
	ldr r0, =int
	sub sp, sp, #4
	mov r1, sp

	bl scanf

	@ldr r0, =newline	@newline
	@bl printf

	ldr r9, [sp] @puts first int into r9

	add sp, sp, #4 @restore sp

	@prompt the user to enter second positive integer
	ldr r0, =prompt2
	bl printf

	@get's second integer
	ldr r0, =int
	sub sp, sp, #4
	mov r1, sp
	bl scanf

	ldr r10, [sp]  @puts second int into r10

	add sp, sp, #4 @restores sp
	
	@"the prime numbers between %d and %d are: "
	ldr r0, =output1
        mov r1, r9
	mov r2, r10
	bl printf
	
	@loop for(i=n1+1; i<n2; ++i)
	@r7 = i
	
	add r7, r9, #1	@i=n1+1		
	
loop:
	
	cmp r7, r10	@compares i to n2
	bge done	@if i>n2 branch to done
	mov r0, r7	@moves r7 into r0

	bl checkPrimeNumber	@branch to checkPrimeNumber function

	@if(flag == 1)
	mov r8, r0	@move value of flag
	cmp r8, #1	@compare flag to 1 
	beq prime_numb	@if flag ==1 print prime number

	add r7, r7, #1	@increment i
	b loop	@if not equal start loop over
	
	
prime_numb:
	@prime number output
	ldr r0, =prime_output
	mov r1, r7
	bl printf
	
	add r7, r7, #1	@increment i
	b loop		@branch to beginning of loop

done:
	ldr r0, =newline	@newline
	bl printf

	mov r0, #0	@return 0

	sub sp, fp, #4
	pop {fp, pc}

