	.equ	T = 60
	.equ	K = 20			; tut- och pausl�ngd
	.equ	N = 1			; larml�ngd
	.equ	C = 60			; L�ngden mellan bokst�ver
	

	sbi		DDRB,4		; bit 4 �r utg�ng

START:
	call	LARM
STOP:
	jmp		STOP

LARM:
	ldi		r17,N	
LARM_1:
	call	LONG
	dec		r17
	brne	LARM_1
	ldi		r17,N

LARM_2:
	call	SHORT
	dec		r17
	brne	LARM_2	
	
CALL_I:
	call	DELAY_CHAR
	call	SHORT
	call	SHORT
	call	DELAY_CHAR
	
CALL_L:
	call	SHORT
	call	LONG
	call	SHORT
	call	SHORT
	call	DELAY_CHAR

CALL_B:
	call	LONG
	call	SHORT
	call	SHORT
	call	SHORT
	call	DELAY_CHAR

CALL_A:
	call	SHORT
	call	LONG
	call	DELAY_CHAR

	ret

LONG:
	sbi		PORTB,4
	call	DELAYT
	cbi		PORTB,4
	call	DELAYT	
	ret

SHORT:
	sbi		PORTB,4
	call	DELAYK
	cbi		PORTB,4
	call	DELAYK
	ret

DELAY_CHAR:
	ldi		r16,C

DELAY_CHAR1:
	adiw	r24,1
	brne	DELAY_CHAR1
	dec		r16
	brne	DELAY_CHAR1
	ret

DELAYT:
	ldi		r16,T

DELAYT_1:
	adiw	r24,1		; cirka 16 ms
	brne	DELAYT_1
	dec		r16
	brne	DELAYT_1
	ret

DELAYK:
	ldi		r16, K

DELAYT_2:
	adiw	r24,1		; cirka 16 ms
	brne	DELAYT_2
	dec		r16
	brne	DELAYT_2
	ret