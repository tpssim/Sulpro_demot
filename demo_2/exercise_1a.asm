;Reverse bits of a register ie. 0011 1010 -> 0101 1100
;Just a proof that this can be done without using any other registers
;Best case scenario(no bit toggles needed) this takes 20 duty cycles
;Worst case scenario(all bits have to be toggled) this takes 32 duty cycles
    
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
    
    ;Check first and last bit and toggle them if they have different states
    btfsc target, D'7'
    bra $+D'8'		    ;skip 3 instructions
    btfss target, D'0'
    bra $+D'12'		    ;skip 5 instructions
    bra $+D'6'		    ;skip 2 instructions
    btfsc target, D'0'
    bra $+D'6'
    btg target, D'7'
    btg target, D'0'
    
    ;Check bits 1 and 6 and toggle them if they have different states
    btfsc target, D'6'
    bra $+D'8'
    btfss target, D'1'
    bra $+D'12'
    bra $+D'6'
    btfsc target, D'1'
    bra $+D'6'
    btg target, D'6'
    btg target, D'1'
    
    ;Check bits 2 and 5 and toggle them if they have different states
    btfsc target, D'5'
    bra $+D'8'
    btfss target, D'2'
    bra $+D'12'
    bra $+D'6'
    btfsc target, D'2'
    bra $+D'6'
    btg target, D'5'
    btg target, D'2'
    
    ;Check bits 3 and 4 and toggle them if they have different states
    btfsc target, D'4'
    bra $+D'8'
    btfss target, D'3'
    bra $+D'12'
    bra $+D'6'
    btfsc target, D'3'
    bra $+D'6'
    btg target, D'4'
    btg target, D'3'
    
    
    goto Mainloop
    
    end