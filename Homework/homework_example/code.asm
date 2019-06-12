A_PORT EQU 0000H
B_PORT EQU 0002H
C_PORT EQU 0004H
CRTL_8255 EQU 0006H

ICW1 EQU 0400H
ICW2 EQU 0402H
ICW4 EQU 0402H
OCW2 EQU 0400H


T0   EQU 0200H
T1   EQU 0202H
T2   EQU 0204H
CRTL_8253 EQU 0206H

DATA SEGMENT 
    LEDTAB  DB 3FH,06H,5BH,4FH,66H,6DH,7DH,07H,7FH,6FH  ;段码表
DATA ENDS

STACK   SEGMENT STACK
    ST DB 10 DUP(0)
STACK   ENDS

CODE SEGMENT 
   ASSUME CS:CODE,DS:DATA ,SS:STACK

START: MOV AX,DATA
		MOV DS,AX
		
		;8255初始化  
		MOV AL,80H
		MOV DX,CRTL_8255
		OUT DX,AL 
       
      
		MOV AL, 01H	; LED0灯亮(高电平灯亮)
		MOV BL,AL 
		MOV DX, B_PORT
		OUT DX, AL         ;PB0灯亮
		
		;8253初始化
		MOV AL,00100111B
		MOV DX, CRTL_8253
		OUT DX, AL
		
		MOV AL,10H
		MOV DX, T0
		OUT DX, AL
		
	    MOV AL,01100111B
		MOV DX, CRTL_8253
		OUT DX, AL
		
		MOV AL,10H
		MOV DX, T1
		OUT DX, AL

		
		;8259初始化
		MOV AL, 13H; 00010011B，ICW1：边沿触发，单片，要ICW4
		MOV DX, ICW1 ; 8259地址
		OUT DX, AL
		
		
		MOV AL, 40H  ;    ICW2中断类型号为40
		MOV DX, ICW2		
		OUT DX, AL
		MOV AL, 01H  ;   ICW4不用缓冲方式，正常中断结束，非特殊的全嵌套方式
		MOV DX, ICW4		
		OUT DX, AL
        
        ;中断向量表初始化
		MOV AX, 0 
		MOV DS, AX           ; 数据段清零        
		
		MOV DI,0
		MOV CX,256
INITINTR:
		LEA AX,INT0   ; 写8259中断程序的入口地址
		MOV DS:[DI],AX  ; 把中断服务程序的入口地址偏移量送中断向量表
		MOV AX, SEG INT0
		MOV DS:[DI+2], AX ; 把中断服务程序的入口地址段地址送中断向量表
        ADD DI,4
        
        LOOP INITINTR

		STI                       ;开中断
    
        MOV AX,SEG LEDTAB
        MOV DS,AX
        MOV AX, 0
        MOV CX,0

LEDDISP:
        MOV AL,1110B       ;输出位码
        MOV DX,C_PORT
        OUT DX,AL
               
        MOV AL,LEDTAB[1]
        MOV DX,A_PORT       ;输出段码
        OUT DX,AL

        CALL DELAY
        
        MOV AL,0H
        MOV DX,A_PORT     ;清屏
        OUT DX,AL
  
        
        MOV AL,1101B        ;输出位码
        MOV DX,C_PORT
        OUT DX,AL
        
        MOV AL,LEDTAB[2]
        MOV DX,A_PORT       ;输出段码
        OUT DX,AL

        CALL DELAY
        MOV AL,0H
        MOV DX,A_PORT     ;清屏
        OUT DX,AL
        
        
        MOV AL,1011B        ;输出位码
        MOV DX,C_PORT
        OUT DX,AL

        MOV AL,LEDTAB[3]
        MOV DX,A_PORT       ;输出段码
        OUT DX,AL

        CALL DELAY
        MOV AL,0H
        MOV DX,A_PORT     ;清屏
        OUT DX,AL
        
        
        MOV AL,0111B        ;输出位码
        MOV DX,C_PORT
        OUT DX,AL
     
        MOV AL,LEDTAB[4]
        MOV DX,A_PORT       ;输出段码
        OUT DX,AL

        CALL DELAY
        MOV AL,0H
        MOV DX,A_PORT     ;清屏
        OUT DX,AL
        
        
        JMP LEDDISP

       
DELAY   PROC     ;延时子程序
        PUSH CX
        MOV CX,0FH    
    D1: LOOP D1
        POP CX
        RET        
DELAY   ENDP


INT0  PROC     ;8259中断服务程序   
      ;STI
      ROL BL,1        ;左循环1次
      MOV AL,BL
      MOV DX,B_PORT   
      OUT DX,AL      ; PA口灯亮
          
      MOV DX,OCW2 
      MOV AL,20H     ; OCW2发结束命令EOI=1
      OUT DX,AL
      INC CX
      IRET
          
INT0 ENDP
    
CODE ENDS
END START
   





