/*
	Ejercicio 1.1:
	f = g + h + i + j;
*/

.data
f: .dword 0
g: .dword 1
h: .dword 2
i: .dword 3
j: .dword 4

.text
//LOAD VALUES TO CUSTOM REGISTERS
    	LDR	X0, f
	LDR	X1, g
	LDR 	X2, h
	LDR	X3, i
	LDR	X4, j

// CODE ARMv8
	ADD X0, X1, X2 // f = g + h
	ADD X0, X0, X3 // f += j
	ADD X0, X0, X4 // f += i
infloop:
	B infloop