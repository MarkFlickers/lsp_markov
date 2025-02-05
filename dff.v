`timescale 1ns/10ps

//D-flip-flop
module dff(
    input d, clk,
    output reg q, 
    output nq   );

    assign nq = ~q;

    always @(negedge clk) begin
        q = d;
    end
endmodule

module tb_dff;
    reg d, clk;
    wire q, nq;

    dff dff1(d, clk, q, nq);

    initial begin
        $dumpfile("tb_dff.vcd");
        $dumpvars(1, tb_dff);
        d = 0;
        clk = 0;
        #25 d = 1;
        #7 d = 0;
        #7 d = 1;
        #12 d = 0;
        #30 $finish;
    end

    always begin
       #10 clk = ~clk; 
    end
endmodule