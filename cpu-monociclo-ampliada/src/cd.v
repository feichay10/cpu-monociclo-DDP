module cd(input wire clk, reset, s_inc, s_inm, we3, wez, push, pop, s_stack_mux, s_mux_alu, oe, inout wire [15:0] datos, input wire [2:0] op_alu, output wire z, output wire [5:0] opcode, output wire [15:0] direcciones);
//Camino de datos de instrucciones de un solo ciclo
wire [31:0] instruccion;
wire [9:0] Mux_toPC, SalPC, SalSum_toMuxStack, SalMux_toMux, SalStack_toMux;
wire [15:0] R1, R2, SalMux_toALU, SalALU, Trans_toMux, Mux_Sal_toBR;
wire alu_ffdz;

// Program Counter: 
registro #(10) PC (clk, reset, Mux_toPC, SalPC);

// Memoria de Programa
memprog memoria(clk, SalPC, instruccion);

// Sumador 
sum sumador(10'b0000000001, SalPC, SalSum_toMuxStack);

// Multiplexor, Salida de sumador a mux y pila
mux2 #(10) Sumto_multiplexor (instruccion[9:0], SalSum_toMuxStack, s_inc, SalMux_toMux);

// Pila
pila stack(clk, reset, push, pop, SalSum_toMuxStack, SalStack_toMux);

// Multiplexor, Mux a PC
mux2 #(10) multiplexor_toPC (SalStack_toMux, SalMux_toMux, s_stack_mux, Mux_toPC);

// Banco de registros
regfile banco_registros(clk, we3, instruccion[25:22], instruccion[21:18], instruccion[17:14], Mux_Sal_toBR, R1, R2);

// Multiplexor, Mux de entrada a ALU
mux2 mux_toALU(instruccion[15:0], R1, s_mux_alu, SalMux_toALU);

// ALU
alu alu_cpu(SalMux_toALU, R2, op_alu, SalALU, alu_ffdz);

// Multiplexor, ALU a Mux_Inm
mux2 mux_Inm(SalALU, Trans_toMux, s_inm, Mux_Sal_toBR);

// Flip-Flop Z
ffd ffz(clk, reset, alu_ffz, wez, z);

// Transceiver
transceiver transc(clk, reset, oe, R1, Trans_toMux, datos);

assign opcode = instruccion[31:26];

endmodule
