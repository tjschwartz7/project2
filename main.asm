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
input1 DB "Please enter an input radix:",0ah,0dh,0
input2 DB "Please enter a value, one character at a time, in your chosen radix:",0ah,0dh,0
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
	SUB al, 30h
	CMP al, 0
	JL RadixInput
	CMP al, 9
	JG RadixInput
	MOV  inputRadix, al

	

	
	INVOKE ExitProcess, 0
main endp
end main
