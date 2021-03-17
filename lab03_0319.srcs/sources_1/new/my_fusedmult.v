module my_fusedmult #(
        parameter BITWIDTH = 32
    )
   (
        input [BITWIDTH-1:0] ain,
        input [BITWIDTH-1:0] bin,
        input en,
        input clk,
        output [2*BITWIDTH-1:0] dout
    );
    
    reg [2*BITWIDTH-1:0] acc;
    wire [2*BITWIDTH-1:0] tempMult;
    wire [2*BITWIDTH-1:0] tempAdd;
    
    
    
    always @(posedge clk) begin
        if(en == 1) begin
            acc = tempAdd;
        end
        else begin
            acc = 0;
        end
    end
    
    my_mul #(.BITWIDTH(BITWIDTH)) mult(.ain(ain),.bin(bin),.dout(tempMult));
    my_add #(.BITWIDTH(BITWIDTH)) add(.ain(acc),.bin(tempMult),.dout(tempAdd),.overflow());
    assign dout = acc;
    
endmodule