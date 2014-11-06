TITLE Examples of open door and close door      (test_mov.asm)

INCLUDE Irvine32.inc
.data

buffer BYTE 50 DUP(0)
count DWORD ?
DoorWind byte 00000000b
hi byte "to open a window/door enter 1 to close a window or door enter 0",0
promt byte "West Window 1: Bit 0",0
promt1 byte "West Window 2: Bit 1",0
promt2 byte "Ken’s Door: Bit 2",0
promt3 byte "Ken’s West Window: Bit 3",0
promt4 byte "Ken’s North Window: Bit 4",0
promt5 byte "Mark’s North Window: Bit 5",0
promt6 byte "The main entrance door: Bit 6",0
promt7 byte "The networking door: Bit 7",0
x dword ?


.code
main PROC
mov edx,OFFSET hi        ; I offset prompt
call WriteString         ; I am writing the string that was just read
call Crlf                ; This is the end of the line


;This is number 0

mov edx,OFFSET promt     ; I offset prompt
call WriteString         ; I am writing the string that was just read
call Crlf                ; This is the end of the line

mov eax,0
call ReadDec             ; This is to read in integers
mov x,eax                ; this moves eax into x
call Crlf                ; This is the end of the line
cmp eax,0                ; if eax is == to 0 then set bit to zero else set bet to one
JE zero1                 ; if eax is set to 0 then jump to set bit to 0 else it will be set to one

or DoorWind,00000001b    ; this will set the bit to 1
jmp over1                ; this will jump over the "set bit to 0" that way it will hold its value of one

zero1:                   ; this will set the bit to zero
and DoorWind,11111110b   ; I set my bit to zero

over1:                   ; I has jumped over the set zero section
call Crlf                ; This is the end of the line
mov eax,DoorWind
call WriteBinB           ; this outputs the content of the eax reg in binary
call Crlf                ; This is the end of the line
call WaitMsg             ; user needs to press a key to continue
call Crlf                ; This is the end of the line


;This is number 1



mov edx,OFFSET promt1     ; I offset prompt
call WriteString         ; I am writing the string that was just read
call Crlf                ; This is the end of the line

mov eax,0
call ReadDec             ; This is to read in integers
mov x,eax                ; this moves eax into x
call Crlf                ; This is the end of the line
cmp eax,0                ; if eax is == to 0 then set bit to zero else set bet to one
JE zero1                 ; if eax is set to 0 then jump to set bit to 0 else it will be set to one

or DoorWind,00000010b    ; this will set the bit to 1
jmp over1                ; this will jump over the "set bit to 0" that way it will hold its value of one

zero1:                   ; this will set the bit to zero
and DoorWind,11111101b   ; I set my bit to zero

over1:                   ; I has jumped over the set zero section
call Crlf                ; This is the end of the line
mov eax,DoorWind
call WriteBinB           ; this outputs the content of the eax reg in binary
call Crlf                ; This is the end of the line
call WaitMsg             ; user needs to press a key to continue
call Crlf                ; This is the end of the line



;This is number 2


mov edx,OFFSET promt     ; I offset prompt
call WriteString         ; I am writing the string that was just read
call Crlf                ; This is the end of the line

mov eax,0
call ReadDec             ; This is to read in integers
mov x,eax                ; this moves eax into x
call Crlf                ; This is the end of the line
cmp eax,0                ; if eax is == to 0 then set bit to zero else set bet to one
JE zero1                 ; if eax is set to 0 then jump to set bit to 0 else it will be set to one

or DoorWind,00000100b    ; this will set the bit to 1
jmp over1                ; this will jump over the "set bit to 0" that way it will hold its value of one

zero1:                   ; this will set the bit to zero
and DoorWind,11111011b   ; I set my bit to zero

over1:                   ; I has jumped over the set zero section
call Crlf                ; This is the end of the line
mov eax,DoorWind
call WriteBinB           ; this outputs the content of the eax reg in binary
call Crlf                ; This is the end of the line
call WaitMsg             ; user needs to press a key to continue
call Crlf                ; This is the end of the line



;This is number 3




mov edx,OFFSET promt     ; I offset promt
call WriteString         ; I am writing the string that was just read
call Crlf                ; This is the end of the line

mov eax,0
call ReadDec             ; This is to read in integers
mov x,eax                ; this moves eax into x
call Crlf                ; This is the end of the line
cmp eax,0                ; if eax is == to 0 then set bit to zero else set bet to one
JE zero1                 ; if eax is set to 0 then jump to set bit to 0 else it will be set to one

or DoorWind,00001000b    ; this will set the bit to 1
jmp over1                ; this will jump over the "set bit to 0" that way it will hold its value of one

zero1:                   ; this will set the bit to zero
and DoorWind,11110111b   ; I set my bit to zero

over1:                   ; I has jumped over the set zero section
call Crlf                ; This is the end of the line
mov eax,DoorWind
call WriteBinB           ; this outputs the content of the eax reg in binary
call Crlf                ; This is the end of the line
call WaitMsg             ; user needs to press a key to continue
call Crlf                ; This is the end of the line




;This is number 4




mov edx,OFFSET promt     ; I offset prompt
call WriteString         ; I am writing the string that was just read
call Crlf                ; This is the end of the line

mov eax,0
call ReadDec             ; This is to read in integers
mov x,eax                ; this moves eax into x
call Crlf                ; This is the end of the line
cmp eax,0                ; if eax is == to 0 then set bit to zero else set bet to one
JE zero1                 ; if eax is set to 0 then jump to set bit to 0 else it will be set to one

or DoorWind,00010000b    ; this will set the bit to 1
jmp over1                ; this will jump over the "set bit to 0" that way it will hold its value of one

zero1:                   ; this will set the bit to zero
and DoorWind,11101111b   ; I set my bit to zero

over1:                   ; I has jumped over the set zero section
call Crlf                ; This is the end of the line
mov eax,DoorWind
call WriteBinB           ; this outputs the content of the eax reg in binary
call Crlf                ; This is the end of the line
call WaitMsg             ; user needs to press a key to continue
call Crlf                ; This is the end of the line





;This is number 5







mov edx,OFFSET promt     ; I offset prompt
call WriteString         ; I am writing the string that was just read
call Crlf                ; This is the end of the line

mov eax,0
call ReadDec             ; This is to read in integers
mov x,eax                ; this moves eax into x
call Crlf                ; This is the end of the line
cmp eax,0                ; if eax is == to 0 then set bit to zero else set bet to one
JE zero1                 ; if eax is set to 0 then jump to set bit to 0 else it will be set to one

or DoorWind,00100000b    ; this will set the bit to 1
jmp over1                ; this will jump over the "set bit to 0" that way it will hold its value of one

zero1:                   ; this will set the bit to zero
and DoorWind,11011111b   ; I set my bit to zero

over1:                   ; I has jumped over the set zero section
call Crlf                ; This is the end of the line
mov eax,DoorWind
call WriteBinB           ; this outputs the content of the eax reg in binary
call Crlf                ; This is the end of the line
call WaitMsg             ; user needs to press a key to continue
call Crlf                ; This is the end of the line






;This is number 6






mov edx,OFFSET promt     ; I offset prompt
call WriteString         ; I am writing the string that was just read
call Crlf                ; This is the end of the line

mov eax,0
call ReadDec             ; This is to read in integers
mov x,eax                ; this moves eax into x
call Crlf                ; This is the end of the line
cmp eax,0                ; if eax is == to 0 then set bit to zero else set bet to one
JE zero1                 ; if eax is set to 0 then jump to set bit to 0 else it will be set to one

or DoorWind,01000000b    ; this will set the bit to 1
jmp over1                ; this will jump over the "set bit to 0" that way it will hold its value of one

zero1:                   ; this will set the bit to zero
and DoorWind,10111111b   ; I set my bit to zero

over1:                   ; I has jumped over the set zero section
call Crlf                ; This is the end of the line
mov eax,DoorWind
call WriteBinB           ; this outputs the content of the eax reg in binary
call Crlf                ; This is the end of the line
call WaitMsg             ; user needs to press a key to continue
call Crlf                ; This is the end of the line


;This is number 7


mov edx,OFFSET promt     ; I offset prompt
call WriteString         ; I am writing the string that was just read
call Crlf                ; This is the end of the line

mov eax,0
call ReadDec             ; This is to read in integers
mov x,eax                ; this moves eax into x
call Crlf                ; This is the end of the line
cmp eax,0                ; if eax is == to 0 then set bit to zero else set bet to one
JE zero1                 ; if eax is set to 0 then jump to set bit to 0 else it will be set to one

or DoorWind,10000000b    ; this will set the bit to 1
jmp over1                ; this will jump over the "set bit to 0" that way it will hold its value of one

zero1:                   ; this will set the bit to zero
and DoorWind,01111111b   ; I set my bit to zero

over1:                   ; I has jumped over the set zero section
call Crlf                ; This is the end of the line
mov eax,DoorWind
call WriteBinB           ; this outputs the content of the eax reg in binary
call Crlf                ; This is the end of the line
call WaitMsg             ; user needs to press a key to continue
call Crlf                ; This is the end of the line


		exit
    main ENDP
END main