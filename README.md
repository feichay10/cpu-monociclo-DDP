# CPU-monociclo-base
Proyecto 1 de Diseño de Procesadores. CPU monociclo base

## Objetivo
El objetivo de este proyecto es diseñar la unidad de control de un procesador. Nos vamos a centrar en un procesador de un sólo ciclo. Para que un procesador pueda ejecutar instrucciones en un solo ciclo sin recurrir al paralelismo en su implementación debemos separar las memorias de instrucciones y de datos de forma que se pueda realizar el acceso a ambas dentro del mismo ciclo. 

Esta estructura es típica de algunos microcontroladores, procesadores muy sencillos con una memoria de programa no volátil, diseñados para funcionar integrados en otro artefacto como una lavadora o un coche, realizando el control del mismo.

La siguiente figura representa el cmaino de datos del procesador. En **rojo y con linea discontinua** las señales que provendrían de la Unidad de Control. 

<p align="center">
  <img src="https://github.com/feichay10/cpu-monociclo-base/blob/614b605938900ecb3efd5d622344b2a07a55fb87/images/Esquema_v1-1.jpg" />
</p>

Se aprecia el registro PC de 10 bits que sirve de direccion a la memoria de programa. El dato obtenido es la instruccion, de 16 bits. Esos 16 bits codifican varios tipos de instrucciones diferentes:

- **Instruccion de salto**: Opcode de 6 bits (15-10) y los 10 bits restante (9-0) serán el nuevo PC si el mutliplexor que controla la entrada al PC tiene su entrada de selección *s_inc* a cero. En las instrucciones que no sean saltos, *s_inc* se pondrá a 1 provocando que el nuevo PC sea el PC previo incrementado en 1.
- **Instrucción de salto condicional si Z**: Opcode de 6 bits (15-10) y los 10 bits restantes (9-0) serán el
nuevo PC si el flag de cero vale 1 (Z=1). En el caso contrario (Z=0), el nuevo PC será el PC previo
incrementado en 1.
- **Instrucción de salto condicional si no Z**: Opcode de 6 bits (15-10) y los 10 bits restantes (9-0) serán el
nuevo PC si el flag de cero vale 0 (Z=0). En el caso contrario (Z=1), el nuevo PC será el PC previo
incrementado en 1.
- **Instrucción de carga de una constante inmediata**: Opcode de 4 bits (15-12), constante inmediata de 8
bits (11-4) y campo de registro de destino de 4 bits (3-0) indicando el registro destino donde se escribirá
la constante (WA3), siempre que el multiplexor que provee el dato a escribir tenga la entrada *s_inm* a 1.
- **Instrucción de operación aritmética o lógica**: Opcode de 4 bits (15-12), campo de primer registro
operando de 4 bits (11-8, ra1), campo de segundo registro operando de 4 bits (7-4, ra2) y campo de
registro de destino de 4 bits (3-0) donde se almacenará el resultado (siempre que el multiplexor tenga
*s_inm* a cero). Estas instrucciones son las únicas que deben afectar al flag de cero Z.

<a name="codificacion">
   <img src="https://github.com/feichay10/cpu-monociclo-base/blob/96c8bdd6a0821d015c150d6e7d298b734499e66e/images/Codificacion%20de%20las%20instrucciones.png" />
</a>

## Instrucciones implementadas
| INSTRUCCIÓN      | OPCODE | DESCRIPCIÓN                                |                               |
| :--------------: | :----: | :----------------------------------------: | :---------------------------: |
| **LOAD**         | 0000?? | Carga un determinado valor en un registro  | Instrucción de carga          |
|                  |        |                                            |                               |
| **J**            | 001000 | Salto incondicional                        | Instrucción de salto          |
| **JZ**           | 001001 | Salto si el flag de 0 está activo          | Instrucción de salto          |
| **JNZ**          | 001010 | Salto si el flag de 0 no está activo       | Instrucción de salto          |
|                  |        |                                            |                               |
| **A**            | 1000?? | Salida de ALU = A                          | Instrucción Aritmetico-Logica |
| **~A**           | 1001?? | Salida de ALU = A negada                   | Instrucción Aritmetico-Logica |
| **ADD**          | 1010?? | Salida de ALU = Suma                       | Instrucción Aritmetico-Logica |
| **SUB**          | 1011?? | Salida de ALU = Resta                      | Instrucción Aritmetico-Logica |
| **AND**          | 1100?? | Salida de ALU = Operacion AND entre bits   | Instrucción Aritmetico-Logica |
| **OR**           | 1101?? | Salida de ALU = Operacion OR entre bits    | Instrucción Aritmetico-Logica |
| **-A**           | 1110?? | Salida de ALU = Negar operando A           | Instrucción Aritmetico-Logica |
| **-B**           | 1111?? | Salida de ALU = Negar operando B           | Instrucción Aritmetico-Logica |


## Funcionamiento
Para comprobar el correcto funcionamiento e implementacion vamos a crear un pequeño programa en ensamblador:
```assembly
program:
  li 1, r1        
  li 10, r2        
  li 0, r3        
bucle:
  sub r2, r1, r2  
  jz fin          
  add r1, r2, r3  
  j bucle         

fin:
  j fin           
```

Este programa en ensamblador lo vamos a codificar en binario en el fichero `progfile.dat`, antes de eso tenemos que codificar las diferentes instrucciones en la unidad de control, en el fichero `instrucciones.txt` se puede ver como hice la codificación de las instrucciones. Para hacer la codificacion tenemos que fijarnos en la [tabla de codificacion](codificacion). En este caso la traducción del codigo ensamblador a binario queda asi:

```
0000_0000_0001_0001  //Instruccion 0 carga inmediata del numero 1 al registro 1
0000_0000_1010_0010  //Instruccion 1 carga inmediata del numero 10 al registro 2
0000_0000_0000_0011  //Instruccion 2 carga inmediata del numero 0 al registro 3
1011_0010_0001_0010  //Instruccion 3 ALU Oper. A - B se guarda resultado en registro 2 (contador)
0010_0100_0000_0111  //Instruccion 4 JZ fin (#7)
1010_0001_0010_0011  //Instruccion 5 ALU Oper. A + B se guardar resultado en registro 3
0010_0000_0000_0011  //Instruccion 6 J bucle (#3)
0010_0000_0000_0111  //Instruccion 7 J fin (#7)          
```
### Resultado en GTKWave
Para comprobar que la CPU está funcionando correctamente vamos a usar el programa `GTKWAVE` y vamos ver si se cumple el funcionamiento del codigo ensamblador:

<p align="center">
  <img src="https://github.com/feichay10/cpu-monociclo-base/blob/0d5f228c8a7e7b85cf2fb2710dac1f63a000f03c/images/gtkwave.png"/>
</p>

## Compilación
Para compilar el programa, es recomendable usar el Script de Bash `compilation.sh`. Este script se encarga de hacer la compilación de forma automática y también genera el fichero `cpu_base` para mostrar los resultados del test. Además, genera otro fichero llamado `cpu_tb.vcd` para posterior análisis en el programa GTKWAVE. Desde el Script de Bash tras la compilacion y la ejecución del programa te pregunta si se quiere ejecutar el programa GTKWAVE.

El comando utilizado para compilar es:
```bash
iverilog -o cpu_base cpu_tb.v alu.v cd.v componentes.v cpu.v memprog.v uc.v
```
Si queremos directamente compilar el programa, mostrar los resultados, generar los ficheros y acceder al GTKWAVE, podemos utilizar el programa `compilation.sh`. Solo hay que ejecutar el siguiente comando:
```bash
./compilation.sh
```


