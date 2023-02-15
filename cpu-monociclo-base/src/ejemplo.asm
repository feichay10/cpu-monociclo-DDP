; Ejemplo sintaxis del ensamblador

; En principio, nemónicos, etiquetas y constantes definidas en equ y la R de registro pueden ir en mayúsculas o minúsculas
; pero se recomienda un uso consistente (todo en minúsculas, por ejemplo)
; la línea típica consiste en un nemónico seguido de operandos. Estos deben estar separados por comentarios
; Es posible dejar líneas en blanco. Típicamente se dejan espacios en blanco cuando la línea no tiene etiqueta
; para alinear en la misma columna las instrucciones

       movi 3, r2
       add  r1, r2, r3
pepe:  sub  r3, r1, r7

; Comentarios: se usa el carácter ';'. Los comentarios pueden ir en la misma línea o en
; lineas separadas (desde que aparezca el caracter ';' se considerará el resto de la línea como comentario)
; No existe el comentario de bloque (multilínea)

; Definición de constantes, el ':' es obligatorio para definirla
; es posible definir valores negativos, se representarán internamente
; en 32 bits en complemento a dos, se fija su representación
; y se recorta al tamaño en bits final desde los bits menos significativos
; Las definiciones pueden ocurrir en cualquier línea, incluso después de ser referenciadas en las instrucciones
; Las referencias a las constantes en las instrucciones no llevan el ':'

popo: equ  0xffff
popi: equ  -1
popu: equ  3
      ori  popo, r1, r15    ;las referencias a constantes no llevan el ':'

; Definición de etiquetas
; Las etiquetas tendrán el valor de la posición de memoria de código donde resida la instrucción inmediatamente siguiente
; se pueden definir en una línea por sí solas o en conjunto con una instrucción.
; Cuando son referenciadas en las instrucciones de salto no se pone el ':'

caca:
      movi 3, R2
      jz   caca
pope: jmp  pope