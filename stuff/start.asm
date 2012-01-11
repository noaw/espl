section .text
	global _start

extern try
_start:
	mov	eax,esp
	add 	eax,4
	call	try