`timescale 1ns/10ps

//D-flip-flop with reset
module dff_r(
    input d, clk, rst,
    output reg q, nq );

    always @(negedge clk or posedge rst) begin
        if (rst == 1) begin
            q = 0;
            nq = 1;
        end
        else begin
            q = d;
            nq = ~d;
        end
    end
endmodule

module tb_dff_r;
    reg d, clk, rst;
    wire q, nq;

    dff_r dff1(d, clk, rst, q, nq);

    initial begin
        $dumpfile(`DUMPFILE);
        $dumpvars(1, tb_dff_r);
            d = 0;
            clk = 0;
        #25 d = 1;
        #7  d = 0;
        #7  d = 1;
        #12 d = 0;
        #30 $finish;
    end
    
    initial fork
            rst = 0;
        #1  rst = 1;
        #4  rst = 0;
        #55 rst = 1;
        #56  rst = 0;
    join

    always begin
       #10 clk = ~clk; 
    end
endmodule