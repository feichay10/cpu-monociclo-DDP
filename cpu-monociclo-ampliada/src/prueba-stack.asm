program:
  li 1, r1        #0
  li 10, r2        #1
  li 0, r3        #2

  j 
etiqueta:
  add r3, r1, r2  #5        #6
  j bucle         #7 -> 6 -> 3

fin:
  j fin           #7