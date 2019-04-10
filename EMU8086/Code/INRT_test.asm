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
	MOV AX,0
	MOV ES,AX
	
	MOV AX,OFFSET CHANGE 
	MOV WORD PTR ES:[40H*4],AX 
	MOV AX,SEG CHANGE
	MOV WORD PTR ES:[40H*4+2],AX 
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
    
    INT 40H
    	
	MOV SUM,AX
         
    HLT ;halt cpu
    
CHANGE PROC NEAR    
    PUSH AX

    
    MOV AX,1234
    MOV SUM,AX
    
    POP AX    
    IRET
CHANGE ENDP

ENDS

END START ;set entry point and stop the assembler.
