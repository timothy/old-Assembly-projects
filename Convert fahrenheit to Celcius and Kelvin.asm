TITLE Examples of mov       (test_mov.asm)

INCLUDE Irvine32.inc
.data
FIVE     DWORD  5
NINE     DWORD  9
CEL32    DWORD  32

KEL32FP  real4  273.15

prompt    Byte   " Please enter a tempeture in fahrenheit ",0
display  Byte   " Degrees Celcius = ",0
display1 Byte   " Degrees Kelvin = ",0

.code
main PROC


    mov edx, OFFSET prompt         ; This moves the location of my prompt to edx so WriteString can desplay it
	call WriteString               ; This desplays the string edx points to
	call Crlf                      ; This is new line

	CALL ReadFloat                 ; THIS READS THE FAHRENHEIT VALUE AND PUTS IT ON TOP OF THE FPU STACK
	call Crlf                      ; This is new line
    
                 ; FROM FAHRENHEIT TO CELCIUS
	FILD CEL32                     ; THIS CONVERTS 32 INTO A FLOATING POINT AND PUSHES 32 ON TO THE TOP OF THE FPU STACK
	FSUB                           ; THIS SUBTRACTS 32 FROM THE USERS INPUT AND STORES IT ON TOP OF THE STACK

	FILD FIVE                      ; THIS CONVERTS 5 INTO A FLOATING POINT AND PUSHES FIVE TO THE TOP OF THE FPU STACK
	FILD NINE                      ; THIS CONVERTS 9 INTO A FLOATING POINT AND PUSHES NINE TO THE TOP OF THE FPU STACK
	FDIV                           ; THIS DEVIDES 5/9 AND STORES IT ON TOP OF THE STACK
    FMUL                           ; THIS WILL MULTIPLY 5/9 WITH THE NUMBER THE USER ENTERED MINUES 32 AND WILL STORE IT ON TOP OF THE FPU STACK THE CONVIRSION IS COMPLETE
	             ; Out put my result
	mov edx, OFFSET display        ; This moves the location of my prompt to edx so WriteString can desplay it
	call WriteString               ; This desplays the string edx points to
	CALL WriteFloat                ; This will write the converted floating point to the screen
	call Crlf                      ; This is new line

	             ; I CONVERT IT TO KELVIN

	FLD KEL32FP                    ; I PUSH 273.15 ONTO THE TOP OF THE FPU STACK
	FADD                           ; I ADD 273.15 WITH THE CELCIUS NUMBER TO GET KELVIN

		             ; Out put my result
	mov edx, OFFSET display1       ; This moves the location of my prompt to edx so WriteString can desplay it
	call WriteString               ; This desplays the string edx points to
	CALL WriteFloat                ; This will write the converted floating point to the screen
	call Crlf                      ; This is new line




	exit
main ENDP
END main