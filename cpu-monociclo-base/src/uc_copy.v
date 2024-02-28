module uc(input wire [5:0] opcode, input wire z, output reg s_inc, s_inm, we3, wez, output reg [2:0] op_alu);

    always @(opcode)
    begin
        // Decodificar el opcode y activar las señales correspondientes
        casex(opcode)
            6'b000001: begin // Salto absoluto incondicional
                s_inc = 1;
                s_inm = 0;
                we3 = 0;
                wez = 1;
                op_alu = 3'b000;
            end

            6'b000010: begin // Salto condicional (a las condiciones z = 1) jnz
                s_inc = ~z;
                s_inm = 0;
                we3 = 0;
                wez = 0;
                op_alu = 3'b000;
            end

            6'b000011: begin // Salto condicional (a las condiciones z = 0)
                s_inc = z;
                s_inm = 0;
                we3 = 0;
                wez = 0;
                op_alu = 3'b000;
            end

            6'b0100??: begin // Carga de un valor inmediato en un registro
                s_inc = 1;
                s_inm = 1;
                we3 = 1;
                wez = 1;
                op_alu = 3'b000;
            end

            //ALU
            6'b1000??: begin// 3'b000: s = a
                op_alu = 3'b000;
                s_inc = 1;
                s_inm = 0;
                we3 = 1;
                wez = 1; 
            end

            6'b1001??: begin// 3'b001: s = ~a
                op_alu = 3'b001;
                s_inc = 1;
                s_inm = 0;
                we3 = 1;
                wez = 1; 
            end

            6'b1010??: begin// 3'b010: s = a + b;
                op_alu = 3'b010;
                s_inc = 1;
                s_inm = 0;
                we3 = 1;
                wez = 1; 
            end

            6'b1011??: begin// 3'b011: s = a - b;
                op_alu = 3'b011;
                s_inc = 1;
                s_inm = 0;
                we3 = 1;
                wez = 1; 
            end

            6'b1100??: begin// 3'b100: s = a & b;
                op_alu = 3'b100;
                s_inc = 1;
                s_inm = 0;
                we3 = 1;
                wez = 1; 
            end

            6'b1101??: begin// 3'b101: s = a | b;
                op_alu = 3'b101;
                s_inc = 1;
                s_inm = 0;
                we3 = 1;
                wez = 1; 
            end

            6'b1110??: begin// 3'b110: s = -a;
                op_alu = 3'b110;
                s_inc = 1;
                s_inm = 0;
                we3 = 1;
                wez = 1; 
            end
            
            6'b1111??: begin// 3'b111: s = -b;
                op_alu = 3'b111;
                s_inc = 1;
                s_inm = 0;
                we3 = 1;
                wez = 1; 
            end

            default: begin
                s_inc = 1;
                s_inm = 0;
                we3 = 0;
                wez = 0;
                op_alu = 3'b000;
            end
        endcase
    end
endmodule```