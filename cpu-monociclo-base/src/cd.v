/**
 *
 * Universidad de La Laguna
 * Escuela Superior de Ingeniería y Tecnología
 * Grado en Ingeniería Informática
 * Asignatura: Diseño de Procesadores
 * Curso: 3º
 * Proyecto 1: Diseño de la unidad de control de una CPU simple de un solo ciclo
 * @file cd.v
 * @author Cheuk Kelly Ng Pante (alu0101364544@ull.edu.es)
 * @brief 
 * @version 0.1
 * @date 01-02-2023
 * @compilation: iverilog -o cpu_base cpu_tb.v alu.v cd.v componentes.v cpu.v memprog.v uc.v
 * @simulation: vvp cpu_base
 *
 * @copyright Copyright (c) 2023
 *
 */

module cd(input wire clk, reset, s_inc, s_inm, we3, wez, input wire [2:0] op_alu, output wire z, output wire [5:0] opcode);
//Camino de datos de instrucciones de un solo ciclo
wire [15:0] instruccion;
wire [9:0] SalMuxInc_EntPC, SalPC, SalSum_EntMuxInc, Mux_EntBR;
wire [7:0] Reg1, Reg2, SalALU, SalMuxInm_EntBR;
wire alu_ffz;

// Program Counter: 
registro #(10) PC (clk, reset, SalMuxInc_EntPC, SalPC);

// Memoria de Programa
memprog Memoria (clk, SalPC, instruccion);

// Sumador A 
sum Sumador(SalPC, 10'b0000000001, SalSum_EntMuxInc);

// Multiplexor Inc
mux2 #(10) MuxInc(instruccion[9:0], SalSum_EntMuxInc, s_inc, SalMuxInc_EntPC);

// Banco de registros
regfile BancoReg(clk, we3, instruccion[11:8], instruccion[7:4], instruccion[3:0], SalMuxInm_EntBR, Reg1, Reg2);

// ALU
alu ALU (Reg1, Reg2, op_alu, SalALU, alu_ffz);

// Multiplexor Inm
mux2 #(8) MuxInm (SalALU, instruccion[11:4], s_inm, SalMuxInm_EntBR);

// Flip-Flop Z
ffd FFZ (clk, reset, alu_ffz, wez, z);

assign opcode = instruccion[15:10];

endmodule
