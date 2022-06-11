Θέμα 1:
TITLE ASK1
ASSUME CS:KODIKAS,DS:DATA
KODIKAS SEGMENT                                      
    
    MAIN PROC NEAR
        MOV AX,DATA
     	MOV DS,AX
        
        ; print message
        LEA DX, DWSE_MES
        MOV AH, 09h
        INT 21h
        
        ; start 40 char input loop
        MOV CX, 40
        MOV BX, 0
        seg:
            MOV AH, 01h
            INT 21h
            
            MOV Pinakas[BX], AL
            
            CMP AL, '@'
            JE break  
            
            INC BX
            LOOP seg

        break:
        ; print message
        LEA DX, SEARCH_MES
        MOV AH, 09h
        INT 21h
        
        MOV AH, 01h
        INT 21h
        
        MOV BH, AL ; pername ton char me ton BH
        CALL ALLAGI_CHAR


        MOV AH,4CH
        INT 21H
    MAIN ENDP



    ALLAGI_CHAR PROC NEAR
        MOV CX, 40
        seg1:
            MOV BX, CX
            CMP Pinakas[BX], BH
            JE exists 
            LOOP seg1
        
        ; doesn't exit    
        ; print message
        LEA DX, DEN_YPARXEI_MES
        MOV AH, 09h
        INT 21h
        
        RET        
        
        exists:
        ; print message
        LEA DX, YPARXEI_MES
        MOV AH, 09h
        INT 21h
        
        ; input char
        MOV AH, 01h
        INT 21h
        
        MOV AH, 0 ; turn AX to AL
        
        seg2:
            MOV BX, CX
            CMP Pinakas[BX], AL
            JNE replace
            
            JMP skip
            replace:
                MOV Pinakas[BX], AL
                
            skip:
            LOOP seg2
         
         ;print Pinakas
         MOV CX, 40
         seg3:
            MOV BX, CX
            MOV DL, Pinakas[BX]
            INT 21h
            
            LOOP seg3

         
         RET
    
    ALLAGI_CHAR ENDP


KODIKAS ENDS

DATA SEGMENT 
    N DB 6
    DWSE_MES DB "Dwse keimeno: ",10,13,"$"
    SEARCH_MES DB 10,13,"Dwse poion xaraktira thes na anazitiseis: ",10,13,"$"
    YPARXEI_MES DB 10,13,"Yparxei! Replace with:",10,13,"$"
    DEN_YPARXEI_MES DB 10,13,"DEN Yparxei!",10,13,"$"
    
    Pinakas DB 40 dup(0)      
DATA ENDS 

END MAIN
