;Reverse bits of a register ie. 0011 1010 -> 0101 1100
;Just a proof that it can be done without using other registers
    
    #include P18F452.inc
    
    #define target 0x0A

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
    movwl B'00111010', target
    
Mainloop:
  
    btfsc target, D'7'
    bra $+D'12'
    btfss target, D'0'
    bra $+D'8'
    btg target, D'7'
    btg target, D'0'
    bra $+D'14'
    btfss target, D'7'
    bra $+D'10'
    btfsc target, D'0'
    bra $+D'8'
    btg target, D'7'
    btg target, D'0'
    
    btfsc target, D'6'
    bra $+D'12'
    btfss target, D'1'
    bra $+D'8'
    btg target, D'6'
    btg target, D'1'
    bra $+D'14'
    btfss target, D'6'
    bra $+D'10'
    btfsc target, D'1'
    bra $+D'8'
    btg target, D'6'
    btg target, D'1'
    
    btfsc target, D'5'
    bra $+D'12'
    btfss target, D'2'
    bra $+D'8'
    btg target, D'5'
    btg target, D'2'
    bra $+D'14'
    btfss target, D'5'
    bra $+D'10'
    btfsc target, D'2'
    bra $+D'8'
    btg target, D'5'
    btg target, D'2'
    
    btfsc target, D'4'
    bra $+D'12'
    btfss target, D'3'
    bra $+D'8'
    btg target, D'4'
    btg target, D'3'
    bra $+D'14'
    btfss target, D'4'
    bra $+D'10'
    btfsc target, D'3'
    bra $+D'8'
    btg target, D'4'
    btg target, D'3'
    
    goto Mainloop
    
    end