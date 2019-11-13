;Define variable named counter
;Increment counter and when it reaches to 10 set it to 1
    
    #include P18F452.inc
    
    #define counter 0x0B

;;;;	Vectors	    ;;;;
    
    org 0x0000		    ;Reset vector
    nop
    goto Init

;;;;	Mainline program    ;;;;

Init:
    ;Init counter to 0
    movlw D'0'
    movwf counter
    
Mainloop:
    
    incf counter
    movlw D'10'
    cpfseq counter	    ;If counter != 10 goto next iteration
    goto Mainloop
    
    movlw D'1'		    ;If counter == 10 set counter to 1 and 
    movwf counter	    ;go to next iteration
    goto Mainloop
    
    end
