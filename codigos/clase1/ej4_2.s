/*
	Ejercicio 4.2:
	B[8] = A[i -j];
*/

.data
a: .dword 1, 2, 3, 4, 5 // a[5] = {1, 2, 3, 4, 5};
c: .dword 1, 2, 3, 4, 5, 6, 7, 8, 9 // c[9] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
i: .dword 2  // i = 2;
j: .dword 1 // j = 1;
offset: .dword 0x40080000

.text
//LOAD VALUES TO CUSTOM REGISTERS
    LDR X9, offset
    LDR X2, i
    LDR X3, j
    LDR X6, =a
    LDR X7, =c
    ADD X6, X6, X9
    ADD X7, X7, X9

// CODE ARMv8
    SUB X10, X2, X3 // i - j 
	ADD  X10, X10, X6  // X10 =  &A[i-j]
    LDUR X11, [X10, #0] // X11 = A[i - j]
    STUR X11, [X7, #64] // B[8] = A[i -j]

infloop:
	B infloop
