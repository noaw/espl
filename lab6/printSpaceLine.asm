section	.text
	global printme
	extern length
	extern write

printme	
	push ebp
	mov ebp, esp
	push    DWORD [ebp+8]
	call	length
	add	esp,4
	push	eax
	push	DWORD [ebp+8]
	push	1
	call write
	add 	esp,12
	pop ebp
	ret
