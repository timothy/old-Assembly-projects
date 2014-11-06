TITLE While Loop		     (main.asm)

INCLUDE Irvine32.inc
.data

val1 DWORD 500
val2 Dword 0
val3 dWorD 600

.code
main PROC            ; This is where I put my main proc
mov eax,0            ; I move 0 into eax to start out
.WHILE val2 <= val1  ; I create a while loop 
add val2,5           ; I add 5 to val2
.IF val1 < val3      ; I create an if statement
add val1,2           ; I add 2 to val1
.ENDIF               ; I stop my if statement
sub val1,1           ; I subtract 1 from val1
.ENDW                ; I end my While loop



exit
main ENDP
END main