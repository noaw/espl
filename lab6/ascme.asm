section	.text
	global ahalan
	extern puts

ahalan:					;void ahalan()
	push ebp
	mov ebp, esp
	push msg
	call puts
	add esp, 4
	pop ebp
	ret

section	.data

msg	db	'ahalan!',0xa,0	;our dear string
