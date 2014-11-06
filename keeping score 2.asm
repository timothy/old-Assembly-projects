TITLE Is Prime

INCLUDE Irvine32.inc
.data


count DWORD ?
promt byte " You have not entered a prime number<-->type -1 to exit or any other number to continue",0
promt1 byte " You have entered a prime number<-->type -1 to exit or any other number to continue",0
promt3 byte " Enter a number to check if its prime<-->type -1 to exit or any other number to continue",0
x dword ?


.code
main PROC

L1:

mov edx,OFFSET promt3    ; I offset prompt
call WriteString         ; I am writing the string that was just read
call Crlf                ; This is the end of the line
call ReadDec             ; This is to read in integers
call Crlf                ; This is the end of the line
call isPrime             ; I call the below function I have made

leavP:
		exit
    main ENDP

isPrime PROC   ; this is my prime function to check if prime

mov x,eax

.IF (x MOD 2 != 0) && (x MOD 3 != 0) || (x == 3) || (x == 2) ; if a number modded by 2 and 3 does not return 0 or if it is 2 or 3 then the number is prime

sub eax,eax                ; This should set the zero flag
mov edx,OFFSET promt1      ; I offset prompt
call WriteString           ; I am writing the string that was just read
call Crlf                  ; This is the end of the line
call ReadDec               ; This is to read in integers
cmp eax,-1                 ; compares eax with -1
je leavP                   ; Jumps to the end of the program if eax is equal to -1
jmp L1                     ; this jumps back to the top of the program and starts everything over again

.ELSEIF(x MOD 2==0) || (x MOD 3 == 0) && (x != 3) && (x != 2) ; if a number modded by 2 or 3 returns 0 and is not 2 and is not 3 then the number is not prime

mov edx,OFFSET promt       ; I offset prompt
call WriteString           ; I am writing the string that was just read
call Crlf                  ; This is the end of the line
call ReadDec               ; This is to read in integers
cmp eax,-1                 ; compares eax with -1
je leavP                   ; Jumps to the end of the program if eax is equal to -1
jmp L1                     ; jumps back for a retry
.ENDIF                     ; ends my statement

ret
isPrime ENDP ; this is the end of my function

END main     ; This is the end of everything ^_^