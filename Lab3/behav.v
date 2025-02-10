`timescale 1ns/10ps

module counter_behav(
            input c, ec, r,
            output reg [3:0] q);

    always @(negedge c or negedge ec or negedge r) begin
        if(r == 0)
            q = 4'b1111;
        else begin
            if(ec == 1 || c == 1)
                q <= q + 1;
            else
                q <= q;
        end
    end

endmodule