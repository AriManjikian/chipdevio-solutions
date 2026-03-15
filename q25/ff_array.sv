module model (
    input [7:0] din,
    input [2:0] addr,
    input wr,
    input rd,
    input clk,
    input resetn,
    output logic [7:0] dout,
    output logic error
);

  parameter WORD_LENGTH = 8;
  parameter ENTRY_COUNT = 8;

  logic [WORD_LENGTH-1:0] regs[ENTRY_COUNT];
  integer i;

  always_ff @(posedge clk) begin
    if (~resetn) begin
      dout  <= 'x;
      error <= 'x;
      for (i = 0; i < ENTRY_COUNT; i = i + 1) begin
        regs[i] <= 0;
      end
    end else if (rd & wr) begin
      error <= 1;
      dout  <= 0;
    end else begin
      error <= 0;
      if (rd) begin
        dout <= regs[addr];
      end else if (wr) begin
        regs[addr] <= din;
        dout <= 0;
      end else begin
        dout <= 0;
      end
    end
  end

endmodule
