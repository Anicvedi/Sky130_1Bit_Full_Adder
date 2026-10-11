`timescale 1ns / 1ps
// =============================================================================
// Module: full_adder (1-bit Full Adder)
// Description: Standard combinational 1-bit full adder with Sum and Carry outputs
// =============================================================================

module full_adder (
    input  wire a,
    input  wire b,
    input  wire cin,
    output wire sum,
    output wire cout
);

    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));

endmodule
