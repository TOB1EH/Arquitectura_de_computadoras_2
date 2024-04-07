/*
	Ejercicio 3.1:
	f = -g -f;
*/

.data
f: .dword 2
g: .dword 3

.text
//LOAD VALUES TO CUSTOM REGISTERS
    LDR	X0, f
	LDR	X1, g

// CODE ARMv8
	ADD X0, X0, X1 // f =  f + g
    ADD X0, XZR, X0 // f =  -f-g <=> f = -(f + g)

infloop:
	B infloop
