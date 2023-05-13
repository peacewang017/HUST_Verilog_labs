`timescale 1ns / 1ps

module fsm_controller(clk,rst,start,next_zero, LD_SUM, LD_NEXT, SUM_SEL, NEXT_SEL, A_SEL, DONE);
  input clk,rst,start,next_zero;
  output reg LD_SUM,LD_NEXT,SUM_SEL,NEXT_SEL,A_SEL,DONE;
  reg [1:0] state;
  parameter START = 2'b00;
  parameter COMPUTE_SUM = 2'b01;
  parameter GET_NEXT = 2'b10;
  parameter STATE_DONE = 2'b11;

  initial begin
    state <= START;
    {LD_SUM , LD_NEXT , SUM_SEL , NEXT_SEL , A_SEL , DONE} <= 6'b000000;
  end

  always @ (posedge clk) begin
    if(rst == 1) begin
      state <= START;
      {LD_SUM , LD_NEXT , SUM_SEL , NEXT_SEL , A_SEL , DONE} <= 6'b000000;
    end
    else begin
      case(state)
        START: begin
          if(start == 0) begin
            state <= START;
            {LD_SUM , LD_NEXT , SUM_SEL , NEXT_SEL , A_SEL , DONE} <= 6'b000000;
          end
          else if(start == 1) begin
            state <= COMPUTE_SUM;
            {LD_SUM , LD_NEXT , SUM_SEL , NEXT_SEL , A_SEL , DONE} <= 6'b101110;
          end
        end

        COMPUTE_SUM: begin
          state <= GET_NEXT;
          {LD_SUM , LD_NEXT , SUM_SEL , NEXT_SEL , A_SEL , DONE} <= 6'b011100;
        end

        GET_NEXT: begin
          if(next_zero == 0) begin
            state <= COMPUTE_SUM;
            {LD_SUM , LD_NEXT , SUM_SEL , NEXT_SEL , A_SEL , DONE} <= 6'b101110;
          end
          else if(next_zero == 1) begin
            state <= STATE_DONE;
            {LD_SUM , LD_NEXT , SUM_SEL , NEXT_SEL , A_SEL , DONE} <= 6'b000001;
          end
        end

        STATE_DONE: begin
          if(start == 1) begin
            state <= STATE_DONE;
            {LD_SUM , LD_NEXT , SUM_SEL , NEXT_SEL , A_SEL , DONE} <= 6'b000001;
          end
          else if(start == 0) begin
            state <= START;
            {LD_SUM , LD_NEXT , SUM_SEL , NEXT_SEL , A_SEL , DONE} <= 6'b000000;
          end
        end
      endcase
    end
  end

endmodule
