li R1 5                       ; R1 = 5
li R2 1                       ; R2 = 1
loop: sub R1 R1 R2            ; R1 = R1 - R2 = 5 - 1 = 4
      j endloop               ; salta a endloop
otraetiqueta: add R3 R2 R2    ; R3 = R2 + R2 = 1 + 1 = 2
      jnz main                ; si R3 != 0, salta a main = 2 != 0
main: li R5 7                 ; R5 = 7
      not R5 R5               ; R5 = ~R5 = ~7
      or R11 R3 R2            ; R11 = R3 | R2 = 2 | 1 = 3
      and R12 R3 R2           ; R12 = R3 & R2 = 2 & 1 = 0     
      add R12 R2 R2           ; R12 = R2 + R2 = 1 + 1 = 2
endloop: sub R1 R1 R2         ; R1 = R1 - R2 = 0 - 1 = -1
      and R6 R2 R2            ; R6 = R2 & R2 = 1 & 1 = 1
      or R7 R0 R0             ; R7 = R0 | R0 = 0 | 0 = 0
      not R8 R5               ; R8 = ~R5 = ~7
      jnz otraetiqueta        ; si R1 != 0, salta a otraetiqueta = -1 != 0