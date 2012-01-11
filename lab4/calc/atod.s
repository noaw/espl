	.file	"atod.c"
	.intel_syntax noprefix
	.text
.globl atod
	.type	atod, @function
atod:
	push	ebp
	mov	ebp, esp
	sub	esp, 40
	mov	DWORD PTR [ebp-12], 0
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	strlen
	mov	DWORD PTR [ebp-20], eax
	mov	DWORD PTR [ebp-16], 0
	jmp	.L2
.L3:
	mov	edx, DWORD PTR [ebp-12]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	add	eax, eax
	mov	edx, eax
	mov	eax, DWORD PTR [ebp-16]
	add	eax, DWORD PTR [ebp+8]
	movzx	eax, BYTE PTR [eax]
	movsx	eax, al
	sub	eax, 48
	lea	eax, [edx+eax]
	mov	DWORD PTR [ebp-12], eax
	add	DWORD PTR [ebp-16], 1
.L2:
	mov	eax, DWORD PTR [ebp-16]
	cmp	eax, DWORD PTR [ebp-20]
	jl	.L3
	mov	eax, DWORD PTR [ebp-12]
	leave
	ret
	.size	atod, .-atod
	.ident	"GCC: (Ubuntu/Linaro 4.5.2-8ubuntu4) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
