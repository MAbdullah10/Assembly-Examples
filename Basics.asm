MOV AX,1 
MOV CX,1
TOP:        
ADD AX,3  
ADD CX,AX
CMP AX,148  
JL TOP
EXIT:
    Ret

QUOTIENT DW 0
.code 
MOV AX,3
MOV BX,5  

CMP AX,BX 
JL EXIT     

TOP:
ADD QUOTIENT,1
SUB AX,BX
CMP AX,BX
JGE TOP    
MOV CX,QUOTIENT       

EXIT:
    Ret
