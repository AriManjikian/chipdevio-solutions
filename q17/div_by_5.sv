// Medium
// Prompt
// Design a module that determines whether an input value is evenly divisible by five.
//
// The input value is of unknown length and is left-shifted one bit at a time into the module via the input (din). The module should output a 1 on the output (dout) if the current cumulative value is evenly divisible by five and a 0 otherwise.
//
// When resetn is asserted, all previous bits seen on the input are no longer considered. The 0 seen during reset should not be included when calculating the next value.
//
// This problem is tricky, so it may help to think in terms of modulus and remainder states.
//
// Input and Output Signals
// clk - Clock signal
// resetn - Synchronous reset-low signal
// din - Input bit
// dout - 1 if the current value is divisible by 5, 0 otherwise.
// Output signals during reset
// dout - 0 when resetn is active

module model (
    input clk,
    input resetn,
    input din,
    output logic dout
);

  typedef enum {
    RESET,
    MOD0,
    MOD1,
    MOD2,
    MOD3,
    MOD4
  } states_t;

  states_t state;

  always_ff @(posedge clk) begin
    if (~resetn) begin
      state <= RESET;
    end else begin
      case (state)
        RESET: state <= din ? MOD1 : MOD0;
        MOD0: state <= din ? MOD1 : MOD0;
        MOD1: state <= din ? MOD3 : MOD2;
        MOD2: state <= din ? MOD0 : MOD4;
        MOD3: state <= din ? MOD2 : MOD1;
        MOD4: state <= din ? MOD4 : MOD3;
        default: state <= RESET;
      endcase
    end
  end

  assign dout = state == MOD0;
endmodule
