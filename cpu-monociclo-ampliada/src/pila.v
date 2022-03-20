module pila (input wire clk, reset, push, pop, input wire [9:0] d, output wire [9:0] out);

reg [9:0] sp;
reg [9:0] stack_mem[0:63]; //memoria de 64 palabras de 10 bits de ancho

initial begin
    sp[9:0] <= 8'b0;
end

always @(posedge clk, reset)
begin
    if(push == 1'b1)
    begin
        sp <= sp + 64'b1;
        stack_mem[sp + 64'b1] <= d + 10'b1;
    end    

    if(pop == 1'b1)
    begin
        sp <= sp - 64'b1;
    end
end

assign out = stack_mem[sp];

endmodule

