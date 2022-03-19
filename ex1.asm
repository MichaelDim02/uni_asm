TITLE EX1

; this program calculates N^2-2*N+1
; for 0<=N<10 and N is an integer

KODIKAS SEGMENT
	ASSUME CS:KODIKAS, DS:DEDOMENA
	ARXI:
		mov AX, DEDOMENA
		mov DS, AX

		lea DX, message ; print message
		mov AH, 9
		int 21H

		mov AL, N
		mul AL
		mov BX, AX

		mov AL, N
		mov DL, 2
		mul DL
		mov CX, AX

		sub BX, CX
		inc BX

		; print ;
		mov AX, BX
		mov DL, 10
		div DL

		mov DL, AL
		add DL, 48
		mov BH, AH
		mov AH, 2
		int 21H
	
		mov DL, BH
		add DL, 48
		mov AH, 2
		int 21H

		mov AH, 4CH
		int 21H
KODIKAS ENDS

DEDOMENA SEGMENT
	N db 8
	message db "Result: $"
DEDOMENA ENDS

	END ARXI
