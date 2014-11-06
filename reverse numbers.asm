TITLE Examples of mov       (test_mov.asm)

INCLUDE Irvine32.inc
.data

buffer BYTE 50 DUP(0)
count DWORD ?
promt byte "Enter something between 1 and 50 characters",0
promt2 byte "Enter some numbers I will try to reverse it!!",0
x dword ?


.code
main PROC
mov edx,OFFSET promt     ; I offset promt
call WriteString         ; I am writing the string that was just read
call Crlf                ; This is the end of the line

mov edx, OFFSET buffer
mov ecx,SIZEOF buffer -1
call ReadString          ;I am reading the users input

call Crlf                ; This is the end of the line

call WriteString         ; I am writing the string that was just read
call Crlf   
             ; This is the end of the line
mov edx,OFFSET promt2     ; I offset promt
call WriteString         ; I am writing the string that was just read
call Crlf                ; This is the end of the line
mov eax,0                ; This clears out eax just in case
call ReadDec             ; This is to read in integers
mov x,eax                ; this moves eax into x
call Crlf                ; This is the end of the line

mov esi,0                ; setts esi to 0 so i can get the first number of my array
mov ecx,LENGTHOF x       ; loop counter for loop number 1

l1:
mov eax,x[esi]       ; moves numbers starting from first number into eax
push eax             ; I push my numbers onto a stack
inc esi              ; I inc my counter so i can get the next carecter
	loop l1

	mov esi,0               ; setts esi to 0 so i can get the first number
	mov ecx,LENGTHOF x      ; loop counter for loop number 2

	l2:
	pop eax              ; I pop eax
	mov x[esi],eax       ; puts the last number of the stack here
	inc esi              ; I inc my counter so i can get the next charecter
	loop l2              

;	mov eax,x
call WriteInt            ; Desplays my int that are located in eax reg

		exit
    main ENDP
END main