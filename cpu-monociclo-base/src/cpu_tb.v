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
  $dumpvars(0,cpu_tb.micpu.camino_datos.banco_registros.regb[4]);
  $dumpvars(0,cpu_tb.micpu.camino_datos.banco_registros.regb[5]);
  $dumpvars(0,cpu_tb.micpu.camino_datos.banco_registros.regb[6]);
  $dumpvars(0,cpu_tb.micpu.camino_datos.banco_registros.regb[7]);
  $dumpvars(0,cpu_tb.micpu.camino_datos.banco_registros.regb[8]);
  $dumpvars(0,cpu_tb.micpu.camino_datos.banco_registros.regb[9]);
  $dumpvars(0,cpu_tb.micpu.camino_datos.banco_registros.regb[10]);
  $dumpvars(0,cpu_tb.micpu.camino_datos.banco_registros.regb[11]);
  $dumpvars(0,cpu_tb.micpu.camino_datos.banco_registros.regb[12]);
  $dumpvars(0,cpu_tb.micpu.camino_datos.banco_registros.regb[13]);
  reset = 1;  //a partir del flanco de subida del reset empieza el funcionamiento normal
  #10;
  reset = 0;  //bajamos el reset 
end

initial

begin
  #(50*60);  //Esperamos 9 ciclos o 9 instrucciones
  $write ("R1 =%d\nR2 =%d\nR3 =%d\nR4 =%d\nR5 =%d\nR6 =%d\nR7 =%d\nR8 =%d\nR9 =%d\nR10 =%d\nR11 =%d\nR12 =%d\nR13 =%d\n",
  cpu_tb.micpu.camino_datos.banco_registros.regb[1],
  cpu_tb.micpu.camino_datos.banco_registros.regb[2],
  cpu_tb.micpu.camino_datos.banco_registros.regb[3],
  cpu_tb.micpu.camino_datos.banco_registros.regb[4],
  cpu_tb.micpu.camino_datos.banco_registros.regb[5],
  cpu_tb.micpu.camino_datos.banco_registros.regb[6],
  cpu_tb.micpu.camino_datos.banco_registros.regb[7],
  cpu_tb.micpu.camino_datos.banco_registros.regb[8],
  cpu_tb.micpu.camino_datos.banco_registros.regb[9],
  cpu_tb.micpu.camino_datos.banco_registros.regb[10],
  cpu_tb.micpu.camino_datos.banco_registros.regb[11],
  cpu_tb.micpu.camino_datos.banco_registros.regb[12],
  cpu_tb.micpu.camino_datos.banco_registros.regb[13]);
  $finish;
end

endmodule