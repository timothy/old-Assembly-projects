TITLE Examples of mov       (test_mov.asm)

INCLUDE Irvine32.inc
.data

val2  BYTE  "find the letter F in this sting"

.code
main PROC
	
	mov edi, OFFSET val2           ; This sets edi to the address of val2
	mov al,'F'                     ; This moves the letter F into the al register
	mov ecx, LENGTHOF val2         ; This sets ecx counter to the length of the string
	cld                            ; Direction is going forword
	repne scasb                    ; Repeat while not equal 
	jnz quit                       ; Quit if if letter not found == Jump if Not Zero
	dec edi                        ; Back edi up one so it points to the corect spot


	quit:                          ; Exit program

	exit
main ENDP
END main