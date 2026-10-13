`timescale 1ns / 1ps

module tb_full_adder;
    reg a, b, cin;
    wire sum, cout;
    integer errors = 0;
    integer i;

    full_adder dut (
        .a(a), .b(b), .cin(cin),
        .sum(sum), .cout(cout)
    );

    initial begin
        $dumpfile("sim/full_adder.vcd");
        $dumpvars(0, tb_full_adder);

        $display("==================================================");
        $display(" 1-Bit Full Adder: Exhaustive Functional Verification");
        $display("==================================================");
        $display(" A  B  Cin | Sum Cout | Expected | Status");
        $display("-----------+----------+----------+--------");

        for (i = 0; i < 8; i = i + 1) begin
            {a, b, cin} = i[2:0];
            #10;
            if ({cout, sum} !== (a + b + cin)) begin
                $display(" %b  %b   %b  |  %b    %b   |   %b   %b   | FAIL", 
                         a, b, cin, sum, cout, (a+b+cin)%2, (a+b+cin)/2);
                errors = errors + 1;
            end else begin
                $display(" %b  %b   %b  |  %b    %b   |   %b   %b   | PASS", 
                         a, b, cin, sum, cout, (a+b+cin)%2, (a+b+cin)/2);
            end
        end

        $display("==================================================");
        if (errors == 0)
            $display("[SUCCESS] All 8 test vectors PASSED (100%% Functional Coverage)");
        else
            $display("[FAILURE] %0d vectors failed!", errors);
        $display("==================================================");
        $finish;
    end
endmodule
