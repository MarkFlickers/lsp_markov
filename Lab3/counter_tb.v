`timescale 1ns/10ps

module counter_tb;
    reg c, ec, r;
    wire [3:0] q_beh;
    wire [3:0] q_str;

    integer ec_en = 0;

    counter_behav cnb_b(c, ec, r, q_beh);
    counter_struct cnb_s(c, ec, r, q_str);

    initial begin
        $dumpfile(`DUMPFILE);
        $dumpvars(1, counter_tb);
        c = 0;
        ec = 0;
        r = 1;

        #5  r = 0;
        #2  r = 1;

        #58 ec = 1;
        #70 ec_en = 1;

        //#500 $finish;
    end

    always
        if(ec_en == 1) begin
            #2  ec = 1;
            #8  ec = 0;
        end
        else
            #5 ec = ec;

    always
        #10 c = ~c;

    initial begin
        #565 $finish;
    end


endmodule