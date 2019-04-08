; calcute the sum of N odd figures.
;-----------------------------------
;define the global label
N EQU 5

; add your DATA here!
DATA SEGMENT
    ;define variables
	SUM DW 0
ENDS

STACK SEGMENT
	ST DB 100 DUP(0)
ENDS

CODE SEGMENT
    ASSUME CS:CODE,DS:DATA,SS:STACK
START:
	;SET DATA SEGMENT reg
    MOV AX, DATA
    MOV DS, AX
	
    ; CODE begin here
	;initiate      
NEXT:  
	IN AX,125
	OUT 199,AX
	CMP AX,100
	JZ  OFF
	JL  ON
	
ON:	MOV AX,1
    OUT 127,AX	
	JMP NEXT
OFF:MOV AX,0
    OUT 127,AX
    MOV CX,100
LOOP1:
    NOP
    LOOP LOOP1 
	JMP NEXT	
	

         
    HLT ;halt cpu       
ENDS

END START ;set entry point and stop the assembler.
