/*
	Ejercicio 1.2:
	f = g + (h + 5);
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
	ADD X0, X2, #5  // f = h + 5
    ADD X0, X0, X1 // f += g

infloop:
	B infloop
