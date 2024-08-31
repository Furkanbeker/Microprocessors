; TODO INSERT CONFIG CODE HERE USING CONFIG BITS GENERATOR
#include "p16f877a.inc"
__CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF   
    
CBLOCK	0x20	;16F877A'n?n RAM ba?lang?ç adresi, 
delay_data	;Gecikme alt programlar? için veri de?i?keni.
ENDC 
    
; Define constants for segment selection bits and switch pins
RIGHTMOST_7SEGMENT  EQU 4 ; PORTB.4 controls rightmost segment
LEFTMOST_7SEGMENT  EQU 7 ; PORTB.7 controls leftmost segment
MIDDLE_LEFT_7SEGMENT EQU 5 ; PORTB.5 controls middle-left segment
MIDDLE_RIGHT_7SEGMENT EQU 6 ; PORTB.6 controls middle-right segment
 

SEVENSEGMENT_0 EQU 0x3F ; Corrected value for number 0
SEVENSEGMENT_1 EQU 0x06
SEVENSEGMENT_2 EQU 0x5B
SEVENSEGMENT_3 EQU 0x4F
SEVENSEGMENT_4 EQU 0x66
SEVENSEGMENT_5 EQU 0x6D
SEVENSEGMENT_6 EQU 0x7D
SEVENSEGMENT_7 EQU 0x07
SEVENSEGMENT_8 EQU 0x7F
SEVENSEGMENT_9 EQU 0x67
 
 
RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program
; TODO ADD INTERRUPTS HERE IF USED
ISR  CODE    0x0004            ; Interrupt service routine
BCF INTCON, TMR0IF ; I clear the interrupt flag for the Timer0
MOVLW b'00001000'
XORWF PORTB, 1 ; I toggle the last bit of port B
MOVLW .12  ; I will load this value to Timer0
MOVWF TMR0 ;




RETFIE
  

	
 


  
START
  
    BSF STATUS, RP0; BANK1 is selected.
    CLRF TRISB ; Set all the pins of PortB as output.
    CLRF OPTION_REG ; Cleared all the values in this register
    CLRF  TRISD   ; Set all TRISD bits to output (already done in Bank 0)
    MOVLW b'00000111' ; This bit pattern will set the PS0, PS1 and PS2 to 1 after XOR
    XORWF OPTION_REG, 1 ; I selected the prescalar as 256.
    BCF STATUS, RP0 ; BANK0 is  selected. 
                    ;This is necessary because in the interrupt service routine
		    ; we need to clear the TMR0IF flag, which is in BANK1
    ;BCF STATUS, RP0 ; BANK0 is select,
    BSF INTCON, GIE ; I enabled global interrupts
    BSF INTCON, TMR0IE ; I enabled the interrupt from the Timer0
   
    

    
    
 
   

 
 
LOOP
    
    MOVLW  SEVENSEGMENT_0
    MOVWF  PORTD
    call	delay_ms
    BSF    PORTB, RIGHTMOST_7SEGMENT   ; Enable leftmost segment
    call	delay_ms
    BCF    PORTB, RIGHTMOST_7SEGMENT
    MOVLW  SEVENSEGMENT_1
    MOVWF  PORTD
    call	delay_ms
    BSF    PORTB, RIGHTMOST_7SEGMENT   ; Enable leftmost segment
    call	delay_ms
    BCF    PORTB, RIGHTMOST_7SEGMENT
    MOVLW  SEVENSEGMENT_2
    MOVWF  PORTD
    call	delay_ms
    BSF    PORTB, RIGHTMOST_7SEGMENT   ; Enable leftmost segment
    call	delay_ms
    BCF    PORTB, RIGHTMOST_7SEGMENT
    MOVLW  SEVENSEGMENT_3
    MOVWF  PORTD
    call	delay_ms
    BSF    PORTB, RIGHTMOST_7SEGMENT   ; Enable leftmost segment
    call	delay_ms
    BCF    PORTB, RIGHTMOST_7SEGMENT
    MOVLW  SEVENSEGMENT_4
    MOVWF  PORTD
    call	delay_ms
    BSF    PORTB, RIGHTMOST_7SEGMENT   ; Enable leftmost segment
    call	delay_ms
    BCF    PORTB, RIGHTMOST_7SEGMENT
    MOVLW  SEVENSEGMENT_5
    MOVWF  PORTD
    call	delay_ms
    BSF    PORTB, RIGHTMOST_7SEGMENT   ; Enable leftmost segment
    call	delay_ms
    BCF    PORTB, RIGHTMOST_7SEGMENT
    MOVLW  SEVENSEGMENT_6
    MOVWF  PORTD
    call	delay_ms
    BSF    PORTB, RIGHTMOST_7SEGMENT   ; Enable leftmost segment
    call	delay_ms
    BCF    PORTB, RIGHTMOST_7SEGMENT
    MOVLW  SEVENSEGMENT_7
    MOVWF  PORTD
    call	delay_ms
    BSF    PORTB, RIGHTMOST_7SEGMENT   ; Enable leftmost segment
    call	delay_ms
    BCF    PORTB, RIGHTMOST_7SEGMENT
    MOVLW  SEVENSEGMENT_8
    MOVWF  PORTD
    call	delay_ms
    BSF    PORTB, RIGHTMOST_7SEGMENT   ; Enable leftmost segment
    call	delay_ms
    BCF    PORTB, RIGHTMOST_7SEGMENT
    MOVLW  SEVENSEGMENT_9
    MOVWF  PORTD
    call	delay_ms
    BSF    PORTB, RIGHTMOST_7SEGMENT   ; Enable leftmost segment
    call	delay_ms
    BCF    PORTB, RIGHTMOST_7SEGMENT

    
    
    
    
    
    
    
    GOTO LOOP
    

    
    
delay_ms
	movwf	delay_data
delay_ms_j0
	movlw	.61
	movwf	delay_data+1
	nop
	nop
delay_ms_j1
	nop
	nop
	nop
	nop
	decfsz	delay_data+1, F
	goto	delay_ms_j1
	nop
	decfsz	delay_data, F
	goto	delay_ms_j0
	nop
	return 
   

END