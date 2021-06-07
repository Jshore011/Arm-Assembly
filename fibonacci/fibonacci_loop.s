@define processor
.cpu cortex-a53
.fpu neon-fp-armv8

.data
	output: .asciz "The %d fibonacci term is: "
	fib_number: .asciz "%d\n"

.text
.align 2
.global fibonacci_loop
.type fibonacci_loop, %function

fibonacci_loop:
	push {fp, lr}
	add fp, sp, #4

	mov r1, #1
	mov r2, #1
	mov r3, #1	@this is our counter variable

fib_loop:
	add r3, r3, #1	@i = i + 1

	cmp r3, r7	@compares i to user input
	bge done_fib_loop	@if they are the same, exit loop

	@calculate fibonacci
	add r2, r1, r2
	sub r1, r2, r1

	b fib_loop

	done_fib_loop:

	mov r5, r2

	@print output
	ldr r0, =output
	mov r1, r7
	bl printf

	ldr r0, =fib_number
	mov r1, r5
	bl printf

	@restore stack pointer to memory location
	sub sp, fp, #4
	pop {fp, pc}
