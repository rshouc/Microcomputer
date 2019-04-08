; calcute the answer of 16bit multiple 16bit figure.
;-----------------------------------
;define the global label
DATA SEGMENT
    ;define variables!
	TAB DB 5,4,3,2,1
ENDS

STACK SEGMENT
  ST DB 100H DUP(0)
ENDS

CODE SEGMENT
    ASSUME CS:CODE,DS:DATA,SS:STACK
START:
	; set segment registers:
    MOV AX, DATA
    MOV DS, AX
	
    ; CODE begin here
	MOV CX,5-1
	
loop1:
	PUSH CX
	MOV  BX,0
loop2:	
	MOV AL,TAB[BX]	
	CMP AL,TAB[BX+1];	
	JL continue
	XCHG AL,TAB[BX+1]
	MOV TAB[BX],AL

continue:
	ADD BX,1;
	LOOP loop2
	POP CX
	LOOP loop1

    HLT ;halt cpu     
ENDS

END START ;set entry point and stop the assembler.
