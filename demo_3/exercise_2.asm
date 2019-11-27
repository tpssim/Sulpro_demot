;Blink the led in port RA3 with 100ms intervals(100ms on, 100ms off)
;Use interrupts to create the delay
;Clockspeed is 10MHz
;With 1:8 prescaler TMR1 goes from 0 to 31250 in 100ms
    
    #include P18F452.inc

    #define ledpin 3
    
;;;;	Vectors	    ;;;;
    
    org 0x0000		    ;Reset vector
    goto Init
    org 0x0008
    goto Intrhpr	    ;High priority interrupt vector
    
;;;;	Macro	    ;;;;
    
movwl	macro  literal,dest
        movlw  literal
        movwf  dest
        endm
    
;;;;	Interrupts  ;;;;
    
Intrhpr:
    ;Reset the counter
    movwl TMR1H, D'0'
    movwl TMR1L, D'0'
    ;Toggle the led
    btg LATA, ledpin
	
;;;;	Mainline program    ;;;;

Init:
    ;Set CCP1 module to compare mode generate software interrupt on match
    ;CCP1CON<3:0> == '1010'
    movlw B'00001010'
    iorwf CCP1CON
    movlw B'11111010'
    andwf CCP1CON
    
    ;Set the compare value to D'31250' = B'0111 1010 0001 0010'
    movwl CCPR1L, B'00010010'
    movwl CCPR1H, B'01111010'
    
    ;Enable Timer1, use 1:8 prescaler, shut-off Timer1 oscillator,
    ;use internal clock, enable 16-bit read/write
    movwl T1CON, B'10110101'
    
    ;Enable CCP1 interrupts.
    bsf PIE1, D'2'
    ;Set the priority to high
    bsf IPR1, D'2'
    ;Enable interrupt priority levels
    bsf RCON, D'7'
    
    
Mainloop:
    
    nop
    clrwdt
    
    goto Mainloop
    
    end
