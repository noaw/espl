section .text
	global _start

extern bcmp
_start:
	mov	eax,esp
	add 	eax,4
	push 	eax
	push DWORD [esp+4]
	call	bcmp
        mov     ebx,eax
	mov	eax,1
	int 0x80
	pop ebp
	pop ebp