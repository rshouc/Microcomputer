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
	MOV CX,5      
	MOV AX,0 
	MOV BX,1      
NEXT:  
	ADD AX,BX
	INC BX           
	INC BX
	DEC CX
	JNE NEXT
	MOV SUM,AX
         
    HLT ;halt cpu       
ENDS

END START ;set entry point and stop the assembler.
