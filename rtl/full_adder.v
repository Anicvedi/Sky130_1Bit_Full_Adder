`timescale 1ns / 1ps
// =============================================================================
// Module: full_adder (1-bit Full Adder)
// Description: High-speed full adder with explicit Carry-Generate and Propagate
// =============================================================================

module full_adder (
    input  wire a,
    input  wire b,
    input  wire cin,
    output wire sum,
    output wire cout
);

    // Internal Generate (G) and Propagate (P) signals
    wire p = a ^ b;
    wire g = a & b;

    assign sum  = p ^ cin;
    assign cout = g | (p & cin);

endmodule
