section	.text
	global fopen

fopen:					
	push 	ebp
	mov 	ebp, esp
	mov	eax,5
	mov	ebx, [ebp+8]
	mov	ecx, [ebp+12]
	mov	edx, [ebp+16]
	int	0x80
	pop ebp
	ret
