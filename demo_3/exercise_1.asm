;Blink the led in port RA3 with 100ms intervals(100ms on, 100ms off)
;Use a loop to create the delay
;Clockspeed is 10MHz
    
    #include P18F452.inc
    
    #define counter1 0x0A
    #define counter2 0x1A

;;;;	Vectors	    ;;;;
    
    org 0x0000		    ;Reset vector
    goto Init
	
;;;;	Mainline program    ;;;;

Init:
    ;Set all I/O to digital mode
    ;ADCON1<3:0> == '011x'
    movlw B'00000110'
    iorwf ADCON1
    movlw B'11110111'
    andwf ADCON1
    
    ;Clear data latches
    clrf LATA
    
    ;Set RA3 as output
    bsf TRISA, D'3'
    
Mainloop:
    
    rcall Delay100ms
    btg LATA, D'3'
    
    goto Mainloop
    
    end

;;;;	Delay subroutine    ;;;;
    
Delay100ms:	movlw	D'250'	    ; 100 ms
		movwf	counter2
outerloop:	;250*(inner+3)    
innerloop:	;256*4*0.4 us	= 409.6 us	
		nop			    ;1
		decfsz	counter1,f,A	    ;1
		bra	innerloop	    ;2
		decfsz	counter2,f,A	    ;1
		bra	outerloop	    ;2
		return