/*
	Ejercicio 1.3:
	f = (g + h ) + (g + h);
*/

.data
f: .dword 0
g: .dword 1
h: .dword 2

.text
//LOAD VALUES TO CUSTOM REGISTERS
    LDR	X0, f
	LDR	X1, g
	LDR X2, h

// CODE ARMv8
	ADD X0, X1, X2 // f = g + h:
	LSL X0, #1 // f = f*2 <=> f = g + h + g + h;

infloop:
	B infloop
