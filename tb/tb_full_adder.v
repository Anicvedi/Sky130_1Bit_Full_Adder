`timescale 1ns / 1ps

module tb_full_adder;
    reg a, b, cin;
    wire sum, cout;

    full_adder dut (
        .a(a), .b(b), .cin(cin),
        .sum(sum), .cout(cout)
    );

    initial begin
        a = 0; b = 0; cin = 0;
        #10 a = 1;
        #10 b = 1;
        #10 cin = 1;
        #10 $finish;
    end
endmodule
