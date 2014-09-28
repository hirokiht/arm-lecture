	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	cmp r0, #1
	it le
	bxle lr		@return r0 if r0 <= 1

	push {r4, r5, lr}
	mov r4, r0

	sub r0 ,r0, #1	@ Recursive call to fibonacci with (R0 - 1) as parameter
	bl fibonacci
	mov r5,r0	@store result in R5

	sub r0, r4, #2	@ Recursive call to fibonacci with (R0 - 2) as parameter
	bl fibonacci

	add r0,r5,r0	@ R0 = R5 + R0

	pop {r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION

	.size fibonacci, .-fibonacci
	.end
