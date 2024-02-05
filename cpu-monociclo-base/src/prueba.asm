program:
  li 1, r1        #0
  li 10, r2        #1
  li 0, r3        #2
bucle:
  sub r2, r1, r2  #3
  jz fin          #4
  add r1, r2, r3  #5
  j bucle         #6 -> 6 -> 3

fin:
  j fin           #7





  