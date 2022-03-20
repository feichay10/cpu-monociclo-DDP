module transceiver(input wire clk, reset, oe, input wire [15:0] in, output wire [15:0] out, inout wire [15:0] bidir);
    assign bidir = oe ? in : 16'bz;
    assign out = bidir;
endmodule