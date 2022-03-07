module uc(input wire [5:0] opcode, input wire z, output reg s_inc, s_inm, we3, wez, output reg [2:0] op_alu);

always @(*)
  casez (opcode)
  //Salto
  6'b001000:
    begin
      s_inc<=1'b0;
      s_inm<=1'b0;
      we3<=1'b0;
    end
  
  //Salto Condicional
  6'b001001:
    begin
      if (z == 1'b1)
        s_inc<=1'b0;
      else
        s_inc<=1'b1;
    end

  //Carga Inmediata
  6'b0000??:
    begin
      s_inc<=1'b0;
      s_inm
      we3 
    end

  //ALU
  6'b1001??:
    begin

    end
    default: 
      s_inc<=1'b1;
      s_inm<=1'b0;
      we3<=1'b0;
  endcase
endmodule