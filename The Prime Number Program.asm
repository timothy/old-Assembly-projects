TITLE Examples of mov       (test_mov.asm)

INCLUDE Irvine32.inc
.data

ount DWORD ?
promt byte " You have not entered a prime number<-->",0
promt1 byte " You have entered a prime number<-->",0
promt3 byte " Enter a number to check if its prime<-->",0
x dword ?
two dword 2
three dword 3

.code
main PROC
	
L1:

mov edx,OFFSET promt3    ; I offset prompt
call WriteString         ; I am writing the string that was just read -- this out puts what is in prompt
call Crlf                ; This is the end of the line

call ReadDec             ; This is to read in integers and store it in eax
call Crlf                ; This is the end of the line

Jmp checkNmbr            ; This checks to see if the number is prime or not
isPrime:
sub eax,eax                ; This should set the zero flag
mov edx,OFFSET promt1      ; I offset prompt
call WriteString           ; I am writing the string that was just read
call Crlf                  ; This is the end of the line
call ReadDec               ; This is to read in integers
cmp eax,-1                 ; compares eax with -1
je leavP                   ; Jumps to the end of the program if eax is equal to -1
jmp L1                     ; this jumps back to the top of the program and starts everything over again


checkNmbr:               ; This checks to see if the number is prime or not

cmp eax,1          ; Compares eax with 1
JE isPrime         ; If eax is == to 1 then it is prime and needs to jump to isPrime

cmp eax,2          ; Compares eax with 2
JE isPrime         ; If eax is == to 2 then it is prime and needs to jump to isPrime

cmp eax,3          ; Compares eax with 3
JE isPrime         ; If eax is == to 3 then it is prime and needs to jump to isPrime

mov edx,0
mov x,eax          ; I store my eax value into x
div two            ; I devide by two to see if I get a Remainder in EDX
cmp edx,0          ; I compare edx with 0 in order to see if there is a remainder
JE notPrime        ; If this edx is equal to 0 then the number entered is not prime and I skip to notPrime

mov edx,0
mov eax,x          ; I move the number entered by user back into eax
div three          ; I devide by three to see if I get a Remainder in EDX
cmp edx,0          ; I compare edx with 0 in order to see if there is a remainder
JNE isPrime        ; I will jump to isPrime if this has a Remainder because it meens that it is not 1, 2 or 3 and it is not divisible by 2 and it is not divisable by 3

notPrime:

mov edx,OFFSET promt       ; I offset prompt
call WriteString           ; I am writing the string that was just read
call Crlf                  ; This is the end of the line
call ReadDec               ; This is to read in integers
cmp eax,-1                 ; compares eax with -1
je leavP                   ; Jumps to the end of the program if eax is equal to -1
jmp L1                     ; jumps back for a retry

leavP:


	exit
main ENDP
END main