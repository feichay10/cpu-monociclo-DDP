program: li R1 1        ; R1 = 1
  li R2 5                ; R2 = 5
  li R3 0                ; R3 = 0
bucle: sub R2, R1, R2    ; R2 = R2 - R1 = 5 - 1 = 4 -> j bucle = goto bucle -> R2 = R2 - R1 = 4 - 4 = 0 
  jz fin                 ; if R2 == 0 then goto fin -> jz fin = if R2 == 0 then goto fin
  add R1, R2, R3         ; R1 = R2 + R3 = 4 + 0 = 4
  j bucle                ; goto bucle
fin: j fin               ; goto fin