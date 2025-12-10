//密码箱

module fpga_prj2(sw,key,led);
input [3:0] sw;
input [3:0] key;
output [7:0] led;
reg [7:0] led_value;
initial led_value = 8'b1111_1111;
assign led = led_value;
parameter password = 4'b0101;
always@(sw)begin
if(sw == password)led_value=8'b0101_0101;
else led_value=8'b1111_1111;
end
endmodule
