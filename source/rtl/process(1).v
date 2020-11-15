`timescale 1ns/ 1ps
module process #
(
    //分割屏幕的中间值x_middle
    parameter x_middle = 100,
    parameter total_length = 200,
    parameter total_width = 164
)
(
    input clk,
    input rst,

    input [10:0]x_pos,
    input [10:0]y_pos,
    input [7:0] data_in,

    output reg birdfly_enable
);

//计数器
reg[14:0] counter_left;
reg[14:0] counter_right;

reg [7:0] data_in_m;
reg[14:0] D_value;

// reg [2:0]data_in_m1; //消噪

// always @(posedge clk or negedge rst) begin
//     if(!rst) data_in_m1 <= 3'b0;
//     else data_in_m1 = {data_in_m1[1:0],data_in_m[7]};
// end
//分别计算图像左右部分黑点数量

always @(posedge clk ) begin
    data_in_m <= data_in;
    if(x_pos==5 && y_pos==5) begin
        counter_left <= 0;
        counter_right <= 0;
    end
    else if(x_pos<x_middle && x_pos>5 &&(y_pos>5)&&( y_pos < total_width))begin
        if(data_in[7] == 0) counter_left <= counter_left + 'b1;
        else counter_left <= counter_left;
    end
    else if((x_pos > x_middle)&& (y_pos < total_width-5)&&(y_pos>5)&&(x_pos<195))begin
        if(data_in[7] == 0) counter_right <= counter_right + 'b1;
        else counter_right <= counter_right;
    end
end
    reg clk501;
	reg[24:0]j;
	
	//分频计数�
	always @(posedge clk)
	if(!rst)
		begin
			clk501<=0;
			j<=0;
		end
	else
		begin
			if(j==1000000)
				begin
				j<=0;
				clk501<=~clk501;
				end
			else
			j<=j+1;
		end
// 差值计算
always @(posedge clk501 or negedge rst) begin
    D_value <= counter_right - counter_left;
    if(!rst) birdfly_enable <= 'b0;
    else if(D_value <= 25500&&D_value > 0)
        birdfly_enable <= 'b1;
    else if(D_value > 25500)
        birdfly_enable <= 'b0;
    
end



endmodule  //process