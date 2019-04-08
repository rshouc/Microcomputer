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
    MOV CX,3
    
   
     
FACTOR PROC NEAR    
    CMP CX,1
    JE DONE        
    PUSH CX
    DEC CX
    CALL FACTOR    
L2: POP CX
    MUL CX    
    RET
    
DONE:MOV AX,1    
     JMP L2
     
FACTOR ENDP


    MOV SUM,AX
    HLT ;halt cpu       
ENDS

END START ;set entry point and stop the assembler.




