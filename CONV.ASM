ASSUME CS:CODE,DS:DATA
DATA SEGMENT
VAR DB 98H
DATA ENDS
CODE SEGMENT
START:
MOV AX,DATA
MOV DS,AX
MOV CX,2H

MOV DL,VAR
LP1:
        MOV AL,DL
        MOV BL,10H
        ;MOV AL,DL
        DIV BL
        MOV BL,AL
        PUSH AX
        ;MOV DL,AH
        ;ADD DL,30H
        ;MOV AH,02H
        ;INT 21H
        MOV DL,BL
        
        
LOOP LP1
MOV CX,04H
PRNT:   XOR AX,AX
        POP AX
        MOV DL,AH
        ADD DL,30H
        MOV AH,02H
        INT 21H
LOOP PRNT
MOV AH,4CH
INT 21H
CODE ENDS
END START
