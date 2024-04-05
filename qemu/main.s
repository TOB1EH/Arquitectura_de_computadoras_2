.data
memArray: .dword 10, 20, 30
result: .dword 0
a: .dword 0
i: .dword 0
offset: .dword 0x40080000

.text
//LOAD VALUES TO CUSTOM REGISTERS
    	LDR	X3, offset
	LDR	X0,=memArray
	LDR	X1,=a
	LDR	X2,=result
	LDR	X10,=i
	ADD	X0, X0, X3
	ADD	X1, X1, X3
	ADD	X2, X2, X3
	ADD	X10, X10, X3

//Perform the operatio
	ADD X10, XZR, XZR
	ADD X2, XZR, XZR
	loop:
		LDR X1, [X0,#0]
		ADD X2, X2, x1
		ADD X0, X0, #8
		ADD X10, X10, #1
		CMP X10, #3
		B.LT loop
	infloop: b infloop
