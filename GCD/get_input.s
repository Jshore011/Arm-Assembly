.cpu cortex-a53
.fpu neon-fp-armv8

.data
prompt1: .asciz "Enter the first number: "
prompt2: .asciz "Enter the second number: "
input: .asciz "%d"
newline: .asciz "\n"

.text
.align 2
.global get_input
.type get_input, %function

get_input:
push {fp, lr}
add fp, sp, #4

ldr r0, =prompt1	@get the first number
bl printf

ldr r0, =input
sub sp, sp, #4
mov r1, sp
bl scanf

ldr r0, =newline
bl printf

ldr r9, [sp]	@r9 = value of stack pointer

ldr r0, =prompt2
bl printf

ldr r0, =input
sub sp, sp, #4
mov r1, sp
bl scanf

ldr r10, [sp]	@r10 gets the value of the second number

cmp r9, r10	@the second number should be larger of two
bgt swap	@if not go to swap function

b done

swap:	

mov r8, r9	@r8 is a temp variable
mov r9, r10
mov r10, r8

done:

sub sp, fp, #4
pop {fp, pc}
