`timescale 1ns/10ps

module tb_inv;
    reg x;
    wire y_inv, y_inv_delay;

    inverter_delay id1(x, y_inv_delay);
    inverter       i1(x, y_inv);

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1, tb_inv);
            x = 0;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 $finish;
    end
endmodule