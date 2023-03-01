LI R1 5
LI R2 1
loop: SUB R1 R1 R2
      jz endloop
      j loop

otraetiqueta:
      c2i R4 1
      addi R3 R2 1
      c2 R9 R8
      jnz main

main: 
      LI R5 7
      not R5 R5 # -8
      or R11 R3 R2 # 3
      and R12 R3 R2 # 0
      add R12 R2 R2 # 2

infiniteloop:
      nop
jrel infiniteloop

endloop:
      mov R1 R2 # 1
      subi R1 R1 3 # -2
      andi R6 R2 5 # 1
      ori R7 R0 1  # 1
      noti R8 2 # -1
      jne otraetiqueta
      jrel main

# LOAD (LI) ************
# J **********
# JZ ******************
# JNZ
# A *****
# ~A (NOT) **********
# ADD *************
# SUB ************
# AND ************
# OR *************
# -A
# -B 