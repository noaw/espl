section	.text
	global fread

fread:				
	push ebp
	mov ebp, esp
	mov	ecx, [ebp+12]
	mov	edx, [ebp+16]
	mov	ebx, [ebp+8]
	mov	eax,4
	int	0x80
	pop ebp
	ret
