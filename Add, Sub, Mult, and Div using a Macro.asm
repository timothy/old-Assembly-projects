TITLE EX14_01

INCLUDE Irvine32.inc
.data

pow dword 123456789
bam dword 987654321
x   dword ?
y   dword ?
z   dword ?

add3 MACRO mo1,mo2,mo3 ; ADD MACRO this will pass in all three items mo1=destination mo2=source1 mo3==source2

;push eax

mov eax,mo2  ;this will move mo2 to eax
add eax,mo3  ;this will add mo3 to eax
mov mo1,eax  ;this will move eax into the destination file

;pop eax
ENDM

sub3 MACRO mo1,mo2,mo3 ; SUB MACRO this will pass in all three items mo1=destination mo2=source1 mo3==source2

;push eax

mov eax,mo2 ;this moves mo2 to eax
sub eax,mo3 ;this subtracts mo3 from eax
mov mo1,eax ;this moves eax to mo1

;pop eax
ENDM

mul3 MACRO mo1,mo2,mo3 ; signed multiplier mo1=destination mo2=source1 mo3==source2

push edx       ;I push edx to avoid error

mov eax,mo2    ;I mov mo2 to eax
mov edx, mo3   ;I move mo3 to edx
imul edx       ;I do a signed multiplication of edx with eax
mov mo1,eax    ;I move eax into mo1

pop edx        ;I pop edx back to original value

ENDM

div3 MACRO mo1,mo2,mo3 ; signed division mo1=destination mo2=source1 mo3==source2

push edx       ;I push edx to avoid error

mov eax,mo2    ;I move mo2 to eax
cdq            ;I extend eax into edx
mov ebx, mo3   ;I move mo3 to edx ---- this is the divisor
idiv ebx       ;I do a signed divide of edx with eax
mov mo1,eax    ;I move eax into mo1

pop edx        ;I pop edx back to original value
ENDM

.code
main PROC



	exit
main ENDP
END main