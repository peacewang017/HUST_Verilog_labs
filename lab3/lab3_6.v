module dynamic_scan(clk,  SEG, AN);
    input clk;              // 系统时钟
    output [7:0] SEG;  		// 分别对应CA、CB、CC、CD、CE、CF、CG和DP
    output [7:0] AN;        // 8位数码管片选信号

    wire clk_N;
    wire [2:0] num;
    wire [3:0] code;
    
    divider(.clk(clk) , .clk_N(clk_N));
    counter(.clk(clk_N) , .out(num[2:0]));
    decoder(.in(num[2:0]) , .out(AN[7:0]));
    rom8x4(.addr(num[2:0] , .data(code[3:0])));
    selector(.in(code[3:0]) , .out(SEG[7:0]);)
endmodule
