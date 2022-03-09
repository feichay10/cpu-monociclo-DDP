module cd(input wire clk, reset, s_inc, s_inm, we3, wez, input wire [2:0] op_alu, output wire z, output wire [5:0] opcode);
//Camino de datos de instrucciones de un solo ciclo
wire [15:0] instruccion;
wire [9:0] Mux_EntPC, SalPC, sum_mux, Mux_EntBR;
wire [7:0] R1, R2, Sal_alu, Mux_Sal_toBR;
wire alu_ffz;

// Program Counter: como lo hago? #(parameter WIDTH = 8)????
registro #(10) PC (clk, reset, Mux_EntPC, SalPC);

// Memoria de Programa
memprog memoria(clk, SalPC, instruccion);

// Sumador A 
sum sumador_A(SalPC, 10'b0000000001, sum_mux);

// Multiplexor A 
mux2 #(10) multiplexor_A (instruccion[9:0], sum_mux, s_inc, Mux_EntPC);

// Banco de registros
regfile banco_registros(clk, we3, instruccion[11:8], instruccion[7:4], instruccion[3:0], Mux_Sal_toBR, R1, R2);

// ALU
alu alu_cpu(R1, R2, op_alu, Sal_alu, alu_ffz);

// Multiplexor B 
mux2 #(8) multiplexor_B (Sal_alu, instruccion[11:4], s_inm, Mux_Sal_toBR);

// Flip-Flop Z
ffd ffz(clk, reset, alu_ffz, wez, z);

assign opcode = instruccion[15:10];

endmodule
