TITLE ask2 ; MIXALIS KONSTANTINOS DIMOPOULOS 2020038
KODIKAS SEGMENT
	ASSUME CS:KODIKAS, DS:DEDOMENA
	ARXI
		MOV AX, DEDOMENA
		MOV DS, AX

		; counter
		MOV SI, 0
		xana:
		diavasma:
		
		; print message
		LEA DX, MINIMA
		MOV AH, 9
		INT 21h

		; read digit to AL
		MOV AH, 08h
		INT 21h
		
		; check number
		CMP AL, 48
		JB diavasma
		CMP AL, 57
		JA diavasma

		; print number
		MOV DL, AL
		MOV DH, 0
		MOV AH, 2
		INT 21h

		; check if 0
		SUB AL, 48
		CMP AL, 0
		JNE notzero

		; print 0
		LEA DX, MINIMA2
		MOV AH, 9
		INT 21h
		JMP next

		notzero:
		MOV DL, 2
		MOV AH, 0
		DIV DL

		CMP AH, 1
		JNE artio
		LEA DX, PERITTOS
		MOV AH, 9
		INT 21h
		JMP next

		artio:
		LEA DX, ARTIOS
		MOV AH, 9
		INT 21h

		next:

		INC SI
		CMP SI, 5
		JNE xana

		; end
		MOV AH, 4CH
		INT 21H

KODIKAS ENDS

DEDOMENA SEGMENT
	N2 db 5
	MINIMA db "Number: ", 10, 13, "$"
	MINIMA2 db "Einai 0", 10, 13, "$"
	ARTIOS db "Einai artios", 10, 13, "$"
	PERITTOS db "Einai perittos", 10, 13, "$"
DEDOMENA ENDS

END ARXI
