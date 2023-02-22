/**
 *
 * Universidad de La Laguna
 * Escuela Superior de Ingeniería y Tecnología
 * Grado en Ingeniería Informática
 * Asignatura: Diseño de Procesadores
 * Curso: 3º
 * Proyecto 1: Diseño de la unidad de control de una CPU simple de un solo ciclo
 * @file memprog.v
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

//Memoria de programa, se inicializa y no se modifica

module memprog(input  wire        clk,
               input  wire [9:0]  a,
               output wire [15:0] rd);

  reg [15:0] mem[0:1023]; //memoria de 1024 palabras de 16 bits de ancho

  initial
  begin
    $readmemb("progfile.dat", mem); // inicializa la memoria del fichero en texto binario
  end
  
  assign rd = mem[a];

endmodule


