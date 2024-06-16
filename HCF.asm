ORG 100H
.DATA
B DW 8
A DW 24
RESULT DW 0

.CODE

DIVISION MACRO W1,W2
    XOR DX,DX
    MOV AX,W1
    MOV BX,W2
    DIV BX
ENDM

MOV AH,1
INT 21H
MOV AH,0
MOV A,AX
MOV AH,1
INT 21H
MOV AH,0
MOV B,AX
XOR AX,AX
SUB A,30H
SUB B,30H

XOR BX,BX
MOV BX,B
CMP A,BX
JG MOV1
JMP MOV2

MOV1:
MOV RESULT,BX
JMP LOOP1

MOV2:
MOV BX,A
MOV RESULT,BX
JMP LOOP1

LOOP1:
DIVISION A,RESULT
 CMP DX,0
 JNE NOTHCF   
 DIVISION A,RESULT
 CMP DX,0
 JNE NOTHCF   
 RET
  
NOTHCF:
DEC RESULT
CMP RESULT,0
JNE LOOP1  

RET
