;Init A/D start conversion and store the result to registers
    
    #include P18F452.inc
    
    #define resultH 0x0A
    #define resultL 0x0B

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
    ;Use clock conversion Fosc/32, channel 0(AN0), enable adc module
    ;Rigth justified result format, set AN0 as only analog channel
    ;and use Vdd and Vss as references
    movwl B'10000001', ADCON0
    movwl B'10001110', ADCON1
    
Mainloop:

    ;Start conversion
    movlw B'00000010'
    andwf ADCON0
    
    ;Wait for result
    btfsc ADCON0, D'2'
    bra $-D'2'
    
    ;Store result to register
    movff ADRESH, resultH
    movff ADRESL, resultL
    
    goto Mainloop
    
    end
