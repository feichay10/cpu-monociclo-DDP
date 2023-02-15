/**
 *
 * Universidad de La Laguna
 * Escuela Superior de Ingeniería y Tecnología
 * Grado en Ingeniería Informática
 * Asignatura: Diseño de Procesadores
 * Curso: 3º
 * Proyecto 1: Diseño de la unidad de control de una CPU simple de un solo ciclo
 * @file cpu.v
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

module cpu(input wire clk, reset);
//Procesador sin memoria de datos de un solo ciclo
wire s_inc, s_inm, we3, wez, z;
wire [2:0] op_alu;
wire [5:0] opcode;

//Camino de datos
cd camino_datos(clk, reset, s_inc, s_inm, we3, wez, op_alu, z, opcode);

//Unidad de Control
uc unidad_control(opcode, z, s_inc, s_inm, we3, wez, op_alu);

endmodule
