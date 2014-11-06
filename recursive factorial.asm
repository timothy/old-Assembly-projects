TITLE Calculating a Factorial                   (Fact.asm)

; This program uses recursion to calculate the
; factorial of an integer.
; Last update: 11/23/01

INCLUDE Irvine32.inc
.data
msgInput BYTE "Enter the vauel of n to calculate "
               BYTE "the factorial (-1 to quit) :  " ,0
msgOutput BYTE "The factorial is:  " ,0
msgError BYTE "Error: Calculated value cannot "
              BYTE "fit into 32 bits" ,0

.code
IterFactorial PROTO    ; Calculate factorial non recursive
Factorial PROTO	   	   ; calculate factorial (eax)

main PROC

L1: mov edx, OFFSET msgInput   ; prompt user for number
call WriteString
call ReadInt                   ; get an Integer from the user
call crlf
cmp eax,0                      ; n less than 0?
jl quit                        ; if so , quit now


;INVOKE IterFactorial                    ; EAX = factorial(n)
jo    L2                                ; OF=1 if overflow

;show results
mov edx,OFFSET msgOutput                ; "the factorial is:
call Writestring                        ;
call WriteDec                           ;displays factorial in EAX
jmp L3                                  ;continue the loop

L2: mov edx,OFFSET msgError             ; error message
      call WriteString
L3: call Crlf
     call Crlf
	 loop L1                            ; continue the loop

quit:

	;push 12		            ; calc 12!
	INVOKE Factorial	 	; calculate factorial (eax)
	INVOKE IterFactorial    ; Calculate factorial non recursive
ReturnMain:
	call WriteDec		; display it
	call Crlf
	exit
main ENDP

Factorial PROC
	push ebp
	mov  ebp,esp
	mov  eax,[ebp+8]		; get n
	cmp  eax,0		; n < 0?
	ja   T1		    ; yes: continue
	mov  eax,1		; no: return 1
	jmp  T2

T1: dec  eax
	push eax		; Factorial(n-1)
	INVOKE Factorial

; Instructions from this point on execute when each
; recursive call returns.

ReturnFact:
	mov  ebx,[ebp+8]   		; get n
	mul  ebx          		; ax = ax * bx

T2: pop  ebp		; return EAX
	ret  4		; clean up stack
Factorial ENDP

END main

; this is the non recursive factorial PROC
IterFactorial PROC

       push  ecx
       cmp   eax, 1
	   ja R1
	   mov   eax, 1
	   jmp   quit

R1 :  mov  ecx, eax               ; ecx  = K the factorial number

R2 :  cmp  ecx, 2
        jna   quit
		dec   ecx
		mul   ecx                  ;  N = N * K
		jno   R2                   ;  repeat if no overflow
		
quit:
        call WriteDec              ;displays factorial in EAX
        pop  ecx
		ret
 IterFactorial ENDP
 END main