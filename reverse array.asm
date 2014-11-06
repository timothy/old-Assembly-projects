TITLE Array exchange						(main.asm)

; Description: HW 
; 
; Revision date:

INCLUDE Irvine32.inc
.data

array dword 1d,2d,3d,4d         ;This is my array that will be reversed

.code
main PROC
	call Clrscr

;	
    mov edx,0                           ; this will be my counter
	mov ecx, LENGTHOF array/2           ; Here I divide the length of my array into two// and I add that value into ecx  -- This come out as 2
	mov eax,0                           ; Here I set eax to 0
	mov ebx, SIZEOF array - TYPE array  ; Here I put the SIZEOF array which is the length Multiplied by the type  --- This should come out as 16
	                                    ; I subtract 4 from the SIZEOF in order to for it to be able to access the last element of the array --- this should come out to be 12
	L1:
	mov eax,array[edx]          ; this should move the first element of the array into the eax register  ---- after the loop goes once this would then be accessing the 2nd element...
    mov edi,array[ebx]          ; This should move the 4th element into the edi register   ------ after the loop goes once this would then be accessing the 3rd element...
	mov array[edx],edi          ; this should move the value in edi into the array location that [edx] points to
	mov array[ebx],eax          ; this should move the value of eax into the array location that [edx+ebx] points to
	sub ebx,TYPE array          ; this should subtract 4 from ebx in order for it to step down to the next element in the array
	add edx, TYPE array         ; this should add 4 to edx in order for [edx] to point to the next element in the array
	loop L1                     ; this is my loop. It should go 2 time because I set ecx to half the SIZEOF my array
	


	mov	edx, OFFSET array               ; Here I offset my array

	;call DumpMem

	
	exit
main ENDP

END main