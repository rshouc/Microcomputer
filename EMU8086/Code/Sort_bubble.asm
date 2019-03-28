; calcute the answer of 16bit multiple 16bit figure.
;-----------------------------------
;define the global label
DATA SEGMENT
    ;define variables!
	TAB dw 19,15,13,14,18,62,14,42,35,68
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
	MOV CX,10-1
	
loop1:
	PUSH CX
	MOV  BX,0
loop2:	
	MOV AX,TAB[BX]	
	CMP AX,TAB[BX+2];
	
	JLE continue
	XCHG AX,TAB[BX+2]
	MOV TAB[BX],AX

continue:
	ADD BX,2;
	LOOP loop2
	POP CX
	LOOP loop1

    HLT ;halt cpu     
ENDS

END START ;set entry point and stop the assembler.
