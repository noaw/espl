section .text
section .data
	ans	dd	0
global atod
atod:
	push	ebp
	mov	ebp, esp
.L5:
	mov	eax, [ebp+8]
	move	eax, [eax]
	movzx	eax, al