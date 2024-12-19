/*
    This module instatiates the comp_endereco that is used to translate the
    X states to Z states and outputs another 8-bit word with the location of the
    bit that should be sent as an F-bit.

    That way, this moudle receives an 8-bit address word with any X states and 
    translates it, usign the comp_endereco module, to a word with Z states.

    A second word is generated with the location of the F bits.

    I.e. 1: Input: 8'b101010zz -> Output: 8'b101010xx
                                          8'b00000011
    
    I.e. 2: Input: 8'bz1111z11 -> Output: 8'bx1111x11
                                          8'b10000100
    

*/

`timescale 1us/1ns
module ADDRESS_INTERPRETER(
    input logic [7:0] A,
    output logic [7:0] INTERPRETED_ADDR, F_BIT_LOCATOR
);

comp_endereco comp_endereco(
    .A(A),
    .A_01(INTERPRETED_ADDR),
    .A_F(F_BIT_LOCATOR)
);

endmodule