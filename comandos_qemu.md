#ENSAMBLADO:

Compilar: $ make

#EMULADOR:
	
Iniciar: $ qemu-system-aarch64 -s -S -machine virt -cpu cortex-a53 -machine type=virt -nographic -smp 1 -m 64 -kernel kernel.img

#DEBUGGER:

GDB: $ gdb-multiarch -ex "set architecture aarch64" -ex "target remote localhost:1234"

#COMANDOS GDB:

add-symbol-file main.o 0x0000000040080000

-----------------------------------------

stepi

info registers
