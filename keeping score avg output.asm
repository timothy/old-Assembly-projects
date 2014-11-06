TITLE Multiply and Divide

INCLUDE Irvine32.inc
.data


count DWORD ?
promt byte "Enter 10 scores between 1 and 50 ",0
promt1 byte "ERROR -- make sure that you are entering a number between 1 & 50",0
promt2 byte "The average of the adjusted scores is: ",0
x dword ?


.code
main PROC

mov esi,0                ; This sets esi to zero so I can use it to increment my array
mov eax,0                ; This clears out eax just in case
mov ecx,10               ; my loop counter to 10
Mainfunct:               ; This is where my loop starts
L1:                      ; this is where you go if bad input is received

mov edx,OFFSET promt     ; I offset promt
call WriteString         ; I am writing the string that was just read
call Crlf                ; This is the end of the line
call ReadDec             ; This is to read in integers
call Crlf                ; This is the end of the line
JMP num                  ; This will skip to assess the number making sure it is between 0 and 50

less:
greater:

;.IF (eax < 0) || (eax > 50) ; this makes sure the number is in range.
mov edx,OFFSET promt1         ; I offset promt
call WriteString           ; I am writing the string that was just read
call Crlf                  ; This is the end of the line
call WaitMsg               ; waits for a key to be pressed
call Crlf                  ; This is the end of the line
jmp L1                     ; jumps back for a retry
;.ENDIF                     ; ends my statement

num:                      ; This is the beginning of my assessment of the number to make sure it is between 0 and 50
cmp eax,1                 ; This compares eax with 0
JL less                   ; This is will jump to have the user try again if the number is less then 0
cmp eax,50                ; This compares eax with 50
JA greater                ; This is will jump to have the user try again if the number is greater than 50

; Add

mov x[esi],eax           ; this moves eax into x
add esi, TYPE x          ; This is so I can increment through the array

;PUSH eax                 ; this pushes eax on to a stack
loop Mainfunct            ; this loops back to Mainfuct tell ecx is all out of numbers

mov esi,0                ; This sets esi to zero so I can use it to increment my array
mov ecx,10               ; This sets my loop counter to 10
disp:
mov eax,x[esi]           ; this moves eax into x
add esi, TYPE x          ; This is so I can increment through the array
call WriteInt            ; Displays my int that are located in eax reg
loop disp

call Crlf                ; This is the end of the line
call Crlf                ; This is the end of the line

mov esi,0                ; This sets esi to zero so I can use it to increment my array
mov ecx,10               ; This sets my loop counter to 10
mov ebx,2                ; I move 2 into ebx so I can mul everything by two using ebx

;Multiply
mult:                   ; my loop for mult by 2
mov eax,x[esi]          ; this moves eax into x
mul ebx                 ; This Multiplies ebx by eax
mov x[esi],eax          ; This moves the product of eax and ebx into x
add esi, TYPE x         ; This is so I can increment through the array
loop mult               ; this keeps looping until ecx = 0

mov esi,0                ; This sets esi to zero so I can use it to increment my array
mov ecx,10               ; This sets my loop counter to 10

disp1:
mov eax,x[esi]           ; this moves eax into x
add esi, TYPE x          ; This is so I can increment through the array
call WriteInt            ; Displays my int that are located in eax reg
loop disp1

call Crlf                ; This is the end of the line
call Crlf                ; This is the end of the line

mov esi,0                ; This sets esi to zero so I can use it to increment my array
mov ecx,10               ; This sets my loop counter to 10
mov eax,0                ; I wand to add all numbers here and want to start from 0

;Add here
adder:                    ; my loop for mult by 2
add eax,x[esi]            ; this add all of the number on the array x to ebx
loop adder                ; this keeps looping until ecx = 0

mov ebx,10                ; I want to divide by 10


;Devide
div ebx                   ; I divide by ebx and eax should hold the final value

mov count,eax

mov ebx,0
mov edx,0
mov eax,0

mov edx,OFFSET promt2      ; I offset promt
call WriteString           ; I am writing the string that was just read
;call Crlf                  ; This is the end of the line

mov eax,count

call WriteInt            ; This should display the result
call Crlf                ; This is the end of the line


		exit
    main ENDP
END main