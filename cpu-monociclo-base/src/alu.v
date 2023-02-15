/**
 *
 * Universidad de La Laguna
 * Escuela Superior de Ingeniería y Tecnología
 * Grado en Ingeniería Informática
 * Asignatura: Diseño de Procesadores
 * Curso: 3º
 * Proyecto 1: Diseño de la unidad de control de una CPU simple de un solo ciclo
 * @file alu.v
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

module alu(input wire [7:0] a, b,
           input wire [2:0] op_alu,
           output wire [7:0] y,
           output wire zero);
           
reg [7:0] s;		   
		   
always @(a, b, op_alu)
begin
  case (op_alu)              
    3'b000: s = a;
    3'b001: s = ~a;
    3'b010: s = a + b;
    3'b011: s = a - b;
    3'b100: s = a & b;
    3'b101: s = a | b;
    3'b110: s = -a;
    3'b111: s = -b;
	default: s = 'bx; //desconocido en cualquier otro caso (x � z), por si se modifica el c�digo
  endcase
end

assign y = s;

//Calculo del flag de cero
assign zero = ~(|y);   //operador de reducci�n |y hace la or de los bits del vector 'y' y devuelve 1 bit resultado
		   
endmodule
