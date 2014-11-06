TITLE Examples of mov       (test_mov.asm)

INCLUDE Irvine32.inc
.data
ranNum DWORD ?
string BYTE "colorfull text!!!",0
y word ?
x word ?

.code
main PROC
call randomize

mov ecx,10               ;#5loop counter
l1:
call moon                ; I call moon in order to make the text move randomly

mov  eax,15              ;#5get random number 
call RandomRange         ;#5 this is an attempt to generate random numbers
                         ;#5 I am trying to make random colors
call SetTextColor        ;#5 my color setter

mov edx, OFFSET string   ;#? my off-setter
call WriteString

call Crlf                ;#5 This is the end of the line

mov eax,800               ;This is how many milliseconds to wait for
call Delay                ;This is my time delay

mov eax,0                 ;resets eax to 0 after each loop

call Clrscr               ;#5 clears the screen!
	loop l1

		exit
    main ENDP

	moon PROC ; this is my function moon

mov  al,80       ;#2get random number 
call RandomRange ;#5 this is an attempt to generate random numbers
mov dl,al

mov  ah,25       ;#2get random number 
call RandomRange ;#5 this is an attempt to generate random numbers
mov dh,ah

call Gotoxy

ret
moon ENDP


END main