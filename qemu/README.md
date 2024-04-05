# HowTo: Debug AArch64 GDB

## 1. Install GDB
1. Tener actualizados los repositorios:<br> `sudo apt update`
2. Configurar la cadena de herramientas AArch64:<br> 
    `sudo apt install gcc-aarch-linux-gnu`
3. Configurar QEMU ARM, incluyendo AArch64:<br>    `sudo apt install qemu-system-arm`
4. Obtener e instalar GDB para AArch64:<br> `sudo apt install  gdb-multiarch`
5. Configurar GDB para que haga las cosas mas amigables:<br> `wget -P ~ git.io/.gdbinit`

Esto crea un archivo llamado .gdbinit en el directorio personal que configura el GDB para funcionar como un dashboard.

## 2. Ensamblado
1. Escribir el programa a simular en el template **'main.s'**
2. Limpiar el compilador utilizando: `make clean `
3. Compilar utilizando el Makefile: `make`

## 3. Inicio del emulador
1. Iniciar el emulador del microprocesador ARM:<br>
`qemu-system-aarch64 -s -S -machine virt -cpu cortex-a53 -machine type=virt -nographic -smp 1 -m 64 -kernel kernel.img`

## 4. Inicio del debugger
1. Iniciar debugger GDB (En otra consola, mientras de ejecuta el Emulador):<br> `gdb-multiarch -ex "set architecture aarch64" -ex "target remote
localhost:1234"` 
2. Configurar la arquitectura a utilizar:<br> `>> set architecture aarch64`
3. Importar al GDB los simbolos de debug en la direccion de memoria donde se encuentra el progrma:<br> `>> add-symbol-file main.o 0x0000000040080000`

## 5. Configuración del Dashboard
El dashboard es un interfaz visual modular que se utiliza para mostrar de forma
más amigable la información relevante para realizar el debugging. Algunas de
las secciones más importantes son:<br>
• Assembly<br>
• Memory<br>
• Registers<br>
• Source<br>
## 6. Ejecución paso a paso con GDB
• El comando que se utiliza para ejecutar una única instrucción de assembly
es:<br> 
`>> stepi`<br>
• Si se desea ejecutar un bloque de n instrucciones:<br>
`>> stepi n`<br>
• Otra forma de ejecutar más de una instrucción es utilizando breakpoints:<br>
`>> break n instr`<br>
`>> break etiqueta`<br>
• Luego de indicar los breakpoints, mediante el comando continue se ejecuta
el programa hasta encontrar el primer breakpoint:<br>
`>> continue`<br>
• Para ver todos los breakpoints existentes:<br>
`>> info breakpoints`<br>
• Para eliminar todos breakpoints:<br>
`>> delete breakpoints`<br>
• Para ver informacion de los registros:<br>
`>> info registers`<br>