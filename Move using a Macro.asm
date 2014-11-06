TITLE EX14_01

INCLUDE Irvine32.inc
.data

pow dword 123456789
bam dword 987654321
x   dword ?
y   dword ?
z   dword ?

mMov MACRO mo1, mo2
push eax
  mov eax,mo2
  mov mo1,eax
  pop eax
ENDM

.code
main PROC

mov eax,pow              ; this is so I can show what is in pow right now to see if it swiched
call WriteInt            ; Desplays my int that are located in eax reg
call Crlf                ; This is the end of the line

mMov pow,bam             ; this is where I mov bam into pow

mov eax,pow              ; this is so I can show what is in pow right now to see if it swiched
call WriteInt            ; Desplays my int that are located in eax reg   ;this should desplay what bam says now that i moved it to pow
call Crlf                ; This is the end of the line

Call ReadDec
mov x,eax                ; this moves eax into x

mMov bam,x

mov eax,bam              ; this is so I can show what is in this right now to see if it swiched
call WriteInt            ; Desplays my int that are located in eax reg   ;this should desplay what bam says now that i moved it to pow
call Crlf                ; This is the end of the line

Call ReadDec
mov y,eax                ; this moves eax into x
call Crlf                ; This is the end of the line

Call ReadDec
mov z,eax                ; this moves eax into x

mMov y,z                 ; this moves z into y
mMov x,y                 ; this moves y into x
mMov z,x                 ; this moves x into z --- this should display the origanal value of z

call Crlf                ; This is the end of the line

mov eax,z                ; this is so I can show what is in this right now to see if it swiched
call WriteInt            ; Desplays my int that are located in eax reg   ;this should desplay what bam says now that i moved it to pow
call Crlf                ; This is the end of the line

	exit
main ENDP
END main