module counter(clk, out);
input clk;                    // 计数时钟
output reg [2:0] out;             // 计数值

always @(posedge clk)  begin  // 在时钟上升沿计数器加1
    out <= out+1;
end                           
endmodule
