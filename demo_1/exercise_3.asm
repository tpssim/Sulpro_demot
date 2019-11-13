;Define variables counter, sum and data
;Create a loop which decrements counter by 1 in every iteration
;and adds data to sum
;Exit the loop when counter reaches zero
    
    #include P18F452.inc
    
    #define counter 0x0B
    #define sum 0x0C
    #define data_ 0x0D	    ;data seems to be reserved name thus the underscore
    
;;;;	Vectors	    ;;;;
    
    org 0x0000		    ;Reset vector
    nop
    goto Init

;;;;	Mainline program    ;;;;

Init:
    ;Init values for testing
    movlw D'4'
    movwf counter
    movlw D'0'
    movwf sum
    movlw D'2'
    movwf data_
    
Mainloop:
    
Loop:
    
    movf data_, 0, 0	    ;Add data to sum
    addwf sum
    
    decfsz counter	    ;decrement counter and check if zero
    goto Loop
    
    nop
    
    goto Mainloop

    end