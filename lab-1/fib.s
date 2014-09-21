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
	push {r4, r5, lr}

	subs r4 ,r0, #1
	itt le
	pople {r4, r5, pc}		@EPILOG
	bxle lr				@ R0 <= 1, return R0

	mov r0, r4	@ Recursive call to fibonacci with R4 (R0 - 1) as parameter
	bl fibonacci

	mov r5,r0	@store result in R5

	sub r0,r4,#1	@ Recursive call to fibonacci with R4 (R0 - 1) - 1 as parameter
	bl fibonacci

	add r0,r5,r0	@ R0 = R5 + R0

	pop {r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION

	.size fibonacci, .-fibonacci
	.end
