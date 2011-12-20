 MOV	DH, 'A'
 MOV	DL, 'Z'
 
 MOV	AH, DH	; X='A'
 
 Loop1:
 CMP	AH, DL	; X <= 'Z'
 JA	End_Loops
 
 MOV	AL, DH	; Y = 'A'
 
 Loop2:
 CMP	AL, AH	; Y <= X
 JA	End_Loop1
 
 PUSH	DX
 PUSH	AX
 
 ; print symbol in AL here
 
  POP	AX
 POP	DX

 INC	AL
 JMP	Loop2

 End_Loop1:
 PUSH	DX
 PUSH	AX
 
 ; print symbol '\n' here
 
 POP	AX
 POP	DX
 
 INC	AH	; X++
 JMP	Loop1
 
 End_Loops:
ret