ORG 100H
.DATA
MATRIX1 DB 7,2
        DB 0,3
MATRIX2 DB 4
        DB 1
RESULT  DW ?
        DW ?               
.CODE  
MULT MACRO M1,M2
    MOV CX,2   
    
    LOOP1:
    MOV AL,[M1+SI]
    MULT [M2]
    MOV BX,AX
    MOV AL,[M1+SI+1]
    MULT [M2+1]
    ADD AX,BX
    
    MOV [RESULT+DI],AX
    ADD DI,2
    ADD SI,2
    LOOP LOOP1       
    
RET
ENDM

MOV SI,0
MOV DI,0
MULT MATRIX1,MATRIX2

RET
