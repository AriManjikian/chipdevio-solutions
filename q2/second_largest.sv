// Easy
// Prompt
// Given a clocked sequence of unsigned values, output the second-largest value seen so far in the sequence. If only one value is seen, then the output (dout) should equal 0. Note that repeated values are treated as separate candidates for being the second largest value.
// When the reset-low signal (resetn) goes low, all previous values seen in the input sequence should no longer be considered for the calculation of the second largest value, and the output dout should restart from 0 on the next cycle.
// Input and Output Signals
// clk - Clock signal
// resetn - Synchronous reset-low signal
// din - Input data sequence
// dout - Second-largest value seen so far
// Output signals during reset
// dout - 0 when resetn is active

module model #(
    parameter DATA_WIDTH = 32
) (
    input clk,
    input resetn,
    input [DATA_WIDTH-1:0] din,
    output logic [DATA_WIDTH-1:0] dout
);

  reg [DATA_WIDTH-1:0] r_largest, r_second_largest = 1'hx;
  always_ff @(posedge clk) begin
    if (!resetn) begin
      r_largest <= 0;
      r_second_largest <= 0;
    end else begin
      if (r_largest == 1'hx) begin
        r_largest <= din;
      end else begin
        if (din > r_largest) begin
          r_second_largest <= r_largest;
          r_largest <= din;
        end else if (din > r_second_largest) begin
          r_second_largest <= din;
        end
      end
    end
  end

  assign dout = r_second_largest;
endmodule
