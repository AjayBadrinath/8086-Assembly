ASSUME CS:CODE ; DS:DATA ;Preparing the emulator to assume a memory location for each code segment and data segment
DATA SEGMENT;Data segment starts
MSG DB "HELLO WORLD $";Message "Hello World " stored in MSG as a data byte
DATA ENDS;End of data segment
CODE SEGMENT; ;Start Code segment Here we write the code to post the string in the monitor
START:
MOV AX, DATA;data segment memory address moved to reg ax
MOV DS,AX;data in ax moved to data seg
LEA DX,MSG;Load Effective address of 1st char in MSG to Register DX
MOV AH,09H;Service 09h Offers print string 
INT 21H;Interrupt /Call processor
MOV AH,4CH;Halt proceess sent to higher bit accumulator register ax
INT 21H;Interrupt process
CODE ENDS;End of code segment
END START;End of code


