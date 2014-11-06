TITLE Examples of mov       (test_mov.asm)

INCLUDE Irvine32.inc
.data
y DWORD ?
x DWORD ?
top BYTE "Math Sum",0
B Byte "you did it",0

.code
main PROC
mov ecx,3                ;#5loop counter
l1:
mov eax,0
call Clrscr               ;#5 clears the screen!

mov dh,7
mov dl,20
call Gotoxy

call ReadDec             ; puts my number into x
mov x,eax 
call Crlf                ;#5 This is the end of the line


mov dh,8
mov dl,20
call Gotoxy

call ReadDec              ; puts my number into y
add eax,x                ;adds the two numbers together
call Crlf                ;#5 This is the end of the line

mov dh,9
mov dl,20
call Gotoxy

call WriteInt            ; Displays my int
mov eax,0
mov dh,10
mov dl,20
call Gotoxy

mov ebx,OFFSET top
mov edx,OFFSET B
call WaitMsg
;call MsgBox              ; make a box pop up !!!! when program is running if you press Enter while MsgBox is open it will enter nothing into the next loop

call Crlf                ;#5 This is the end of the line

mov eax,0                 ;resets eax to 0 after each loop
	loop l1

		exit
    main ENDP
END main