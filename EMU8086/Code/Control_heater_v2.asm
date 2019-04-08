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
ON: IN AX,125
	OUT 199,AX
	CMP AX,100
	JG  OFF	
	MOV AX,1
    OUT 127,AX	
	JMP ON
	
OFF:MOV AX,0
    OUT 127,AX
    
    IN AX,125
	OUT 199,AX	
	CMP AX,90
    JG OFF
    JMP ON

         
    HLT ;halt cpu       
ENDS

END START ;set entry point and stop the assembler.
