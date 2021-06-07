.cpu cortex-a53
.fpu neon-fp-armv8

.data
gcd_output: .asciz "GCD is: %d\n"

.text
.align 2
.global gcd_loop
.type gcd_loop, %function

gcd_loop:
push {fp, lr}
add fp, sp, #4

loop:

udiv r0, r10, r9 @r10 / r9 = 
mul r1, r0, r9
sub r2, r10, r1
mov r10, r9
mov r9, r2

cmp r9, #0
beq done_loop

b loop

done_loop:

ldr r0, =gcd_output
mov r1, r10
bl printf

sub sp, fp, #4
pop {fp, pc}
