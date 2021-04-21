; Project2.asm - This program inputs two values, and allows the user to perform arithmetic operations between them.
;The input and output radices can be set to be different.

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

Include irvine32.inc

.data
valueA DB ?
valueB DB ?
input1 DB "Please enter an input radix: (Allowed Inputs: (0-9)(a-z)(A-Z) for 0d-62d)",0ah,0dh,0
input2 DB "Please the number A:",0ah,0dh,0
input3 DB "Please the number B:",0ah,0dh,0
inputRadix DB ?
outputRadix DB ?

.code
	main proc

	call readnum
	
	

	endOfProgram:

	
	INVOKE ExitProcess, 0

main endp

;----------------------------------------------------------------------------------------------------------------------------------------------
;ReadNum
;Receives: 
;Reads a number in any radix and converts the number into an int and returns it to EAX
;----------------------------------------------------------------------------------------------------------------------------------------------

ReadNum PROC

.data

	number db 33 dup(0);

	askRadix db 'Input Radix: ', 0
	newLine db 13,10,0
	askNum db 'Input number, press enter once done', 13,10,0
	oopsie db ' is larger than radix so that number doesnt make sense its like saying g11 hex, try again but be better', 13,10,0

.code

	pushad

	;Get input for radix and number
	mov edx, offset askRadix
	call writestring
	call readchar
	call writechar
	xor ebx, ebx
	mov bl, al
	mov edx, offset newLine
	call writestring
	mov edx, offset askNum
	call writestring

Check_Sign:

	mov ecx, 32
	mov esi, offset number
	call readchar
	call writechar
	cmp al, 45
	je Set_Negitive
	cmp al, 10
	jle Turned_To_Num
	jmp Fix_Num_Val

Set_Negitive:

	mov dx, 1
	push dx

Read_Loop:
	
	call readchar
	call writechar
	cmp al, 10
	jle Turned_To_Num
	jmp Fix_Num_Val

Turned_To_Num:

	cmp al, bl
	jge Error
	mov [esi], al
	inc esi
	jcxz Turn_To_Int
	dec cx
	jmp Read_Loop

Fix_Num_Val:

		cmp al, 57
		jg Letter
		cmp al, 48
		jl Error
		sub al, '0'
		jmp Turned_To_Num

	Letter:

		cmp al, 90
		jg Lowercase
		cmp al, 65
		jl Error
		sub al, 29
		jmp Turned_To_Num

	Lowercase:

		cmp al, 122
		jg Error
		cmp al, 97
		jl Error
		sub al, 87
		jmp Turned_To_Num

Error:

	mov edx, offset newLine
	call writestring
	call writechar
	mov edx, offset oopsie
	call writestring
	mov esi, offset number
	jmp Check_Sign


	;Convert the array to a regular int
Turn_To_Int:

	

Loop_Thru_Num_Arr:
	
	


Done:

	popad
	ret

ReadNum ENDP

end main
