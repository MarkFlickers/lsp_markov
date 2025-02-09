`timescale 1ns/1ns

module nand2 (
    input x1, x2,
    output y    );
    
    assign y = ~(x1 & x2);
endmodule

module nand2_tb;
    reg x1, x2;
    wire y;

    nand2 nand2(x1, x2, y);

    initial begin
        $dumpfile(`DUMPFILE);
        $dumpvars(1, nand2_tb);
            x1 = 0;
            x2 = 0;
        #10 x1 = 1;
        #10 x1 = 0;
            x2 = 1;
        #10 x1 = 1;
            x2 = 1;
        #10 x1 = 0;
            x2 = 0;
        #10 $finish;
    end
endmodule