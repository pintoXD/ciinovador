module cod_paridade(
    input EN,
    input [7:0] A,
    output reg [8:0] Q
);
    //assign Q[7:0] = A[7:0];
    //assign Q[8] = *(A[7:9]);
    always_comb
        begin
            if (EN==1'b1) // if (EN)
                begin
                    Q = A;
                    Q[8] = ^(A[7:0]);
                end
            else
                begin
                    Q = 'd0;
                end
    end
endmodule