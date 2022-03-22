module uc(input wire [5:0] opcode, input wire z, output reg s_inc, s_inm, we3, wez, s_stack_mux, push, pop, output reg [2:0] op_alu);

always @(opcode)
  casex (opcode)
  //Salto incondicional
  6'b001000:
    begin
      s_inc=1'b0;
      s_inm=1'b0;
      we3=1'b0;
      wez=1'b0;
      op_alu=3'b000;
      s_stack_mux=1'b0;
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
      s_stack_mux=1'b0;
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
      s_stack_mux=1'b0;
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
      s_stack_mux=1'b0;
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
      s_stack_mux=1'b1;
      push=1'b1;
      pop=1'b1;
    end 

  //Carga Inmediata LI
  6'b0000??:
    begin
      s_inc=1'b1;
      s_inm=1'b1;
      we3=1'b1;
      wez=1'b0;
      op_alu=3'b000;
      s_stack_mux=1'b0;
      push=1'b0;
      pop=1'b0;
    end

  // ######## Operaciones de ALU Inmediatos ########

  //ALU (Oper. A)
  6'b1000??:
    begin
      s_inc=1'b1;
      s_inm=1'b1;
      we3=1'b1;
      wez=1'b1;
      op_alu=3'b000;
      s_stack_mux=1'b0;
      push=1'b0;
      pop=1'b0;
    end

  //ALU (Oper. A negado)
  6'b1001??:
  begin
    s_inc=1'b1;
    s_inm=1'b1;
    we3=1'b1;
    wez=1'b1;
    op_alu=3'b001;
    s_stack_mux=1'b0;
    push=1'b0;
    pop=1'b0;
  end

  //ALU (Oper. A + B)
  6'b1010??:
  begin
    s_inc=1'b1;
    s_inm=1'b1;
    we3=1'b1;
    wez=1'b1;
    op_alu=3'b010;
    s_stack_mux=1'b0;
    push=1'b0;
    pop=1'b0;
  end

  //ALU (Oper. A - B)
  6'b1011??:
  begin
    s_inc=1'b1;
    s_inm=1'b1;
    we3=1'b1;
    wez=1'b1;
    op_alu=3'b011;
    s_stack_mux=1'b0;
    push=1'b0;
    pop=1'b0;
  end

  //ALU (Oper. A AND B)
  6'b1100??:
  begin
    s_inc=1'b1;
    s_inm=1'b1;
    we3=1'b1;
    wez=1'b1;
    op_alu=3'b100;
    s_stack_mux=1'b0;
    push=1'b0;
    pop=1'b0;
  end

  //ALU (Oper. A OR B)
  6'b1101??:
  begin
    s_inc=1'b1;
    s_inm=1'b1;
    we3=1'b1;
    wez=1'b1;
    op_alu=3'b101;
    s_stack_mux=1'b0;
    push=1'b0;
    pop=1'b0;
  end

  //ALU (Oper. -A)
  6'b1110??:
  begin
    s_inc=1'b1;
    s_inm=1'b1;
    we3=1'b1;
    wez=1'b1;
    op_alu=3'b110;
    s_stack_mux=1'b0;
    push=1'b0;
    pop=1'b0;
  end

  //ALU (Oper. -B)  
  6'b1111??:
  begin
    s_inc=1'b1;
    s_inm=1'b1;
    we3=1'b1;
    wez=1'b1;
    op_alu=3'b111;
    s_stack_mux=1'b0;
    push=1'b0;
    pop=1'b0;
  end

  default: 
    begin
      s_inc=1'b1;
      s_inm=1'b0;
      we3=1'b0;
      wez=1'b0;
      op_alu=3'b000;
      s_stack_mux=1'b0;
      push=1'b0;
      pop=1'b0;
    end
  endcase
  
endmodule