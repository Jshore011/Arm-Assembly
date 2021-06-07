@ define processor
.cpu cortex-a53
.fpu neon-fp-armv8

@ define constants
.data
	prompt: .asciz "Enter a number: "
	input: .asciz "%d"
	newline: .asciz "\n"

.text
.align 2
.global get_input
.type get_input, %function

get_input:

	push {fp, lr}
	add fp, sp, #4

	@output prompt
	ldr r0, =prompt
	bl printf

	@get user input
	ldr r0, =input
	sub sp, sp, #4
	mov r1, sp
	bl scanf

	@adds newline
	ldr r0, =newline
	bl printf

	@r7 = value of stack pointer
	ldr r7, [sp]

 	sub sp, fp, #4
	pop {fp, pc}
	