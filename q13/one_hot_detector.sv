// Easy
// Prompt
// One-hot values have a single bit that is a 1 with all other bits being 0. Output a 1 if the input (din) is a one-hot value, and output a 0 otherwise.
// Input and Output Signals
// din - Input value
// onehot - 1 if the input is a one-hot value and 0 otherwise
module model #(
    parameter DATA_WIDTH = 32
) (
    input [DATA_WIDTH-1:0] din,
    output logic onehot
);

  logic [DATA_WIDTH-1:0] count = 0;
  always_comb begin
    count = 0;
    for (int i = 0; i < DATA_WIDTH; i++) begin
      count = count + din[i];
    end
  end

  assign onehot = count == 1;


  // single-line solution:
  // assign onehot = (din) && !(din & (din - 1));
  // (din) takes care of 0 as an input
  // din & din-1 is 0 only when we have a one-hot input (clears lowest set bit)
  // example:
  // din = 10010000
  // din-1 = 10001111
  // din & din-1 = 10000000
endmodule
