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

<p align="center">
  <img src="https://github.com/feichay10/cpu-monociclo-base/blob/96c8bdd6a0821d015c150d6e7d298b734499e66e/images/Codificacion%20de%20las%20instrucciones.png" />
</p>

## Funcionamiento
Para comprobar el correcto funcionamiento e implementacion vamos a crear un pequeño programa en ensamblador:
<p align="center">
  <img src="https://github.com/feichay10/cpu-monociclo-base/blob/96c8bdd6a0821d015c150d6e7d298b734499e66e/images/ensamblador%20ejemplo.png" />
</p>

Este programa en ensamblador lo vamos a codificar en binario en el fichero `progfile.dat`, antes de eso tenemos que codificar las diferentes instrucciones en la unidad de control, en el fichero `instrucciones.txt` se puede ver como hice la codificación de las instrucciones. Para hacer la codificacion tenemos que fijarnos en la tabla de la codificacion. En este caso la traduccion del codigo ensamblador a binario queda asi:

<p align="center">
  <img src="https://github.com/feichay10/cpu-monociclo-base/blob/96c8bdd6a0821d015c150d6e7d298b734499e66e/images/Codificacion%20binaria.png" />
</p>
