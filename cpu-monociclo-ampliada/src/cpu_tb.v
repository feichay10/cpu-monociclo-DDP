`timescale 1 ns / 10 ps

module cpu_tb;

reg clk, reset;

// generación de reloj clk
always //siempre activo, no hay condición de activación
begin
  clk = 1'b1;
  #30;
  clk = 1'b0;
  #30;
end

// instanciación del procesador
cpu micpu(clk, reset);

initial
begin
  $dumpfile("cpu_tb.vcd");
  $dumpvars;
  $dumpvars(0,cpu_tb.micpu.camino_datos.banco_registros.regb[1]);
  $dumpvars(0,cpu_tb.micpu.camino_datos.banco_registros.regb[2]);
  $dumpvars(0,cpu_tb.micpu.camino_datos.banco_registros.regb[3]);
  reset = 1;  //a partir del flanco de subida del reset empieza el funcionamiento normal
  #10;
  reset = 0;  //bajamos el reset 
end

initial

begin
  #(50*60);  //Esperamos 9 ciclos o 9 instrucciones
  $write ("R1 =%d\nR2 =%d =%d\n",
  cpu_tb.micpu.camino_datos.banco_registros.regb[1],
  cpu_tb.micpu.camino_datos.banco_registros.regb[2],
  cpu_tb.micpu.camino_datos.banco_registros.regb[3]);
  $finish;
end

endmodule