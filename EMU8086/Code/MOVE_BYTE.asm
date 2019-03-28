; calcute the sum of N odd figures.
;-----------------------------------
;define the global label
; add your DATA here!
DATA SEGMENT
    ;define variables
    MEM1 DB 5 DUP(0FFH)
    MEM2 DB 5 DUP(0)
DATA ENDS

STACK SEGMENT
	ST DB 100 DUP(0)
STACK ENDS

CODE SEGMENT
    ASSUME CS:CODE,DS:DATA,SS:STACK
START:
	;SET DATA SEGMENT reg
    MOV AX, DATA
    MOV DS, AX
    ; CODE begin here
	
	;initiate
	LEA SI,MEM1
	LEA DI,MEM2       
	MOV CX,5
	MOV AX,0     
NEXT:  
    MOV AL,[SI]
	MOV [DI],AL
	INC DI           
	INC SI
	DEC CX
	JNE NEXT         
    HLT ;halt cpu       
CODE ENDS

END START ;set entry point and stop the assembler.
