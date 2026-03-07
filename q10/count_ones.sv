// Easy
// Prompt
// Given an input binary value, output the number of bits that are equal to 1.
// Input and Output Signals
// din - Input value
// dout - Number of 1's in the input value

module model #(
    parameter DATA_WIDTH = 16
) (
    input [DATA_WIDTH-1:0] din,
    output logic [$clog2(DATA_WIDTH):0] dout
);

  logic [$clog2(DATA_WIDTH):0] count = 0;
  int i;

  always_comb begin
    for (i = 0; i < DATA_WIDTH; i = i + 1) begin : g_count_ones
      count = count + din[i];
    end
  end

  assign dout = count;

endmodule
