;Count set bits in a given byte
    
    #include P18F452.inc
    
    #define test 0x0A

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
    ;Set the target register
    movwl B'00111010', test
    
Mainloop:
    
    movf test, 0
    
    call count_set
    
    goto Mainloop
    
    
;Count set bits in a byte loded in WREG
;Put result in WREG
;Changes value of 0x1A as a side effect
count_set:
    
loop:
    
    ;Move WREG to 0x1A and zero WREG
    movwf 0x1A, 0
    movlw D'0'
    
    ;Check bits of 0x1A and increment WREG for every set bit
    btfsc 0x1A, D'0'
    addlw D'1'
    btfsc 0x1A, D'1'
    addlw D'1'
    btfsc 0x1A, D'2'
    addlw D'1'
    btfsc 0x1A, D'3'
    addlw D'1'
    btfsc 0x1A, D'4'
    addlw D'1'
    btfsc 0x1A, D'5'
    addlw D'1'
    btfsc 0x1A, D'6'
    addlw D'1'
    btfsc 0x1A, D'7'
    addlw D'1'
    
    return
    
    end

