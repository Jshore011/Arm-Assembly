@define processor
.cpu cortex-a53
.fpu neon-fp-armv8

.data

.text
.align 2
.global main
.type main, %function

main:
	push {fp, lr}
	add fp, sp, #4

	bl get_input

	bl fibonacci_loop

	sub sp, fp, #4
	pop {fp, pc}
