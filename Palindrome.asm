ASSUME CS:CODE,DS:DATA

DATA SEGMENT

STR1 DB "RACECAR$"
LEN EQU $-STR1
PAL  DB  "PALINDROME$"
NOPAL DB  "NOTPALINDROME$"

DATA ENDS

CODE SEGMENT

START:

MOV AX,DATA
MOV DS,AX

MOV SI,OFFSET STR1
MOV DI,SI
MOV AX,LEN
SUB AX,2
MOV CX,LEN

DIL:
        INC DI
LOOP DIL

CALL PALIN


INCR:
        INC SI
        DEC DI
        CALL PALIN


EXIT1:
        LEA DX,PAL
        MOV AH,09H
        INT 21H
        MOV AH,4CH
        INT 21H



EXIT:
        LEA DX,NOPAL
      
        MOV AH,09H
        INT 21H
        MOV AH,4CH
        INT 21H
MOV AH,4CH
INT 21H

PALIN:
        XOR AX,AX
        XOR BX,BX
        
        MOV AX,[SI]
        MOV BX,[DI]
        CMP AL,BL
        JNE EXIT
        
        CMP SI,DI
        JG EXIT1
        
        JMP INCR
        RET



CODE ENDS
END START
