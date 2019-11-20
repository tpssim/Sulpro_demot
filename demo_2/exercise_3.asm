;PORTB has 8 leds connected to it and there is a button connected to RA1.
;Leds should show how many times button has been pressed(in binary)
    
    #include P18F452.inc
    
    #define counter 0x0A

;;;;	Vectors	    ;;;;
    
    org 0x0000		    ;Reset vector
    goto Init

;;;;	Macro	    ;;;;
    
movwl	macro  literal,dest
        movlw  literal
        movwf  dest
        endm
	
;;;;	Mainline program    ;;;;

Init:
    ;Set output ports
    movlw H'00'
    andwf TRISB
    ;Clear output
    clrf LATB
    ;Clear input
    clrf LATA
    
Mainloop:

    ;Wait for button press
    btfss LATA, D'1'
    bra $-D'2'
    ;Wait for button release
    btfsc LATA, D'1'
    bra $-D'2'
    
    ;Increment output
    incf LATB
    
    goto Mainloop
    
    end

