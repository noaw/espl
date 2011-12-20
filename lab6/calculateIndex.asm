section .text
	global calculateIdx
extern printme
;8 i
;12 j
;16 argv
calculateIdx:
    push ebp
    mov ebp, esp
    mov eax, 4
    mov ebx, [ebp+16]

    ;push ebx
    ;call printme
    ;add esp, 4

    mov ecx, [ebp+8]
    ;mov ecx, [ecx]

    push ecx
    call printme
    add esp, 4

    ;mov eax, 4
 
    push eax
    call printme
    add esp, 4

    mul ecx

    push eax
    call printme
    add esp, 4

    add ebx, eax
    mov ebx, [ebx]
    mov eax, 4
    mov ecx, [ebp+12]
    mul ecx
    add ebx, eax
    mov ebx, [ebx]
    push ebx
    call printme
    pop ebp
    push msg
    call printme
    pop ebp
    ret

section	.data

msg	db	'ahalan!',0xa,0	;our dear string