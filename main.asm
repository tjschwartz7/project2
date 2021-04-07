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
	RadixInput:
	XOR eax, eax
	LEA edx, input1
	call writestring
	MOV edx, 0
	call readchar
	call writechar
	MOV inputRadix, al
	XOR eax, eax
	MOV al, inputRadix
	CMP al, 30h
	JL RadixInput
	CMP al, 41h
	JGE GreaterThan40h
	CMP al, 39h
	JG RadixInput
	SUB al, 30h
	JMP Done
	GreaterThan40h:
	CMP al, 61h
	JGE GreaterThan60h
	CMP al, 5Ah
	JG RadixInput
	SUB al, 1Dh
	JMP Done
	GreaterThan60h:
	CMP al, 7Ah
	JG RadixInput
	SUB al, 57h
	Done:
	MOV  inputRadix, al
	

	

	
	INVOKE ExitProcess, 0
main endp
end main
