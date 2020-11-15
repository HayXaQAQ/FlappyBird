`timescale 1ns/1ns
module BGMPlayer 
(
    input clk,
    input rst,

    output reg speaker
);

//基频
wire clk6Mhz;   //控制音调基频
wire clk4hz;    //控制音长基频

clk6Mhz c1
(
	.clk			(clk), 
	.rst_n			(rst),	

	.clk_div		(clk6Mhz)
);

clk4hz c2
(
	.clk			(clk), 
	.rst_n			(rst),	

	.clk_div		(clk4hz)
);
/*************************************************************/

//采用预置数分频，即预置一个数据算出到休止符的预置数的差值，即为分频系数
reg[13:0] divider;  //分频计数
reg[13:0] origin;  //预置数
reg divider_en;     //分频使能

always @(posedge clk6Mhz, negedge rst) begin
    if(!rst)begin
        divider <= 16383;
        divider_en <= 0; 
    end
    if(divider == 16383)begin
        divider <= origin;
        divider_en <= 1;
    end
    else begin
        divider <= divider +1;
        divider_en <= 0; 
    end
end

always @(posedge divider_en) begin
    speaker <= ~speaker;
end

always @(posedge clk4hz,negedge rst) begin
    if(!rst) origin <= 16383;
    case ({high,med,low})
    //低音
        'h001:    origin  <= 4915;
        'h002:    origin  <= 6168; 
        'h003:    origin  <= 7281; 
        'h004:    origin  <= 7792; 
        'h005:    origin  <= 9130; 
        'h006:    origin  <= 9565; 
        'h007:    origin  <= 10310; 
    //中音
        'h010:    origin  <= 10647;
        'h020:    origin  <= 11272;    
        'h030:    origin  <= 11831;
        'h040:    origin  <= 12094;
        'h050:    origin  <= 12556;
        'h060:    origin  <= 12974; 
        'h070:    origin  <= 13346;
    //高音
        'h100:    origin  <= 13516;
        'h100:    origin  <= 13829;
        'h100:    origin  <= 14109;
        'h100:    origin  <= 14235;
        'h100:    origin  <= 14470;
        'h100:    origin  <= 14678;
        'h100:    origin  <= 14864;
    //休止符
        'h000:    origin <= 16383;

        default:  origin <= 16383;
    endcase
end

reg[7:0] counter;//计拍器，用于循环
reg[3:0] high,med,low;
always @(posedge clk4hz) begin
    if(counter == 100) counter <= 0;
    else counter <= counter + 1;

    case(counter)
    0:{high,med,low} <= 'h050;
    1:{high,med,low} <= 'h100; 
    2:{high,med,low} <= 'h200; 
    3:{high,med,low} <= 'h200; 
    4:{high,med,low} <= 'h300;  
    5:{high,med,low} <= 'h300; 
    6:{high,med,low} <= 'h300; 
    7:{high,med,low} <= 'h300; 
    8:{high,med,low} <= 'h300; 
    9:{high,med,low} <= 'h300; 
    10:{high,med,low} <= 'h300; 
    11:{high,med,low} <= 'h300; 
    12:{high,med,low} <= 'h200; 
    13:{high,med,low} <= 'h200; 
    14:{high,med,low} <= 'h200; 
    15:{high,med,low} <= 'h200; 
    16:{high,med,low} <= 'h200; 
    17:{high,med,low} <= 'h200; 
    18:{high,med,low} <= 'h200; 
    19:{high,med,low} <= 'h200; 
    20:{high,med,low} <= 'h100; 
    21:{high,med,low} <= 'h100; 
    22:{high,med,low} <= 'h100; 
    23:{high,med,low} <= 'h100; 
    24:{high,med,low} <= 'h100; 
    25:{high,med,low} <= 'h100; 
    26:{high,med,low} <= 'h100; 
    27:{high,med,low} <= 'h100; 
    28:{high,med,low} <= 'h050; 
    29:{high,med,low} <= 'h050; 
    30:{high,med,low} <= 'h050; 
    31:{high,med,low} <= 'h050; 
    32:{high,med,low} <= 'h050; 
    33:{high,med,low} <= 'h100; 
    34:{high,med,low} <= 'h200; 
    35:{high,med,low} <= 'h200; 
    36:{high,med,low} <= 'h300; 
    37:{high,med,low} <= 'h300; 
    38:{high,med,low} <= 'h300; 
    39:{high,med,low} <= 'h300; 
    40:{high,med,low} <= 'h300; 
    41:{high,med,low} <= 'h300; 
    42:{high,med,low} <= 'h050; 
    43:{high,med,low} <= 'h050; 
    44:{high,med,low} <= 'h300; 
    45:{high,med,low} <= 'h300; 
    46:{high,med,low} <= 'h300; 
    47:{high,med,low} <= 'h300; 
    48:{high,med,low} <= 'h300; 
    49:{high,med,low} <= 'h200; 
    50:{high,med,low} <= 'h100; 
    51:{high,med,low} <= 'h200; 
    52:{high,med,low} <= 'h200; 
    53:{high,med,low} <= 'h300; 
    54:{high,med,low} <= 'h300; 
    55:{high,med,low} <= 'h300; 
    56:{high,med,low} <= 'h300; 
    57:{high,med,low} <= 'h300; 
    58:{high,med,low} <= 'h300; 
    59:{high,med,low} <= 'h000; 
    60:{high,med,low} <= 'h000; 
    61:{high,med,low} <= 'h000; 
    62:{high,med,low} <= 'h000; 
    63:{high,med,low} <= 'h000; 
    64:{high,med,low} <= 'h000; 
    65:{high,med,low} <= 'h200; 
    66:{high,med,low} <= 'h300; 
    67:{high,med,low} <= 'h200; 
    68:{high,med,low} <= 'h200; 
    69:{high,med,low} <= 'h100; 
    70:{high,med,low} <= 'h100; 
    71:{high,med,low} <= 'h100; 
    72:{high,med,low} <= 'h100; 
    73:{high,med,low} <= 'h100; 
    74:{high,med,low} <= 'h100; 
    75:{high,med,low} <= 'h000; 
    76:{high,med,low} <= 'h000; 
    77:{high,med,low} <= 'h000; 
    78:{high,med,low} <= 'h000; 
    79:{high,med,low} <= 'h000; 
    80:{high,med,low} <= 'h000; 
    81:{high,med,low} <= 'h200; 
    82:{high,med,low} <= 'h300; 
    83:{high,med,low} <= 'h200; 
    84:{high,med,low} <= 'h100; 
    85:{high,med,low} <= 'h100; 
    86:{high,med,low} <= 'h100; 
    87:{high,med,low} <= 'h100; 
    88:{high,med,low} <= 'h100; 
    89:{high,med,low} <= 'h100; 
    90:{high,med,low} <= 'h100; 
    91:{high,med,low} <= 'h000; 
    92:{high,med,low} <= 'h000; 
    93:{high,med,low} <= 'h000; 
    94:{high,med,low} <= 'h000; 
    95:{high,med,low} <= 'h100; 
    96:{high,med,low} <= 'h100; 
    97:{high,med,low} <= 'h100; 
     
    default:{high,med,low} <= 'h000; 
    endcase
end


endmodule  //BGMPlayer