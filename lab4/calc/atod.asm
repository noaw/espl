section .text
section .data
	ans	dd 0
global atod
atod:
	push	ebp
	mov	ebp, esp
	mov	eax,0
	mov 	ecx,10
.L5:
	mov	ebx, [ebp+8]
	mov	ebx, [ebx]
	movzx	ebx, bl
	test	bl, bl
	je	.EXIT
	mul	ecx
	add	eax, ebx
	sub	eax, '0'
	add	DWORD [ebp+8],1
	jmp	.L5
.EXIT:
	pop ebp
	ret