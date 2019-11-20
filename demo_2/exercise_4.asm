;Copy data from adress D'300' and forward to adress D'800'
;until data == 0x00
    
    #include P18F452.inc
    
    #define counter 0x0A
    
    DATA_START equ 0x12C    ;D'300'
    DEST_START equ 0x320    ;D'800'

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
    ;Set some data to be copied
    movwl D'23', 0x12C
    movwl D'34', 0x12D
    movwl D'54', 0x12E
    movwl D'23', 0x12F
    movwl D'0', 0x130	    
    
Mainloop:

    
    
    goto Mainloop
    
    end


