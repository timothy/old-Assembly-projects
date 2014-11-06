TITLE EX13_02

INCLUDE Irvine32.inc
.data

prompt    BYTE  "Type a string of words in that is no longer then 40 charicters",0
prompt1   BYTE  "Type a word that you would like to replace in the string of words you just entered",0
prompt2   BYTE  "Type in the replasment word",0
oldstring BYTE  "Your old string is ->",0
newstring BYTE  "Your new string is ->",0
notFound1 BYTE  "Your word is not found try again",0
val1      BYTE 41 DUP (0) ; This fills val1 with zeroes
longString     dword ?  ; the long string of words entered in by the user
searchString   dword ?  ; the short string e.i. the search string
replaceString1 dword ?  ; the replace string
position       dword ?  ; This is the location of the old word to be replaced


.code
main PROC


            ; Give a message to user to enter in the long string
    mov edx, OFFSET prompt         ; This moves the location of my prompt to edx so WriteString can display it
	call WriteString               ; This displays the string edx points to
	call Crlf                      ; This is new line
	mov edx, OFFSET val1           ; Now edx point to a string full of Zeros
	mov ecx, SIZEOF val1           ; Now my counter is set to SIZEOF val1 this will be the max number of characters the user can input

	mov eax,0                      ; this sets eax to 0

	       ; Read string from user
	call ReadString                ; This will read a string from user and put it into the EAX

	       ; Copy users string to longString variable
	;mov edi, OFFSET longString     ; this moves the offset of longString into edi
	;STOSD                          ; This will move the contents of eax into the spot pointed to by edi

	cld                            ; This sets the direction to forward
	mov ecx, eax                   ; Set the REP counter to the users input string legth 
	mov esi, edx                   ; This offsets my source file eax to esi
	mov edi, OFFSET longString     ; This will copy the address of longString into edi so that it can copy over the string held by eax
	rep movsd                      ; movsd should copy my string from eax over to longString ++ rep == Repeat while ecx > 0

	mov eax,0                      ; this sets eax to 0

	        ; Ask user for a word to search for from the first string given
    mov edx, OFFSET prompt1        ; This moves the location of my prompt to edx so WriteString can display it
	call WriteString               ; This displays the string edx points to
	call Crlf                      ; This is new line
	mov edx, OFFSET val1           ; Now edx point to a string full of Zeros
	mov ecx, SIZEOF val1           ; Now my counter is set to SIZEOF val1 this will be the max number of characters the user can input

	mov eax,0                      ; this sets eax to 0

	retry:                         ; This is so the user can retry if word is not found
	call Crlf                      ; This is new line

	        ; Read search string from user
	call ReadString                ; This will read a string from user and put it into EAX

	        ; Copy users search string to searchString variable
	;mov edi, OFFSET searchString   ; this moves the offset of longString into edi
	;STOSD                          ; This will move the contents of eax into the spot pointed to by edi

	cld                            ; This sets the direction to forward
	mov ecx, eax                   ; Set the REP counter to the users input string legth 
	mov esi, edx                   ; This offsets my source file to esi
	mov edi, OFFSET searchString   ; This will copy the address of longString into edi so that it can copy over the string held by eax
	rep movsd                      ; movsd should copy my string from eax over to longString ++ rep == Repeat while ecx > 0

	        ; This searches for the short string within the long string and saves the position in edi
	mov edi, OFFSET longString     ; This sets edi to the address of longString which is the string that will be searched
                                   ; EAX should already contain the search word from the last ReadString
	mov ecx, LENGTHOF longString   ; This sets ecx counter to the length of the string
	cld                            ; Direction is going forward
	repne scasb                    ; Repeat while not equal ++ REPNE will keep scanning the string until it finds it or until ecx reaches 0
	jnz notFound                   ; Quit if if letter not found == Jump if Not Zero
	dec edi                        ; Back edi up one so it points to the correct spot

	mov position,edi               ; moves the number held by edi to position

	        ; Get replacement string
	mov edx, OFFSET prompt2        ; This moves the location of my prompt to edx so WriteString can display it
	call WriteString               ; This displays the string edx points to
	call Crlf                      ; This is new line
	mov edx, OFFSET val1           ; Now edx point to a string full of Zeros
	mov ecx, SIZEOF val1           ; Now my counter is set to SIZEOF val1 this will be the max number of characters the user can input

	mov eax,0                      ; this sets eax to 0


	        ; Read search string from user
	call ReadString                ; This will read a string from user and put it into EAX

	call Crlf                      ; This is new line

	mov edx, OFFSET oldstring      ; This moves the location of my prompt to edx so WriteString can display it
	call WriteString               ; This displays the string edx points to

	mov edx, OFFSET longString     ; This moves the location of my prompt to edx so WriteString can display it
	call WriteString               ; This displays the string edx points to

	call Crlf                      ; This is new line

	
	        ;replace a word the user searched for with the new word the user entered
	mov edi, OFFSET longString     ; this moves the offset of longString[edi] into edi
	add edi,position               ; This will set the string to the place that the new word needs to replace
	STOSD                          ; This will move the contents of eax into the spot pointed to by edi


	;mov longString[edi],eax        ; This is will replace a word the user searched for with the new word the user entered

	call Crlf                      ; This is new line

	mov edx, OFFSET newstring      ; This moves the location of my prompt to edx so WriteString can display it
	call WriteString               ; This displays the string edx points to

	mov edx, OFFSET longString     ; This moves the location of my prompt to edx so WriteString can display it
	call WriteString               ; This displays the string edx points to
	jmp Udone

	notFound:                      ; the string is not found
	mov edx, OFFSET notFound1       ; This moves the location of my prompt to edx so WriteString can display it
	call WriteString               ; This displays the string edx points to
	jmp retry

	Udone:

	exit
main ENDP
END main