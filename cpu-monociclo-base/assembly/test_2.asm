li 5, r1
li 1, r2     
loop: sub r1 r1 r2      
      j endloop     
otraetiqueta: add r3 r2 r2   
      jnz main    
main: li 7, r5       
      not r5 r5            
      or r11 r3 r2          
      and r12 r3 r2             
      add r12 r2 r2         
endloop: sub r1 r1 r2       
      and r6 r2 r2       
      or r7 r0 r0        
      not r8 r5         
      jnz otraetiqueta