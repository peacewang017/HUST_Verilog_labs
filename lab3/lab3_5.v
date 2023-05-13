module decoder(in , out)
    input [2:0] in;
    output reg [7:0] out;

    always@(in) begin
        case(in)
            3'b000 : out[7:0] = 8'b11111110;
            3'b001 : out[7:0] = 8'b11111101;
            3'b010 : out[7:0] = 8'b11111011;
            3'b011 : out[7:0] = 8'b11110111;
            3'b100 : out[7:0] = 8'b11101111;
            3'b101 : out[7:0] = 8'b11011111;
            3'b110 : out[7:0] = 8'b10111111;
            default : out[7:0] = 8'b01111111;
        endcase
    end`
endmodule

module selector(in , out)
    input [3:0] in;
    output reg [15:0] out;

    always@(in) begin
        case(in)
            4'b0000 : out[7:0] = 8'b11000000;
            4'b0001 : out[7:0] = 8'b11111001;
            4'b0010 : out[7:0] = 8'b10100100;
            4'b0011 : out[7:0] = 8'b10110000;
            4'b0100 : out[7:0] = 8'b10011001;
            4'b0101 : out[7:0] = 8'b10010010;
            4'b0110 : out[7:0] = 8'b10000010;
            4'b0111 : out[7:0] = 8'b11111000;
            4'b1000 : out[7:0] = 8'b10000000;
            4'b1001 : out[7:0] = 8'b10011000;
            4'b1010 : out[7:0] = 8'b10001000;
            4'b1011 : out[7:0] = 8'b10000011;
            4'b1100 : out[7:0] = 8'b11000110;
            4'b1101 : out[7:0] = 8'b10100001;
            4'b1110 : out[7:0] = 8'b10000110;
            default : out[7:0] = 8'b10001110;
        endcase
    end
endmodule