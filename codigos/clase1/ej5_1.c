/*
	Ejercicio 5.1: Dada la siguiente sentencia en assembler 
    ARMv8, escribir la secuencia mınima de codigo C:

    .data
    e: .dword 0
    f: .dword 0
    g: .dword 0
    h: .dword 0
    i: .dword 1
    j: .dword 1
    a: .dword 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    c: .dword 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    offset: .dword 0x40080000

    .text
        LDR X8, offset
        LDR X9, e
        LDR X10, f
        LDR X11, g
        LDR X12, h
        LDR X3, i
        LDR X4. j
        LDR X6, =a
        LDR X7, =c
        ADD X6, X6, X8
        ADD X7, X7, X8

    sentencia:
        LSL X9, X3, #3
        ADD X9, X6, X9
        LSL X10, X4, #3
        ADD X10, X7, X10
        LDUR X12, [X9, #0]
        ADD X11, X9, #8
        LDUR X9, [X11, #0]
        ADD X9, X9, X12
        STUR X9, [X10, #0]

    infloop:
    	B infloop
*/

#include <stdio.h>

/* Sentencia paso a paso: */
int main() 
{
    int e, f, g, h;
    int i = 1, j = 1;
    int a[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    int c[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

    e = i * 8;
    f = j * 8;

    h = a[e];
    g = e + 1; // se puede omitir g
    a[e] = a[g]; // a[e] = a[e + 1]
    a[e] += h;
    c[f] = a[e];

    /* Verificacion: */
    for (int i = 0; i < 10; i++)
        printf("%d\t%d\n", a[i], c[i]);        
    
    return 0;
}
