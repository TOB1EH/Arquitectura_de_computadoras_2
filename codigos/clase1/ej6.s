/*
	Ejercicio 6:
	
    Utilizar MOVZ, MOVK para cargar los registros:
    X0 = 0x1234000000000000
    X1 = 0xBBB0000000000AAA
    X2 = 0xA0A0B1B10000C2C2
    X3 = 0x0123456789ABCDEF
*/

.data

.text
//LOAD VALUES TO CUSTOM REGISTERS


// CODE ARMv8
    MOVZ X19, 61, LSL 16
    MOVK X19, 2304, LSL 0

infloop:
	B infloop
