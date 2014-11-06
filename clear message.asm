TITLE MASM Template						(main.asm)
INCLUDE Irvine32.inc
.data
msg byte "Clear this entire message",0
.code

FillArray PROC, pArray:PTR BYTE, fillVal:BYTE, arraySize:DWORD
	mov ecx,arraySize
	mov esi,pArray
	mov al,fillVal
L1:	mov [esi],al
	inc esi
	loop L1
	ret
FillArray ENDP

main PROC
	push sizeof msg
	push 0
	push OFFSET msg
	call FillArray
	exit
main ENDP

END main
