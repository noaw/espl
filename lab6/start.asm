section .text
	global _start

extern ascart
_start:
	mov	eax,esp
	add 	eax,4
	push 	eax
	push DWORD [esp+4]
	call	ascart
        mov     ebx,eax
	mov	eax,1
	int 0x80
	pop ebp
	pop ebp