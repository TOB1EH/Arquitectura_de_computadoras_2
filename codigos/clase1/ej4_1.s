/*
	Ejercicio 4.1:
	f = -g - A[4];

    f = - (g + A[4]);
*/

.data
a: .dword 1, 2, 3, 4, 5
f: .dword 2
g: .dword 3
offset: .dword 0x40080000

.text
//LOAD VALUES TO CUSTOM REGISTERS
    LDR X3, offset
    LDR	X0, f
	LDR	X1, g
    LDR X6, =a
    ADD X6, X6, X3

// CODE ARMv8
    LDUR X9, [X2, #32] // x9 = a[4]
    ADD X0, X1, X9 // f = g  + a[4]
    SUB X0, XZR, X0 // f = - g - a[4]

infloop:
	B infloop
