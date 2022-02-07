ASSUME CS:CODE,DS:DATA

DATA SEGMENT
STR1 DB "RACECAR$"
;LEN EQU $-STR1
PAL  DB  "PALINDROME$"
NOPAL DB  "NOTPALINDROME$"
;LEN EQU $-STR1
DATA ENDS

CODE SEGMENT

START:

MOV AX,DATA
MOV DS,AX
MOV SI,OFFSET STR1
MOV DI,SI
;MOV AX,LEN
;SUB AX,2
MOV CX,6

DIL:
        INC DI
LOOP DIL

CALL PALIN

;MOV DX,[DI]
;MOV AH,02H
;INT 21H
;MOV DX,[SI]
;MOV AH,02H
;INT 21H

;CALL PALIN


INCR:
         INC SI
        DEC DI
       ; CMP SI,DI
        ;JG  EXIT1
        CALL PALIN
EXIT1:
        LEA DX,PAL
       ; MOV BX,DX
        MOV AH,09H
        INT 21H
        MOV AH,4CH
        INT 21H



EXIT:
        LEA DX,NOPAL
       ; MOV BX,DX
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
        ;SUB AX,30H
        MOV BX,[DI]
        ;SUB BX,30H
        CMP AL,BL
        JNE EXIT
        CMP SI,DI
        JG EXIT1
        JMP INCR
        RET



CODE ENDS
END START
