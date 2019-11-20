;counter is inrementing counter initialized as 0.
;Increment the counter and copy bits <2:0> from counter
;to PORTB bits <5:3>. 
;Repeat until counter == COUNTER_END
    
    #include P18F452.inc
    
    #define counter 0x0A
    
    COUNTER_END equ D'5'

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
    ;Init counter as 0
    clrf counter
    
Mainloop:
    
    nop
    
loop: 
    ;increment counter
    incf counter
    
    ;Rotate counter left 3 times store result to WREQ and rotate counter back
    rlncf counter
    rlncf counter
    rlncf counter, 0	    ;this does not affect the value in counter
    rrncf counter
    rrncf counter
    
    ;Set PORTB bits <5:3> with WREG bits <5:3>
    andlw B'00111000'
    iorwf LATB
    iorlw B'11000111'
    andwf LATB
    
    ;Loop condition check
    movlw COUNTER_END
    cpfseq counter
    goto loop
    
    goto Mainloop
    
    end

