module cpu(input wire clk, reset);
//Procesador sin memoria de datos de un solo ciclo
wire s_inc, s_inm, we3, wez, push, s_stack_mux, s_mux_alu, s_mux_datos, oe, z;
wire [2:0] op_alu;
wire [5:0] opcode;
wire [15:0] datos, direcciones;

//Camino de datos
cd camino_datos(clk, reset, s_inc, s_inm, we3, wez, push, pop, s_stack_mux, s_mux_alu, oe, datos, op_alu, z, opcode, direcciones);

//Unidad de Control
uc unidad_control(opcode, z, s_inc, s_inm, we3, wez, s_stack_mux, push, pop, op_alu);

endmodule
