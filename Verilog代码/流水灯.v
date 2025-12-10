//流水灯
module fpga_prj(clk,led);
input clk;
output [7:0] led;
reg [7:0] led_value;
reg [24:0] count;
parameter clk_count = 200_000;

initial begin
led_value = 8'b0000_0001;
count = 25'b0;
end

assign led = ~led_value;

always@(posedge clk)begin

if(count < clk_count)count <= count + 1;
if(count >= clk_count)begin

count <= 0;
led_value <= led_value<<1;

end

if(led_value == 8'b1000_0000) led_value <= 8'b0000_0001;

end


endmodule
