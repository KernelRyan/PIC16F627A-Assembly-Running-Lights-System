; PIC16F627A Running Lights System
; Assembly Code for CAO216D Project 2025

; Define configuration settings
LIST P=16F627A
INCLUDE <P16F627A.INC>
__CONFIG _INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_ON & _MCLRE_OFF

; Define Pins
BTN1    EQU 0   ; RA0
BTN2    EQU 1   ; RA1
BTN3    EQU 2   ; RA2
BTN4    EQU 3   ; RA3
LEDS    EQU PORTB ; RB0 - RB5 for LEDs

; Initialize variables
    ORG 0x00      ; Start of program
    BSF STATUS, RP0 ; Switch to Bank 1
    CLRF TRISB   ; Set PORTB as output (0)
    MOVLW 0x0F   ; Set PORTA (RA0 to RA3) as input (1)
    MOVWF TRISA
	CLRF  TRISB  ;Disable weak pull-ups and set T0cs to 0
    BCF STATUS, RP0 ; Switch back to Bank 0
	CLRF PORTB   ; Ensure all LEDs are OFF at startup

; Main program loop
MAIN_LOOP:
    ; Check Button 1 (RA0) - Turn OFF all LEDs
    BTFSC PORTA, BTN1
    GOTO ALL_OFF
    
    ; Check Button 2 (RA1) - LEDs 1, 3, 5 ON (RB0, RB2, RB4)
    BTFSC PORTA, BTN2
    GOTO ODD_ON
    
    ; Check Button 3 (RA2) - LEDs 2, 4, 6 ON (RB1, RB3, RB5)
    BTFSC PORTA, BTN3
    GOTO EVEN_ON
    
    ; Check Button 4 (RA3) - All LEDs ON
    BTFSC PORTA, BTN4
    GOTO ALL_ON
    
    ; Default to all OFF if no button pressed
    GOTO ALL_OFF

; Subroutine to turn OFF all LEDs
ALL_OFF:
    CLRF LEDS   ; Clear all LEDs
    GOTO MAIN_LOOP

; Subroutine to turn ON LEDs 1, 3, 5 (RB0, RB2, RB4)
ODD_ON:
    MOVLW 0x15  ; 00010101 - LEDs 1, 3, 5 ON
    MOVWF LEDS
    GOTO MAIN_LOOP

; Subroutine to turn ON LEDs 2, 4, 6 (RB1, RB3, RB5)
EVEN_ON:
    MOVLW 0x2A  ; 00101010 - LEDs 2, 4, 6 ON
    MOVWF LEDS
    GOTO MAIN_LOOP

; Subroutine to turn ON all LEDs
ALL_ON:
    MOVLW 0x3F  ; 00111111 - All LEDs ON
    MOVWF LEDS
    GOTO MAIN_LOOP

    END
