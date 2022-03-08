module uc(input wire [5:0] opcode, input wire z, output reg s_inc, s_inm, we3, wez, output reg [2:0] op_alu);

always @(*)
  casez (opcode)
  //Salto incondicional
  6'b001000:
    begin
      s_inc<=1'b0;
      s_inm<=1'b0;
      we3<=1'b0;
      wez<=1'b0;
      op_alu<=3'b000;
    end
  
  //Salto Condicional
  6'b001001:
    begin
      if (z == 1'b1) 
        s_inc<=1'b1;
      else 
        s_inc<=1'b0;
      s_inm<=1'b0;
      we3<=1'b0;
      wez<=1'b0;
      op_alu<=3'b000;
    end

  //Carga Inmediata
  6'b0000??:
    begin
      s_inc<=1'b1;
      s_inm<=1'b1;
      we3<=1'b1;
      wez = 1'b0;
      op_alu<=3'b000;
    end

  //ALU (Oper. A)
  6'b1000??:
    begin
      s_inc<=1'b1;
      s_inm<=1'b0;
      we3<=1'b1;
      wez<=1'b1;
      op_alu<=3'b000;
    end
  
  //ALU (Oper. A negado)
  6'b1001??:
  begin
    s_inc<=1'b1;
    s_inm<=1'b0;
    we3<=1'b1;
    wez<=1'b1;
    op_alu<=3'b001;
  end

  //ALU (Oper. A + B)
  6'b1010??:
  begin
    s_inc<=1'b1;
    s_inm<=1'b0;
    we3<=1'b1;
    wez<=1'b1;
    op_alu<=3'b010;
  end

  //ALU (Oper. A - B)
  6'b1011??:
  begin
    s_inc<=1'b1;
    s_inm<=1'b0;
    we3<=1'b1;
    wez<=1'b1;
    op_alu<=3'b011;
  end

  //ALU (Oper. A AND B)
  6'b1100??:
  begin
    s_inc<=1'b1;
    s_inm<=1'b0;
    we3<=1'b1;
    wez<=1'b1;
    op_alu<=3'b100;
  end

  //ALU (Oper. A OR B)
  6'b1101??:
  begin
    s_inc<=1'b1;
    s_inm<=1'b0;
    we3<=1'b1;
    wez<=1'b1;
    op_alu<=3'b101;
  end

  //ALU (Oper. -A)
  6'b1110??:
  begin
    s_inc<=1'b1;
    s_inm<=1'b0;
    we3<=1'b1;
    wez<=1'b1;
    op_alu<=3'b110;
  end

  //ALU (Oper. -B)  
  6'b1111??:
  begin
    s_inc<=1'b1;
    s_inm<=1'b0;
    we3<=1'b1;
    wez<=1'b1;
    op_alu<=3'b111;
  end
  default: 
    begin
      s_inc<=1'b1;
      s_inm<=1'b0;
      we3<=1'b0;
      wez<=1'b0;
      op_alu<=3'b000;
    end
  endcase
endmodule