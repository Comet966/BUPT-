//异步时钟JK触发器
module fpga_prj(j,k,rst,clk,q,q_bar);
input j,k,rst,clk;
output q,q_bar;

reg q_value;
assign q_bar = ~q_value;
assign q = q_value;

always@(negedge clk or posedge rst)begin


if(rst == 1) begin q_value <= 0;end
else begin q_value <= (~j && q_value)||(k && ~q_value); end

end

endmodule
