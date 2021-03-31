;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here

;-------------------------------------------------------------------------------
							 ; Aufgabe 1 : die Summe der Zahlen von 1 bis 100
							 ; Das Ergebnis in R5
		MOV		#0d,R5   	 ; Zuerst speichere 0 in R5
		MOV		#100d,R6	 ; Dann speichere 100 in R6
_LOOP	ADD		R6,R5		 ; Addiere ich Zahl in R6 mit Zahl in R5 dann wird die Summe in R5 geschrieben
		DEC		R6			 ; Dec. Zahl in R6
		JZ		BEENDE		 ; Wenn Zahl in R6 0 wird, endet die Schleife
		JMP		_LOOP	     ; Wenn Zahl nicht 0 waere zurück (_LOOP)
BEENDE	NOP					 ; Ergebnis = 5050d
;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
