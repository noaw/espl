section	.text
	global try2
try2:

;8  agrc
;12 argv
;16 SYMBOL_HEIGHT
  push ebp
  mov ebp, esp
  push 0
.firstLoop:
  ; ebx is the counter of this loop (=pline)
  pop ebx
  mov edx, [ebp+16]
  sub edx, ebx
  test edx, edx
  jne .exit
  mov ecx, 0
  add ebx, 1
  push ebx
  push 0
  jmp .secondLoop
  ; needed here?  - jump .firstLoop
  pop ebp
  ret

.secondLoop:
  pop ebx
  mov edx, [ebp+8]
  sub edx, 1
  ; edx = argc-1
  ; ecx is the counter of this loop (=i)
  ; ecx<edx
  sub edx, ebx
  test edx, edx
  jne .firstLoop
  mov ecx, ebx
  add ecx, 1
  mov eax, 4
  mul ecx
  mov edx, [ebp+12]
  add edx, eax
  mov edx, [edx]
 
 
  jmp .thirdLoop
 
.thirdLoop:
 
.exit: