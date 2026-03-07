// Medium
// Prompt
// Divide an input number by a power of two and round the result to the nearest integer. The power of two is calculated using 2DIV_LOG2 where DIV_LOG2 is a module parameter. Remainders of 0.5 or greater should be rounded up to the nearest integer. If the output were to overflow, then the result should be saturated instead.
// Input and Output Signals
// din - Input number
// dout - Rounded result
module model #(
    parameter DIV_LOG2 = 3,
    OUT_WIDTH = 32,
    IN_WIDTH = OUT_WIDTH + DIV_LOG2
) (
    input [IN_WIDTH-1:0] din,
    output logic [OUT_WIDTH-1:0] dout
);

  always_comb begin
    dout = din[IN_WIDTH-1:DIV_LOG2];
    if (din[DIV_LOG2-1]) begin
      if (dout != {OUT_WIDTH{1'b1}}) dout = dout + 1;
    end
  end

endmodule
