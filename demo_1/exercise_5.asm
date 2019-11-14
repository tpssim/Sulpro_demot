;Create a makro which moves a literal to a defined reqister in RAM memory    
    
    #include P18F452.inc

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
    ;Test the macro
    movwl D'4', 0x0A
    movwl D'2', 0x0B
    
Mainloop:
  
    nop
    
    goto Mainloop
    
    end


