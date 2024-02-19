program: li 1, r1
         li 5, r2
         li 0, r3
bucle: sub r2, r1, r2
       jz fin
       add r1, r2, r3
       j bucle
fin: j fin