section .text
global hsvmhr
hsvmhr:
	push	ebp
	mov	ebp, esp
.L5:
	mov	eax, [ebp+8] ; eax = *ebp+8; eax gets the value inside [ebp+8]
	mov	eax, [eax] ; eax = *eax; eax gets the value of the pointer which is inside of eax
	mov	edx, [ebp+12] ; edx = *edp+8;
	mov	edx, [edx] ;edx = *edp+8
	movzx eax, al ; movzx - move in zero extension - moves a small number to a bigger place (?)
		      ; al - the first byte of eax. This command leaves only the first byte inside eax
	movzx edx, dl
	sub	eax, edx
	je	.L2
	jmp	.L3
.L2:
	test dl, dl ;checks if dl!=0. test - a binary add action, that doesn't save its result
	jne	.L4
	xor	eax, eax ; xor(a,a)=0
	jmp	.L3
.L4:
	add	DWORD [ebp+8], 1 ; first parameter. ebp - a poitner to the start of the stck frame
	add	DWORD [ebp+12], 1
	jmp	.L5
.L3:
	pop	ebp
	ret