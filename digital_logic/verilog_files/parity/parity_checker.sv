module cod_paridade(
    input logic ENP,
    input logic ENV,
    input logic [7:0] A,
    input logic P,
    output logic E,
    output logic [8:0] Q
);
    //assign Q[7:0] = A[7:0];
    //assign Q[8] = *(A[7:9]);
    logic mid_parity;

    always_comb
        begin
            if (ENP==1'b1) // if (EN)
                begin
                    Q = A;
                    // Q[8] = ^(A[7:0]);
                    mid_parity = ^(A[7:0]);
                    Q[8] = mid_parity;
                    if (ENV==1'b1) // if (EN)
                        begin
                            E = mid_parity ^ P; //check if given parity is equal to the computed parity.
                        end
                    else
                        begin
                            E = 'd0;
                        end
                end
            else
                begin
                    Q = 'd0;
                end
    end
endmodule