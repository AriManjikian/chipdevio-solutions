// Medium
// Prompt
// A Linear-Feedback Shift Register (LFSR) is a type a of shift-register that can generate a pseudo-random stream of binary words.  The shift-register is configured in a ring fashion as shown in Fig. 1.  A feedback loop is created by XOR-ing the ouputs of specific stages (also known as taps) of the shift-register and connecting them to the input of its first stage.
// Fibonacci LFSR
// Fig. 1. Fibonacci LFSR (source: https://en.wikipedia.org/wiki/Linear-feedback_shift_register).
// In this question, implement a LFSR that can produce a pseudorandom sequence of DATA_WIDTH-bit output words. The inputs to the module are din, which is the initial value written to the shift-register upon reset, tap, which is a DATA_WIDTH-bit word corresponding to the feedback polynomial to the LFSR, and resetn, which resets the shift-register. In Fig. 1, tap = 16'b1011_0100_0000_0000 because the XOR inputs are coming from outputs of stages 16, 14, 13, and 11. That is, the position of the one bits in tap determines the inputs to the XOR tree. Assume the input tap is buffered/registered inside the module.
// Input and Output Signals
// clk - Clock signal
// resetn - Synchronous, active low, reset signal
// din - Input data (initial data input value, e.g. 8'b0000_0001)
// tap - Input tap (feedback polynomial, e.g. 8'b1011_0101)
// dout - Output data
// Output signals during reset
// dout - 1

module model (
    input clk,
    input resetn,
    input [7:0] din,
    input [7:0] tap,
    output [7:0] dout
);
  logic feedback;
  logic [7:0] regs;
  logic [7:0] reg_tap;

  always_ff @(posedge clk) begin
    if (!resetn) begin
      regs <= din;
      reg_tap <= tap;
    end else begin
      reg_tap <= tap;
      regs <= {regs[6:0], feedback};
    end
  end

  assign feedback = ^(regs & reg_tap);
  assign dout = regs;
endmodule
