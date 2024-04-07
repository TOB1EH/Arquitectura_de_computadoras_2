/*
	Ejercicio 3.2:
	f = g + (-f - 5);

    f = g - (f + 5);
*/

.data
f: .dword 2
g: .dword 3

.text
//LOAD VALUES TO CUSTOM REGISTERS
    LDR	X0, f
	LDR	X1, g

// CODE ARMv8
	ADD X0, X0, #5 // f = f + 5
	SUB X0, X1, X0 // f = g - (f + 5)

infloop:
	B infloop
