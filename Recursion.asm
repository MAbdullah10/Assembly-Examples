RECURSION

org 100h
.data
N DW 0
N1 DW 0
RESULT DW 0

.CODE
MAIN PROC
    MOV AX,3
    PUSH AX
    CALL FACTORIAL
    RET 
ENDP

FACTORIAL PROC
    MOV BP,SP
    MOV AX,[BP+2]
    MOV N,AX
    CMP N,1
    JNE AGAIN
    MOV N,1
    MOV RESULT,1
    JMP EXIT
    
    AGAIN:
    DEC N
    PUSH N
    CALL FACTORIAL
    MOV BP,SP
    MOV AX,[BP+2]
    MUL RESULT
    MOV RESULT,AX
    
    EXIT:
    RET 2
    
    FACTORIAL ENDP

RECURSION 2:
org 100h
.data
WORD1 DW 9
WORD2 DW 5

.CODE
MAIN PROC
    PUSH WORD1
    PUSH WORD2
    CALL SUM 
    RET 
ENDP            

SUM PROC     
    PUSH BP
    MOV BP,SP
    MOV AX,[BP+6]
    ADD AX,[BP+4] 
    POP BP    
    
    EXIT:
    RET 4
    
    SUM ENDP
TEXT DISPLAY:
org 100h
.data
.code
MOV AX,0XB800
MOV ES,AX
MOV SI,0

MOV AH,0X42 
MOV AL,'A'

AGAIN:
MOV ES:SI,AX
ADD SI,2
CMP SI,160
JL AGAIN   

RET





org 100h
.data
N dw ?
F1 dw 0
F2 dw 0
Result dw 0

.code  

MOV AX,5
PUSH AX 

CALL RECURSION

ret  

RECURSION PROC 
    
    MOV BP,SP
    MOV AX,[BP+2]
    MOV N,AX
    
    CMP N,1
    JE RE2
    CMP N,0
    JLE RE1 
    JMP REST
    
    RE1: 
    MOV F1,0      
    JMP EXIT
    
    RE2:     
    MOV F2,1
    JMP EXIT 
    
    REST:
    DEC N
    PUSH N  
    CALL RECURSION
                
        
    MOV BP,SP
    MOV AX,[BP+2]
    MOV N,AX
    
    SUB N,2
    PUSH N
    CALL RECURSION 
                  
    MOV DX,F1
    ADD DX,F2
    ADD Result,DX 
    
    MOV F1,0
    MOV F2,0

    
    EXIT:
    RET 2  
