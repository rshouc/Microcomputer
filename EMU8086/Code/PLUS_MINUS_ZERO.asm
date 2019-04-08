; calcute the sum of N odd figures.
;-----------------------------------
;define the global label
N EQU 5

; add your DATA here!
DATA SEGMENT
    ;define variables
	
	TABLE DB -2,-1,0,0,0,1,2,3,4
	PLUS  DB 0
	ZERO  DB 0
	MINUS DB 0	
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
	MOV CX,9
	MOV SI,0            
NEXT:  
	CMP TABLE[SI],0
	JL P1
	JZ P2
	JG P3
 
P1:INC MINUS
   INC SI
   DEC CX
    JNZ NEXT	
    JMP END
	   
P2:INC ZERO
	INC SI
   	DEC CX
	JNZ NEXT	
	JMP END
   
P3:INC PLUS
	INC SI
   	DEC CX
	JNZ NEXT	
	JMP END  

END:HLT ;halt cpu

           
ENDS

END START ;set entry point and stop the assembler.
