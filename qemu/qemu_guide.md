#HowTo: Debig AArch64 GDB

## 1. Install GDB
1. Tener actualizados los repositorios: `sudo apt update`
2. Setting up AArch64 toolclain: 
    `sudo apt install gcc-aarch-linux-gnu`
3. Setting up QEMU ARM (incluye AArch64):    `sudo apt install qemu-system-arm`
4. Fetch and build AArch64 GDB: `sudo apt install  gdb-multiarch`
5. Configurar GDB para que haga las cosas mas amigables: `wget -P ~ git.io/.gdbinit`

Esto crea un archivo llamado .gdbinit en el directorio personal que configura el GDB para funcionar como un dashboard.

## 2. Ensamblado
1. Escribir el programa a simular en el template **'main.s'**
2. Limpiar el compilador utilizando: `make clean `
3. Compilar utilizando el Makefile: `make`

## 3. Inicio del emulador
1. Iniciar el emulador del microprocesador ARM:
`qemu-system-aarch64 -s -S -machine virt -cpu cortex-a53 -machine type=virt -nographic -smp 1 -m 64 -kernel kernel.img`

## 4. Inicio del debugger
1. Iniciar debugger GDB: ` gdb-multiarch -ex "set architecture aarch64" -ex "target remote
localhost:1234" ` 
2. Configurar la arquitectura a utilizar: `>> set architecture aarch64`
3. Importar al GDB los simbolos de debug en la direccion de memoria donde se encuentra el progrma: `>> add-symbol-file main.o 0x0000000040080000`