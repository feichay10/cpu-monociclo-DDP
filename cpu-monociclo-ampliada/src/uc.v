module uc(input wire [5:0] opcode, input wire z, output reg s_inc, s_inm, we3, wez, s_pila, s_datos, push, pop, output reg [2:0] op_alu);

always @(opcode)
  casex (opcode)
  // ######## Instrucciones de Salto ########
  //Salto incondicional J
  6'b001000:
    begin
      s_inc=1'b0;
      s_inm=1'b0;
      we3=1'b0;
      wez=1'b0;
      op_alu=3'b000;
      s_pila=1'b0;
      s_datos=1'b0;
      push=1'b0;
      pop=1'b0;
    end
  
  //Salto Condicional JZ
  6'b001001:
    begin
      if (z == 1'b1) 
        s_inc=1'b0;
      else 
        s_inc=1'b1;
      s_inm=1'b0;
      we3=1'b0;
      wez=1'b0;
      op_alu=3'b000;
      s_pila=1'b0;
      s_datos=1'b0;
      push=1'b0;
      pop=1'b0;
    end
  //Salto Condicional JNZ
  6'b001010:
    begin
      if (z == 1'b1) 
        s_inc=1'b1;
      else 
        s_inc=1'b0;
      s_inm=1'b0;
      we3=1'b0;
      wez=1'b0;
      op_alu=3'b000;
      s_pila=1'b0;
      s_datos=1'b0;
      push=1'b0;
      pop=1'b0;
    end
  
  //Salto a subrutina PUSH JCALL
  6'b001011:
    begin
      if (z == 1'b1) 
        s_inc=1'b1;
      else 
        s_inc=1'b0;
      s_inm=1'b0;
      we3=1'b0;
      wez=1'b0;
      op_alu=3'b000;
      s_pila=1'b0;
      s_datos=1'b0;
      push=1'b1;
      pop=1'b0;
    end
  
  //Salto de vuelta a subrutina POP JR
  6'b001100:
    begin
      if (z == 1'b1) 
        s_inc=1'b1;
      else 
        s_inc=1'b0;
      s_inm=1'b0;
      we3=1'b0;
      wez=1'b0;
      op_alu=3'b000;
      s_pila=1'b1;
      s_datos=1'b0;
      push=1'b0;
      pop=1'b1;
    end 

  // ######## Operaciones de ALU inmediatas ########

  //ALU (Oper. A) LI
  6'b1000??:
    begin
      s_inc=1'b1;
      s_inm=1'b1;
      we3=1'b1;
      wez=1'b1;
      op_alu=3'b000;
      s_pila=1'b0;
      s_datos=1'b0;
      push=1'b0;
      pop=1'b0;
    end

  //ALU (Oper. A negado) ~A - NOTI
  6'b1001??:
  begin
    s_inc=1'b1;
    s_inm=1'b1;
    we3=1'b1;
    wez=1'b1;
    op_alu=3'b001;
    s_pila=1'b0;
    s_datos=1'b0;
    push=1'b0;
    pop=1'b0;
  end

  //ALU (Oper. A + B) ADDI
  6'b1010??:
  begin
    s_inc=1'b1;
    s_inm=1'b1;
    we3=1'b1;
    wez=1'b1;
    op_alu=3'b010;
    s_pila=1'b0;
    s_datos=1'b0;
    push=1'b0;
    pop=1'b0;
  end

  //ALU (Oper. A - B) SUBI
  6'b1011??:
  begin
    s_inc=1'b1;
    s_inm=1'b1;
    we3=1'b1;
    wez=1'b1;
    op_alu=3'b011;
    s_pila=1'b0;
    s_datos=1'b0;
    push=1'b0;
    pop=1'b0;
  end

  //ALU (Oper. A AND B) ANDI
  6'b1100??:
  begin
    s_inc=1'b1;
    s_inm=1'b1;
    we3=1'b1;
    wez=1'b1;
    op_alu=3'b100;
    s_pila=1'b0;
    s_datos=1'b0;
    push=1'b0;
    pop=1'b0;
  end

  //ALU (Oper. A OR B) ORI
  6'b1101??:
  begin
    s_inc=1'b1;
    s_inm=1'b1;
    we3=1'b1;
    wez=1'b1;
    op_alu=3'b101;
    s_pila=1'b0;
    s_datos=1'b0;
    push=1'b0;
    pop=1'b0;
  end

  //ALU (Oper. -A) NEGI
  6'b1110??:
  begin
    s_inc=1'b1;
    s_inm=1'b1;
    we3=1'b1;
    wez=1'b1;
    op_alu=3'b110;
    s_pila=1'b0;
    s_datos=1'b0;
    push=1'b0;
    pop=1'b0;
  end

  // ######## Operaciones de ALU con registros ########

  //ALU (Oper. A) MOV
  6'b010000:
    begin
      s_inc=1'b1;
      s_inm=1'b0;
      we3=1'b1;
      wez=1'b1;
      op_alu=3'b000;
      s_pila=1'b0;
      s_datos=1'b0;
      push=1'b0;
      pop=1'b0;
    end

  //ALU (Oper. A negado) ~A - NOT
  6'b010001:
  begin
    s_inc=1'b1;
    s_inm=1'b0;
    we3=1'b1;
    wez=1'b1;
    op_alu=3'b001;
    s_pila=1'b0;
    s_datos=1'b0;
    push=1'b0;
    pop=1'b0;
  end

  //ALU (Oper. A + B) ADD
  6'b010010:
  begin
    s_inc=1'b1;
    s_inm=1'b0;
    we3=1'b1;
    wez=1'b1;
    op_alu=3'b010;
    s_pila=1'b0;
    s_datos=1'b0;
    push=1'b0;
    pop=1'b0;
  end

  //ALU (Oper. A - B) SUB
  6'b010011:
  begin
    s_inc=1'b1;
    s_inm=1'b0;
    we3=1'b1;
    wez=1'b1;
    op_alu=3'b011;
    s_pila=1'b0;
    s_datos=1'b0;
    push=1'b0;
    pop=1'b0;
  end

  //ALU (Oper. A AND B) AND
  6'b010100:
  begin
    s_inc=1'b1;
    s_inm=1'b0;
    we3=1'b1;
    wez=1'b1;
    op_alu=3'b100;
    s_pila=1'b0;
    s_datos=1'b0;
    push=1'b0;
    pop=1'b0;
  end

  //ALU (Oper. A OR B) OR
  6'b010101:
  begin
    s_inc=1'b1;
    s_inm=1'b0;
    we3=1'b1;
    wez=1'b1;
    op_alu=3'b101;
    s_pila=1'b0;
    s_datos=1'b0;
    push=1'b0;
    pop=1'b0;
  end

  //ALU (Oper. -A) NEG
  6'b010110:
  begin
    s_inc=1'b1;
    s_inm=1'b0;
    we3=1'b1;
    wez=1'b1;
    op_alu=3'b110;
    s_pila=1'b0;
    s_datos=1'b0;
    push=1'b0;
    pop=1'b0;
  end

  default: 
    begin
      s_inc=1'b0;
      s_inm=1'b0;
      we3=1'b0;
      wez=1'b0;
      op_alu=3'b000; 
      s_pila=1'b0;
      s_datos=1'b0;
      push=1'b0;
      pop=1'b0;
    end
  endcase
  
endmodule