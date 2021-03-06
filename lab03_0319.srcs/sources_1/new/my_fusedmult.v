module my_fusedmult #(
        parameter BITWIDTH = 32
    )
   (
        input [BITWIDTH-1:0] ain,
        input [BITWIDTH-1:0] bin,
        input en,
        input clk,
        output reg [2*BITWIDTH-1:0] dout
    );
    
    wire [2*BITWIDTH-1:0] tempMult;
    wire [2*BITWIDTH-1:0] tempAdd;
    
    always @(posedge clk) begin
        if(en == 1) begin
            dout = tempAdd;
        end
        else begin
            dout = 0;
        end
    end
    
    my_mul #(.BITWIDTH(BITWIDTH)) mult(.ain(ain),.bin(bin),.dout(tempMult));
    my_add #(.BITWIDTH(2*BITWIDTH)) add(.ain(dout),.bin(tempMult),.dout(tempAdd),.overflow());
    
endmodule