;Define variables: foo at 0x0B, bar at 0x0D and baz at 0x0E
;Set value of bar as foo multiplied by two and
;baz as foo * 2 + 16
;To test the program we set foo as 2 in init
    
    #include P18F452.inc
    
    #define foo 0x0B
    #define bar 0x0D
    #define baz 0x0E
    
;;;;	Vectors	    ;;;;
    
    org 0x0000		    ;Reset vector
    goto Init
    
;;;;	Mainline program    ;;;;
    
Init:
    
    movlw D'2'
    movwf foo
    
Mainloop:
    
    movf foo, 0, 0	    ;move foo to W
    mullw D'2'		    ;multiply W by 2
    movff PRODL, bar	    ;store result to bar, assume result fits in 8bits

    movlw PRODL		    ;store the result also to W
    addlw D'16'		    ;add 16
    movwf baz		    ;store result to baz
    
    goto Mainloop

    end