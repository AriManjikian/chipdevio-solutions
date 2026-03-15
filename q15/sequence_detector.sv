// Easy
// Prompt
// Given a stream of input bits, pulse a 1 on the output (dout) whenever a b1010 sequence is detected on the input (din).
// When the reset-low signal (resetn) goes active, all previously seen bits on the input are no longer considered when searching for b1010.
// Input and Output Signals
// clk - Clock signal
// resetn - Synchronous reset-low signal
// din - Input bits
// dout - 1 if a b1010 was detected, 0 otherwise
// Output signals during reset
// dout - 0 when resetn is active
module model (
    input clk,
    input resetn,
    input din,
    output logic dout
);

  logic [3:0] seq;
  always_ff @(posedge clk) begin
    if (~resetn) begin
      seq <= 4'b0000;
    end else begin
      seq <= (seq << 1) + din;
    end
  end

  assign dout = seq == 4'b1010;
endmodule
