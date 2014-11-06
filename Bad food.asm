TITLE Examples of mov       (test_mov.asm)

INCLUDE Irvine32.inc
.data
val1  WORD  0FEDh
val2  BYTE  0Ah
val3  WORD  0DADh
val4  DWORD 0BAD0F00Dh

.code
main PROC
	mov eax,val4   ; Bad food is now in register EAX
	mov bl,val2    ; 0Ah to lowest byte of EBX
	mov cx,val3    ; Dad is now stuck in register ECX
	add ecx,eax    ; Add bad food to dad
	mov val4,ecx   ;Save resilt in val 4
     call DumpRegs
	exit
main ENDP
END main