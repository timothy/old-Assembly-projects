TITLE Compare values		     (main.asm)
; This program prompts the user to input two integers, 
; compares them using both signed and unsiged comparisons
; Last update: 10/16/2010
INCLUDE Irvine32.inc
.data
msg1  BYTE  "Enter an integer: ",0
msg2  BYTE  "unsigned eax > unsigned ebx",0Dh,0Ah,0
msg3  BYTE  "signed eax > signed ebx",0Dh,0Ah,0
msg4  BYTE  "unsigned eax <= unsigned ebx",0Dh,0Ah,0
msg5  BYTE  "signed eax <= signed ebx",0Dh,0Ah,0

.code 
main PROC
	call	  Clrscr
      mov     edx,OFFSET msg1	    ; "Enter an integer: "
	call    WriteString         ; display string
	call    ReadInt             ; read integer into EAX
	mov     ebx, eax            ; store in EBX
	mov     edx,OFFSET msg1     ; "Enter an integer: "
	call    WriteString         ; display string
	call    ReadInt             ; read integer into EAX

; Now we will compare the two integers entered assuming they are unsigned values
	cmp eax, ebx
	ja  Above	
	jbe BelowOrEqual
Above:
    mov     edx,OFFSET msg2	    ; unsigned eax > unsigned ebx
    call    WriteString
    Jmp     Next
BelowOrEqual:
    mov     edx,OFFSET msg4	    ; unsigned eax <= unsigned ebx
    call    WriteString
    Jmp     Next

Next: ; Now we will again compare the two integers entered assuming they are signed
    cmp eax, ebx
    jg  Greater	
    jle LessThanOrEqual

Greater:
    mov     edx,OFFSET msg3	    ; signed eax > signed ebx
    call    WriteString
    Jmp     Done
LessThanOrEqual:
    mov     edx,OFFSET msg5	    ; signed eax <= signed ebx
    call    WriteString
    Jmp     Done
Done:
    call DumpRegs
    exit	
main ENDP
END main