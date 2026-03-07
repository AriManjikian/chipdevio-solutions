// Easy
// Prompt
// Reverse the bits of an input value's binary representation.
// Input and Output Signals
// din - Input value
// dout - Bitwise reversed value

module model #(
    parameter DATA_WIDTH = 32
) (
    input [DATA_WIDTH-1:0] din,
    output logic [DATA_WIDTH-1:0] dout
);

  genvar i;
  for (i = 0; i < DATA_WIDTH; i = i + 1) begin
    assign dout[i] = din[DATA_WIDTH-1-i];
  end

  // simple solution:
  // assign dout = {<<{din}};

endmodule
