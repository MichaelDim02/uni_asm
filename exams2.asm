TITLE EX1
KODIKAS SEGMENT
    ASSUME CS:KODIKAS, DS:DEDOMENA
    ARXI:
        mov AX, DEDOMENA
        mov DS, AX
        
        lea DX, MES1
        mov AH, 09h
        int 21h

        
        mov BX, 0
        mov CX, 40
        t1:
            mov AH, 01h
            int 21h
            
            cmp AL, 'A'
            jl skip1
            
            cmp AL, 'Z'
            jg skip2
            
            mov pin[BX], AL
            
            skip1:
                cmp AL, ' '
                jne skip2
            
                mov pin[BX], AL
            skip2:
                cmp AL, '@'
                je break
            
            inc BX
            loop t1
        break:
        
        ; grapse error - 0 bytes 
        cmp BX, 0
        jne skip3
        
        lea DX, MES2
        mov AH, 09h
        int 21h
        
        ; exit
        mov AH, 4CH
        int 21H
        
        skip3:
        
        lea DX, NEWL
        mov AH, 09h
        int 21h
                
        mov CX, BX
        mov BX, 0
        t2:
            mov DL, pin[BX]
            
            cmp DL, ' '
            jne skip4
            
            mov DL, 10
            mov AH, 02h
            int 21h
            mov DL, 13
            
            skip4:
            mov AH, 02h
            int 21h
            
            inc BX
            
            loop t2
            
        
        mov AH, 4CH
        int 21H
KODIKAS ENDS

DEDOMENA SEGMENT
    MES1 DB "Dose keimeno: ",10,13,"$"
    MES2 DB 10,13,"Den edoses keimeno. ",10,13,"$"
    NEWL DB 10,13,"$"
    pin DB 40 dup(0)
DEDOMENA ENDS

    END ARXI
