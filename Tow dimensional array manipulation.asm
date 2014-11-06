TITLE EX13_03 

INCLUDE Irvine32.inc
.data

table  Dword 1h,2h,3h,4h,5h,6h ; even numbered == rows && odd numbered == columns
columns = 2                        ; this will be multiplide by type and added to row number to come up with the right position
rows = 1                      ; this will be multiplide by type and added to row number to come up with the right position
change = 0
change1 = 1                   ; these will be the row/column number I am changing
change2 = 2
pow dword 'A'                 ; This is what I will change my rows into
bam dword 'b'                 ; This is what I will chang my columns into


.code
main PROC


	
       	 ; this is where I chang columns
	mov table[change * columns] ,bam                 ; Because the zero position of the array starts at zero for both row and columns I do not include TYPE table
	mov table[change1 * columns + TYPE table] ,bam   ; This will move bam into the second column of my table
	mov table[change2 * columns + TYPE table] ,bam   ; This will move bam into the third column of my table

	      ; this is where I chang rows
	mov table[change * row]  ,pow                 ; Because the zero position of the array starts at zero for both row and columns I do not include TYPE table
	mov table[change1 * row + TYPE table]  ,pow   ; This will move bam into the second column of my table
	mov table[change2 * row + TYPE table]  ,pow   ; This will move bam into the third column of my table





	exit
main ENDP
END main