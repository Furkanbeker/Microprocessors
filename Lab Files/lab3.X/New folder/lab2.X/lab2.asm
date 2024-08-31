#include <p16f877a.inc>  ; Include the header file for PIC16F877A microcontroller

__CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF

    ;My Birthdate is 04.07.2003
; Define constants for segment selection bits and switch pins
RIGHTMOST_7SEGMENT   EQU  4  ; PORTB.4 controls rightmost segment
LEFTMOST_7SEGMENT    EQU  7  ; PORTB.7 controls leftmost segment
MIDDLE_LEFT_7SEGMENT  EQU  5  ; PORTB.5 controls middle-left segment
MIDDLE_RIGHT_7SEGMENT EQU  6  ; PORTB.6 controls middle-right segment

SWITCH1  EQU  3  ; PORTB.3 connected to switch S1
SWITCH2  EQU  2  ; PORTB.2 connected to switch S2
SWITCH3  EQU  1  ; PORTB.1 connected to switch S3
SWITCH4  EQU  0  ; PORTB.0 connected to switch S4

; Define segment display values for easier readability
SEVENSEGMENT_0 EQU 0x3F ; Replace with the appropriate value for number 0 (corrected)
SEVENSEGMENT_1 EQU 0x06
SEVENSEGMENT_2 EQU 0x5B
SEVENSEGMENT_3 EQU 0x4F
SEVENSEGMENT_4 EQU 0x66
SEVENSEGMENT_5 EQU 0x6D
SEVENSEGMENT_6 EQU 0x7D
SEVENSEGMENT_7 EQU 0x07  ; Corrected value for number 7
SEVENSEGMENT_8 EQU 0x6F
SEVENSEGMENT_9 EQU 0x67

; Interrupt vector (unused in this example)
RES_VECT   CODE   0x0000

; Main program starts here
START:
  BSF   STATUS, RP0 ; Select Bank 1 (TRIS registers are in Bank 1)
  MOVLW  b'00000000' ; Set all TRIS bits (TRISA, TRISB, TRISC) to output (1)
  CLRF   TRISD      ; Set all TRISD bits to output (already done in Bank 0)
  MOVWF  TRISB      ; Set all PORTB bits as outputs

  BCF   STATUS, RP0 ; Select Bank 0 (PORT registers are in Bank 0)
  CLRF   PORTD      ; Clear all segments initially

  

LOOP:
  ; Display the number 2 on the leftmost segment
  MOVLW  SEVENSEGMENT_2
  MOVWF  PORTD
  BSF    PORTB, LEFTMOST_7SEGMENT   ; Enable leftmost segment
  BCF    PORTB, RIGHTMOST_7SEGMENT  ; Disable rightmost segment
  BCF    PORTB, MIDDLE_LEFT_7SEGMENT
  BCF    PORTB, MIDDLE_RIGHT_7SEGMENT

  
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP

  
  ; Display '0'on the middle-left segment
  MOVLW  SEVENSEGMENT_0
  MOVWF  PORTD
  BSF    PORTB, MIDDLE_LEFT_7SEGMENT  ; Enable middle-left segment
  BCF    PORTB, LEFTMOST_7SEGMENT   ; Disable leftmost segment
  BCF    PORTB, RIGHTMOST_7SEGMENT  ; Disable rightmost segment
  BCF    PORTB, MIDDLE_RIGHT_7SEGMENT


  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  
 
  ; Display '0 on the middle-right segment
  MOVLW  SEVENSEGMENT_0
  MOVWF  PORTD
  BSF    PORTB, MIDDLE_RIGHT_7SEGMENT  ; Enable middle-right segment
  BCF    PORTB, LEFTMOST_7SEGMENT   ; Disable leftmost segment
  BCF    PORTB, RIGHTMOST_7SEGMENT  ; Disable rightmost segment
  BCF    PORTB, MIDDLE_LEFT_7SEGMENT

  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  
MOVLW  SEVENSEGMENT_3
  MOVWF  PORTD
  BSF    PORTB, RIGHTMOST_7SEGMENT  ; Enable middle-right segment
  BCF    PORTB, LEFTMOST_7SEGMENT   ; Disable leftmost segment
  BCF    PORTB, MIDDLE_RIGHT_7SEGMENT  ; Disable rightmost segment
  BCF    PORTB, MIDDLE_LEFT_7SEGMENT

  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
    
    
    
    GOTO LOOP 
    
    END