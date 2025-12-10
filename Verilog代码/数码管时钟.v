module fpga_prj3(clk,seg1,seg2,led);
output [8:0]seg1;
output [8:0]seg2;
output [7:0]led;
input clk;
reg [8:0]seg1_value;
reg [8:0]seg2_value;
reg [24:0] count;
reg [3:0] num1;
reg [3:0] num2;
reg [7:0] led_value;
reg [7:0] led_value1;

assign seg1=seg1_value;
assign seg2=seg2_value;
assign led=led_value1;

parameter clk_count=12_000_000;
parameter number_count=10;//控制进制
initial begin
num1=4'b0000;
num2=4'b0000;

led_value=8'b0000_0001;
led_value1=8'b1111_1110;
end

always@(posedge clk)begin

count<=count+25'b1;

if(count == clk_count)begin
num1<=num1+4'b1;
count<=25'b0;
led_value <= led_value<<1;
led_value1 <= ~led_value;
end

if(led_value==8'b0)begin
led_value<=8'b0000_0001;
end

if(num1 == number_count)begin
num2<=num2+4'b1;
num1<=4'b0;
end

if(num2 == number_count)begin
num2<=4'b0;
end

case(num2)
4'h0:seg1_value<=9'h3f;
4'h1:seg1_value<=9'h06; 
4'h2:seg1_value<=9'h5b;
4'h3:seg1_value<=9'h4f;
4'h4:seg1_value<=9'h66;   
4'h5:seg1_value<=9'h6d;  
4'h6:seg1_value<=9'h7d;
4'h7:seg1_value<=9'h07;
4'h8:seg1_value<=9'h7f;
4'h9:seg1_value<=9'h6f;
endcase

case(num1)
4'h0:seg2_value<=9'h3f;
4'h1:seg2_value<=9'h06; 
4'h2:seg2_value<=9'h5b;
4'h3:seg2_value<=9'h4f;
4'h4:seg2_value<=9'h66;   
4'h5:seg2_value<=9'h6d;  
4'h6:seg2_value<=9'h7d;
4'h7:seg2_value<=9'h07;
4'h8:seg2_value<=9'h7f;
4'h9:seg2_value<=9'h6f;
endcase

end
endmodule
