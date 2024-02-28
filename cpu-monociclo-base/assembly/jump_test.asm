; Probar los saltos condicionales JZ y JNZ en un programa en ensamblador. 
; Probar que el programa funciona correctamente y que también falle estas instrucciones.
;-----------------------------------------------------------------------------------------------------------------------

# li 2, r1
# li 1, r2
# iter: add r1, r2, r1 ;3; 2 + 1 = 3
# jz fin
# sub r1, r2, r1 ; 3 - 1 = 2
# jnz iter
# fin: j fin

li 2, r1
li 1, r2
iter: sub r1, r2, r1
jnz iter
iter2: j iter3
iter3: jnz iter2
Fin: j Fin