`timescale 1ns/10ps

module dffs(
        input c, d, s,
        output reg q, nq);

        always @ (negedge c or posedge s) begin
            if(s == 1) begin
                q = 1;
                nq = 0;
            end
            else begin
                q = d;
                nq = ~d;
            end
        end

endmodule

module counter_struct(
            input c, ec, r,
            output [3:0] q);

    wire nr_int;
    wire nc_int;
    wire nec_int;
    wire ncornec_int;
    wire c0_int;
    wire c1_int;
    wire c2_int;
    wire c3_int;
    wire nq0_int;
    wire nq1_int;
    wire nq2_int;
    wire nq3_int;
    wire q0_int;
    wire q1_int;
    wire q2_int;
    wire q3_int;
    wire not1_q0_int;
    //wire not2_q0_int;
    wire not1_q1_int;
    //wire not2_q1_int;
    wire not1_q2_int;
    //wire not2_q2_int;
    wire not1_q3_int;
    //wire not2_q3_int;

    not(nr_int, r);
    not(nc_int, c);
    not(nec_int, ec);
    or(ncornec_int, nec_int, nc_int);

    not(not1_q0_int, q0_int);
    not(not1_q1_int, q1_int);
    not(not1_q2_int, q2_int);
    not(not1_q3_int, q3_int);
    not(q[0], not1_q0_int);
    not(q[1], not1_q1_int);
    not(q[2], not1_q2_int);
    not(q[3], not1_q3_int);

    not(c0_int, ncornec_int);
    dffs dff0(c0_int, nq0_int, nr_int, q0_int, nq0_int);

    nor(c1_int, nq0_int, ncornec_int);
    dffs dff1(c1_int, nq1_int, nr_int, q1_int, nq1_int);

    nor(c2_int, nq0_int, nq1_int, ncornec_int);
    dffs dff2(c2_int, nq2_int, nr_int, q2_int, nq2_int);

    nor(c3_int, nq0_int, nq1_int, nq2_int, ncornec_int);
    dffs dff3(c3_int, nq3_int, nr_int, q3_int, nq3_int);


endmodule