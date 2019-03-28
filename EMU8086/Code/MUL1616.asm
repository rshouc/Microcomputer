; calcute the answer of 16bit multiple 16bit figure.
;-----------------------------------
;define the global label
DATA SEGMENT
    ;define variables!
    M1 DW 00FFH
    M2 DW 00FFH
    P1 DW ?
    P2 DW ?
ENDS

STACK SEGMENT
  ST DB 100 DUP(0)
ENDS

CODE SEGMENT
    ASSUME CS:CODE,DS:DATA,SS:STACK
START:
	; set segment registers:
    mov AX, DATA
    mov DS, AX
 

    ; CODE begin here
    MOV BX,OFFSET M1
    MOV AX,[BX]
    MOV DX,0
    MOV BX,OFFSET M2
    MUL [BX]
    MOV BX,OFFSET P1
    MOV [BX],AX
    MOV BX,OFFSET P2
    MOV [BX],DX
     
     
    HLT ;halt cpu     
ENDS

END START ;set entry point and stop the assembler.
