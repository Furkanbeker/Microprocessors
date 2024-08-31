    LIST    P=16F877A            ; Define processor for MPASM
    #include <P16F877A.INC>      ; Include the definitions for PIC16F877A

    __CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _WRT_OFF & _CP_OFF
    ORG     0x00                 
 
    BANKSEL TRISB                
    MOVLW   b'11111111'          
    MOVWF   TRISB
    MOVLW   b'00000000'          
    MOVWF   TRISD
    BANKSEL PORTB               

MAIN_LOOP
    BTFSS   PORTB, 0             
    GOTO    S1_NOT_PRESSED      
    BSF     PORTD, 1            
    GOTO    CHECK_S3            
S1_NOT_PRESSED
    BCF     PORTD, 1             
CHECK_S3
    BTFSS   PORTB, 2             
    GOTO    S3_NOT_PRESSED      
    BSF     PORTD, 3            
    GOTO    MAIN_LOOP           
S3_NOT_PRESSED
    BCF     PORTD, 3             
    GOTO    MAIN_LOOP            

    END                           
