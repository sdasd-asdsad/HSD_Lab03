module my_add #(
        parameter BITWIDTH = 32
    )
   (
        input [BITWIDTH-1:0] ain,
        input [BITWIDTH-1:0] bin,
        output [BITWIDTH-1:0] dout,
        output overflow
   );
   
   reg carry = 1'b0;
   reg [BITWIDTH-1:0] temp_dout;
   integer i;
   
   always @(*) begin
        carry = 1'b0
        for (i=0;i<BITWIDTH;i=i+1)
            begin
            temp_dout[i] = (ain[i] ^ bin[i] ^ carry);
            carry = (ain[i] & bin[i])|(ain[i] & carry)|(bin[i] & carry);
        end
   end
     
   assign overflow = carry;
   assign dout = temp_dout;
   
endmodule
