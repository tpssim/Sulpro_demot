;Create subroutines if_greater, if_lesser and if_equal
;If foo is lesser than bar call if_lesser
;If foo is greater than bar call if_greater
;If foo is equal to bar call if_equal
    
    #include P18F452.inc
    
    #define foo 0x0B
    #define bar 0x0C
    
;;;;	Vectors	    ;;;;
    
    org 0x0000		    ;Reset vector
    goto Init
    
;;;;	Mainline program    ;;;;

Init:
    
    movlw D'1'
    movwf foo
    movlw D'2'
    movwf bar
    
Mainloop:
    
    movf foo, 0, 0
    
    cpfsgt bar		    ;if foo is lesser than bar
    bra $+4
    call if_lesser
    
    cpfslt bar		    ;if foo is greater than bar
    bra $+4
    call if_greater
    
    cpfseq bar		    ;if foo is equal to bar
    bra $+4
    call if_equal
    
    goto Mainloop
    
if_greater:
    return
    
if_lesser:
    return
    
if_equal:
    return
    
    end