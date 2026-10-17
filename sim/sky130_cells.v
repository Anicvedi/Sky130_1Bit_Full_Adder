`timescale 1ns / 1ps

// Behavioral simulation model for Sky130 3-input XOR
module sky130_fd_sc_hd__xor3_1 (
    input  wire A,
    input  wire B,
    input  wire C,
    output wire X
);
    assign X = A ^ B ^ C;
endmodule

// Behavioral simulation model for Sky130 3-input Majority Gate
module sky130_fd_sc_hd__maj3_1 (
    input  wire A,
    input  wire B,
    input  wire C,
    output wire X
);
    assign X = (A & B) | (B & C) | (A & C);
endmodule
