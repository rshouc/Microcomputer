; calcute the sum of N odd figures.
;-----------------------------------
;define the global label
; add your DATA here!
DATA SEGMENT
    ;define variables
    MEM1 DW 100 DUP(1)
    MEM2 DW 100 DUP(2)
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
	MOV DI,1000H      
	MOV CX,100
	MOV AL,0      
NEXT:  
	MOV [DI],AL
	INC DI
	INC AL           
	DEC CX
	JNE NEXT         
    HLT ;halt cpu       
ENDS

END START ;set entry point and stop the assembler.
