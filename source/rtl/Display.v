`timescale 1ns/1ns

// 颜色定义 RGB--8|8|8
`define RED		24'hFF0000 
`define GREEN	24'h00FF00 
`define BLUE  	24'h0000FF 
`define WHITE 	24'hFFFFFF 
`define BLACK 	24'h000000 
`define YELLOW	24'hFFFF00 
`define CYAN  	24'hFF00FF 
`define ROYAL 	24'h00FFFF 
/******************************************************************/

module Display#
(
    //参数列表
    parameter H_DISP = 1024,
	parameter V_DISP = 768
)
(
    input clk,
    input rst,
    input  wire	[11:0]	lcd_xpos,	    //lcd水平坐标
	input  wire	[11:0]	lcd_ypos,	    //lck竖直坐标
    input  wire [1:0]   state_number,   //状态选择指数
    input  key1,
    input  key2,
    input  [7:0]        bin_data,
    output reg [10:0]score0,
    output reg Bird_dead,
    output reg [23:0]    lcd_data	    
);

//分频计数�
	reg clk50;
	reg[24:0]j;
	reg[9:0] Bird_x0;
	reg[9:0] Bird_y0;
	//分频计数�
	always @(posedge clk)
	if(!rst)
		begin
			clk50<=0;
			j<=0;
		end
	else
		begin
			if(j==200000)
				begin
				j<=0;
				clk50<=~clk50;
				end
			else
			j<=j+1;
		end
//鸟飞行和障碍物运动时�
	reg clk40;
	reg[24:0]i;
	//分频计数�
	always @(posedge clk)
	if(!rst)
		begin
			clk40<=0;
			i<=0;
		end
	else
		begin
			if(i==200000)
				begin
				i<=0;
				clk40<=~clk40;
				end
			else
			i<=i+1;
		end
//30个上升沿/1s，即30帧的图像播放




//ROM例化列表
ggbutton g1(.clka(clk),    .rsta(!rst),    .addra(Gameoverbutton_rom_add),   .doa(Gameoverbutton_rom_data));
grass B1(.clka(clk),    .rsta(!rst),    .addra(grass_rom_add),   .doa(Grass_rom_data));
star B3(.clka(clk),    .rsta(!rst),    .addra(Star_rom_add),   .doa(Star_rom_data));


//鸟的状�

//障碍�
// Obstacle_up_01 o1(.clka(),    .rsta(),    .addra(),   .doa());
// Obstacle_up_02 o2(.clka(),    .rsta(),    .addra(),   .doa());
// Obstacle_up_03 o3(.clka(),    .rsta(),    .addra(),   .doa());
// Obstacle_down_01 o4(.clka(),    .rsta(),    .addra(),   .doa());
// Obstacle_down_02 o5(.clka(),    .rsta(),    .addra(),   .doa());
// Obstacle_down_03 o6(.clka(),    .rsta(),    .addra(),   .doa());
// 按钮
//PauseButton PB1(.clka(),    .rsta(),    .addra(),   .doa());
//道具


/******************************************************************/

//图像参数
//菜单为背景长两边�，上下�
parameter start_button_length = 100;
parameter start_button_width = 50; 

//草、星星、摄像头
parameter cam_length=200;
parameter cam_width=164;
parameter grass_length=100;
parameter grass_width=50;
parameter star_length=20;
parameter star_width=20;
parameter moon_length=100;
parameter moon_width=100;
parameter Bird_length = 60;
parameter Bird_width = 60;

//中间留空126个像素点
//空位分别在中间，上三分之一和下三分之一
parameter Obstacle_length = 100;
parameter Obstacle_short_width = 65;
parameter Obstacle_middle_width = 129;
parameter Obstacle_long_width = 193;

//暂停按键放在左上�
//parameter PauseButton_length = 40;
//parameter PauseButton_width = 30;

/******************************************************************/

//图像Rom读取地址和数�
//地址
reg[13:0] Camera_rom_add;
reg[13:0] Startbutton_rom_add;
reg[13:0] Gameoverbutton_rom_add;
reg[14:0] Moon_rom_add;
reg[14:0] Star_rom_add;
reg[14:0] grass_rom_add;
// reg[13:0] Star_00_rom_add;
// reg[13:0] Star_01_rom_add;
// reg[13:0] Star_02_rom_add;
// reg[13:0] Star_03_rom_add;
// reg[13:0] Star_04_rom_add;
// reg[13:0] grass_00_rom_add;
// reg[13:0] grass_01_rom_add;

reg[11:0] Bird_Fly_rom_add;
//reg[13:0] Bird_dead_rom_add;


//数据
wire[7:0] Startbutton_rom_data;
wire[7:0] Gameoverbutton_rom_data;
wire[7:0] Moon_rom_data;
wire[7:0] Star_rom_data;
wire[7:0] Grass_rom_data;
wire[23:0] Bird_Fly_rom_data;

//图像Rom读取地址使能信号和数据使能信�
//地址使能
wire Startbutton_add;
wire Gameoverbutton_add;
wire Moon_add;
wire Bird_Fly_add;
wire Star_00_add;
wire Star_01_add;
wire Star_02_add;
wire Star_03_add;
wire Star_04_add;
wire grass_00_add;
wire grass_01_add;
//wire PauseButton_add;

//数据使能
wire Camera_en;
wire Startbutton_en;
wire Gameoverbutton_en;
wire Bird_Fly_en;
wire Moon_en;
wire Star_00_en;
wire Star_01_en;
wire Star_02_en;
wire Star_03_en;
wire Star_04_en;
wire grass_00_en;
wire grass_01_en;
/******************************************************************/

//图片左上角的实时坐标
reg[11:0] Startbutton_x0,Startbutton_y0;
reg[11:0] Gameoverbutton_x0,Gameoverbutton_y0;
reg[11:0] Moon_x0,Moon_y0;
reg[11:0] star_x0,star_y0,star_x1,star_y1,star_x2,star_y2,star_x3,star_y3,star_x4,star_y4;
reg[11:0] grass_x0,grass_y0,grass_x1,grass_y1;
reg[11:0] cam_x0,cam_y0;
reg[11:0] Bird_x0,Bird_y0;
reg[11:0] Obstacle_01_x0;
reg[11:0] Obstacle_02_x0;
reg[11:0] Obstacle_03_x0;
reg[11:0] Obstacle_01_y0= 12'd450;
reg[11:0] Obstacle_02_y0 = 12'd150;
reg[11:0] Obstacle_03_y0 = 12'd300;
//reg[9:0] PauseButton_xo,PauseButton_y0;

/******************************************************************/
reg [13:0]addra;
Bird_Fly b1(.clka(clk), .addra(addra),.doa(Bird_Fly_rom_data));
moon B2(.clka(clk),.rsta(!rst)    , .addra(Moon_rom_add),   .doa(Moon_rom_data));
Startbutton s1(.clka(clk),       .addra(Startbutton_rom_add),   .doa(Startbutton_rom_data));
//使能的赋�
assign Camera_en = (lcd_xpos >=cam_x0) && (lcd_xpos < cam_x0 + cam_length) && (lcd_ypos >=cam_y0) && (lcd_ypos < cam_y0 + cam_width);

assign Startbutton_add = (lcd_xpos > Startbutton_x0) && (lcd_xpos < Startbutton_x0 + start_button_length) && (lcd_ypos > Startbutton_y0) && (lcd_ypos < Startbutton_y0 + start_button_width);
assign Startbutton_en = (lcd_xpos > Startbutton_x0) && (lcd_xpos < Startbutton_x0 + start_button_length) && (lcd_ypos > Startbutton_y0) && (lcd_ypos < Startbutton_y0 + start_button_width);

assign Gameoverbutton_add = (lcd_xpos > Gameoverbutton_x0) && (lcd_xpos < Gameoverbutton_x0 + start_button_length) && (lcd_ypos > Gameoverbutton_y0) && (lcd_ypos < Gameoverbutton_y0 + start_button_width);
assign Gameoverbutton_en = (lcd_xpos > Gameoverbutton_x0) && (lcd_xpos < Gameoverbutton_x0 + start_button_length) && (lcd_ypos > Gameoverbutton_y0) && (lcd_ypos < Gameoverbutton_y0 + start_button_width);

assign Bird_Fly_add = (lcd_xpos >= Bird_x0-10'd3) && (lcd_xpos < Bird_x0 + Bird_length) && (lcd_ypos >=Bird_y0) && (lcd_ypos < Bird_y0 + Bird_width);
assign Bird_Fly_en = (lcd_xpos >=Bird_x0) && (lcd_xpos < Bird_x0 + Bird_length) && (lcd_ypos >=Bird_y0) && (lcd_ypos < Bird_y0 + Bird_width);

assign Moon_add = (lcd_xpos > Moon_x0-10'd3) && (lcd_xpos < Moon_x0 + moon_length-10'd3) && (lcd_ypos > Moon_y0) && (lcd_ypos < Moon_y0 + moon_width);
assign Moon_en = (lcd_xpos > Moon_x0) && (lcd_xpos < Moon_x0 + moon_length) && (lcd_ypos > Moon_y0) && (lcd_ypos < Moon_y0 + moon_width);

assign Star_00_add = (lcd_xpos > star_x0) && (lcd_xpos < star_x0 + star_length) && (lcd_ypos > star_y0) && (lcd_ypos < star_y0 + star_width);
assign Star_00_en = (lcd_xpos > star_x0) && (lcd_xpos < star_x0 + star_length) && (lcd_ypos > star_y0) && (lcd_ypos < star_y0 + star_width);

assign Star_01_add = (lcd_xpos > star_x1) && (lcd_xpos < star_x1 + star_length) && (lcd_ypos > star_y1) && (lcd_ypos < star_y1 + star_width);
assign Star_01_en = (lcd_xpos > star_x1) && (lcd_xpos < star_x1 + star_length) && (lcd_ypos > star_y1) && (lcd_ypos < star_y1 + star_width);

assign Star_02_add = (lcd_xpos > star_x2) && (lcd_xpos < star_x2 + star_length) && (lcd_ypos > star_y2) && (lcd_ypos < star_y2 + star_width);
assign Star_02_en = (lcd_xpos > star_x2) && (lcd_xpos < star_x2 + star_length) && (lcd_ypos > star_y2) && (lcd_ypos < star_y2 + star_width);

assign Star_03_add = (lcd_xpos > star_x3) && (lcd_xpos < star_x3 + star_length) && (lcd_ypos > star_y3) && (lcd_ypos < star_y3 + star_width);
assign Star_03_en = (lcd_xpos > star_x3) && (lcd_xpos < star_x3 + star_length) && (lcd_ypos > star_y3) && (lcd_ypos < star_y3 + star_width);

assign Star_04_add = (lcd_xpos > star_x4) && (lcd_xpos < star_x4 + star_length) && (lcd_ypos > star_y4) && (lcd_ypos < star_y4 + star_width);
assign Star_04_en = (lcd_xpos > star_x4) && (lcd_xpos < star_x4 + star_length) && (lcd_ypos > star_y4) && (lcd_ypos < star_y4 + star_width);

assign grass_00_add = (lcd_xpos > grass_x0) && (lcd_xpos < grass_x0 + grass_length) && (lcd_ypos > grass_y0) && (lcd_ypos < grass_y0 + grass_width);
assign grass_00_en = (lcd_xpos > grass_x0) && (lcd_xpos < grass_x0 + grass_length) && (lcd_ypos > grass_y0) && (lcd_ypos < grass_y0 + grass_width);

assign grass_01_add = (lcd_xpos > grass_x1) && (lcd_xpos < grass_x1 + grass_length) && (lcd_ypos > grass_y1) && (lcd_ypos < grass_y1 + grass_width);
assign grass_01_en = (lcd_xpos > grass_x1) && (lcd_xpos < grass_x1 + grass_length) && (lcd_ypos > grass_y1) && (lcd_ypos < grass_y1 + grass_width);


/******************************************************************/

//随机数生�
wire [1:0]    randnum;        //随机数用于选择障碍�
reg  [7:0]    rand_num;       //种子
initial begin
rand_num = 8'hA5;
end
always@(posedge clk40 or negedge rst )
begin
	if(!rst)
	rand_num<=8'hA5;
	else begin
        rand_num[0] <= rand_num[1]+rand_num[6];
        rand_num[1] <= rand_num[0]+rand_num[4];
        rand_num[2] <= rand_num[1]+rand_num[5];
        rand_num[3] <= rand_num[2]+rand_num[4];
        rand_num[4] <= rand_num[3]+rand_num[0];
        rand_num[5] <= rand_num[4] ^ rand_num[5];
        rand_num[6] <= rand_num[5] ^ rand_num[7];
        rand_num[7] <= rand_num[6]+rand_num[3];
	end
end
wire [2:0]rand;
reg  [9:0]ypos;
assign rand = {rand_num[2],rand_num[5],rand_num[6]};
always@(posedge clk )
begin
    case(rand) 
    0:ypos = 350;
    1:ypos = 400;
    2:ypos = 450;
    3:ypos = 400;
    4:ypos = 600;
    5:ypos = 200;
    6:ypos = 250;
    7:ypos = 300;
    default: ypos = 300;
    endcase
end





//初始化数�
initial begin
    Startbutton_x0 <= 'd462;
    Startbutton_y0 <= 'd359;
    Gameoverbutton_x0 <= 'd462;
    Gameoverbutton_y0 <= 'd359;
    Bird_x0 <= 'd200;
    Bird_y0 <= 'd250;
    Moon_x0 <= 'd900;
    Moon_y0 <= 'd100;
    star_x0 <= 'd400;
    star_x1 <= 'd550;
    star_x2 <= 'd666;
    star_x3 <= 'd700;
    star_x4 <= 'd820;
    star_y0 <= 'd20;
    star_y1 <= 'd50;
    star_y2 <= 'd33;
    star_y3 <= 'd42;
    star_y4 <= 'd15;
    grass_x0 <= 'd150;
    grass_x1 <= 'd650;
    grass_y0 <= 'd550;
    grass_y1 <= 'd600;

    
    //分数
    score0<=0;
end

reg [3:0]speed = 4'd1;
reg [3:0]speed1 = 4'd2;
reg [3:0]speed2 = 4'd3;
initial
begin
    Obstacle_01_x0<=12'd450;
	Obstacle_02_x0<=12'd900;
	Obstacle_03_x0<=12'd1350;
	score0<=0;
end


//确定随机发生的障碍物的下三块的Y0�
always@(posedge clk40 or negedge key1)
begin
	if(!key1)begin
	    Obstacle_01_x0<=12'd450;
	    Obstacle_02_x0<=12'd900;
	    Obstacle_03_x0<=12'd1350;
	    score0<=0;
	end
    else if(Obstacle_01_x0 <= 0) begin
        score0 <= score0 + 1'b1;
        Obstacle_01_x0 <= 12'd1350;
        Obstacle_01_y0 <= ypos;
    end
    else if(Obstacle_02_x0 <= 0) begin
        score0 <= score0 + 1'b1;
        Obstacle_02_x0 <= 12'd1350;
        Obstacle_02_y0 <= ypos;
    end
    else if(Obstacle_03_x0 <= 0) begin
        score0 <= score0 + 1'b1;
        Obstacle_03_x0 <= 12'd1350;
        Obstacle_03_y0 <= ypos;
    end
    else if(1) begin 
        Obstacle_01_x0 <= Obstacle_01_x0-speed;
        Obstacle_02_x0 <= Obstacle_02_x0-speed; 
        Obstacle_03_x0 <= Obstacle_03_x0-speed ; 
    end
    else if(score0<=100&&score0>50) begin 
        Obstacle_01_x0 <= Obstacle_01_x0-speed1;
        Obstacle_02_x0 <= Obstacle_02_x0-speed1; 
        Obstacle_03_x0 <= Obstacle_03_x0-speed1; 
    end
    else if(score0>100 )begin 
        Obstacle_01_x0 <= Obstacle_01_x0-speed2;
        Obstacle_02_x0 <= Obstacle_02_x0-speed2; 
        Obstacle_03_x0 <= Obstacle_03_x0-speed2; 
    end
    else begin
        Obstacle_01_x0 <= Obstacle_01_x0;
        Obstacle_02_x0 <= Obstacle_02_x0;
        Obstacle_03_x0 <= Obstacle_03_x0;
    end
    end



assign Obstacle_01_en = (lcd_xpos > Obstacle_01_x0) && (lcd_xpos < Obstacle_01_x0 + Obstacle_length) && ((lcd_ypos >= 0 && lcd_ypos <= Obstacle_01_y0-12'd100)||( lcd_ypos >= Obstacle_01_y0 + 12'd100 && lcd_ypos <= 12'd768));


assign Obstacle_02_en = (lcd_xpos > Obstacle_02_x0) && (lcd_xpos < Obstacle_02_x0 + Obstacle_length) &&((lcd_ypos >= 0 && lcd_ypos <= Obstacle_02_y0-12'd100)||( lcd_ypos >= Obstacle_02_y0 + 12'd100 && lcd_ypos <= 12'd768));


assign Obstacle_03_en = (lcd_xpos > Obstacle_03_x0) && (lcd_xpos < Obstacle_03_x0 + Obstacle_length) && ((lcd_ypos >= 0 && lcd_ypos <= Obstacle_03_y0-12'd100)|| (lcd_ypos >= Obstacle_03_y0 + 12'd100 && lcd_ypos <= 12'd768));

//鸟下坠，30个像素点/1s,鸟上飞，60个像素点/1s
always @(posedge clk50) begin
    if(state_number==2'b01) begin
    
    if(!rst) begin
        Bird_y0 <= 'd128;
    end
    else if(!key2) begin
        Bird_y0 <= Bird_y0 - 2'b1; 
    end
    else begin
        Bird_y0 <= Bird_y0 + 2'b1;
    end
    end
    else Bird_y0<=10'd120;
end

// //rom输出地址
// //开始菜�
// always @(posedge clk or negedge rst) begin
//     if(!rst)
//         Startbutton_rom_add <= 14'd0;
//     else if((lcd_xpos == Startbutton_x0) && (lcd_ypos == Startbutton_y0) )
//         Startbutton_rom_add <= 14'd0;
//     else if(StartStartbutton_add)
//         Startbutton_rom_add = Startbutton_rom_add + 1'b1;              
// end
//结束菜单

// always @(posedge clk or negedge rst) begin
//     if(!rst)
//         Gameoverbutton_rom_add <= 14'd0;
//     else if((lcd_xpos == Gameoverbutton_x0) && (lcd_ypos == Gameoverbutton_y0) )
//         Gameoverbutton_rom_add <= 14'd0;
//     else if(Gameoverbutton_add)
//         Gameoverbutton_rom_add = Gameoverbutton_rom_add + 1'b1;              
// end

//背景
//月亮
// always @(posedge clk or negedge rst) begin
//     if(!rst)
//         Moon_rom_add<= 14'd0;
//     else if((lcd_xpos == Moon_x0-10'd3) && (lcd_ypos == Moon_y0) )
//         Moon_rom_add <= 14'd0;
//     else if(Moon_add)
//         Moon_rom_add = Moon_rom_add + 1'b1;   
// end

//草丛
// always @(posedge clk or negedge rst) begin
//     if(!rst)
//         grass_00_rom_add<= 14'd0;
//     else if((lcd_xpos == grass_x0) && (lcd_ypos == grass_y0) )
//         grass_00_rom_add <= 14'd0;
//     else if(grass_00_add)
//         grass_00_rom_add = grass_00_rom_add + 1'b1;   
// end

// always @(posedge clk or negedge rst) begin
//     if(!rst)
//         grass_01_rom_add<= 14'd0;
//     else if((lcd_xpos == grass_x1) && (lcd_ypos == grass_y1) )
//         grass_01_rom_add <= 14'd0;
//     else if(grass_01_add)
//         grass_01_rom_add = grass_01_rom_add + 1'b1;   
// end
//星星
// always @(posedge clk or negedge rst) begin
//     if(!rst)
//         Star_00_rom_add<= 14'd0;
//     else if((lcd_xpos == star_x0) && (lcd_ypos == star_y0) )
//         Star_00_rom_add <= 14'd0;
//     else if(Star_00_add)
//         Star_00_rom_add = Star_00_rom_add + 1'b1;   
// end
// always @(posedge clk or negedge rst) begin
//     if(!rst)
//         Star_01_rom_add<= 14'd0;
//     else if((lcd_xpos == star_x1) && (lcd_ypos == star_y1) )
//         Star_01_rom_add <= 14'd0;
//     else if(Star_01_add)
//         Star_01_rom_add = Star_01_rom_add + 1'b1;   
// end
// always @(posedge clk or negedge rst) begin
//     if(!rst)
//         Star_02_rom_add<= 14'd0;
//     else if((lcd_xpos == star_x2) && (lcd_ypos == star_y2) )
//         Star_02_rom_add <= 14'd0;
//     else if(Star_02_add)
//         Star_02_rom_add = Star_02_rom_add + 1'b1;   
// end
// always @(posedge clk or negedge rst) begin
//     if(!rst)
//         Star_03_rom_add<= 14'd0;
//     else if((lcd_xpos == star_x3) && (lcd_ypos == star_y3) )
//         Star_03_rom_add <= 14'd0;
//     else if(Star_03_add)
//         Star_03_rom_add = Star_03_rom_add + 1'b1;   
// end
// always @(posedge clk or negedge rst) begin
//     if(!rst)
//         Star_04_rom_add<= 14'd0;
//     else if((lcd_xpos == star_x4) && (lcd_ypos == star_y4) )
//         Star_04_rom_add <= 14'd0;
//     else if(Star_04_add)
//         Star_04_rom_add = Star_04_rom_add + 1'b1;   
// end


//鸟飞
always @(posedge clk or negedge key1) begin
    if(!key1)
        Bird_Fly_rom_add <= 12'd0;
    else if((lcd_xpos == Bird_x0-10'd3) && (lcd_ypos == Bird_y0) )
        Bird_Fly_rom_add <= 12'd0;
    else if(Bird_Fly_add)
        Bird_Fly_rom_add = Bird_Fly_rom_add + 1'b1;              
end

//鸟死亡判�
always @(posedge clk or negedge key1) begin
    
    if(!key1)
        Bird_dead <= 'd0;
    else if(Bird_y0 == 'd1)
        Bird_dead <= 'd1;
    else if(Bird_y0 == 'd768)
        Bird_dead <= 'd1;
    else if(Bird_x0 > Obstacle_01_x0+10 - Bird_length && Bird_x0 < Obstacle_01_x0-10 + Obstacle_length) begin
        if(Bird_y0 > Obstacle_01_y0 - 'd100 && Bird_y0 < Obstacle_01_y0+100-Bird_length)
            Bird_dead <= 'd0;
        else Bird_dead <= 'd1;
    end 
    else if(Bird_x0 > Obstacle_02_x0+10 - Bird_length && Bird_x0 < Obstacle_02_x0 -10+ Obstacle_length) begin
         if(Bird_y0 > Obstacle_02_y0 - 'd100 && Bird_y0 < Obstacle_02_y0+100-Bird_length)
            Bird_dead <= 'd0;
        else Bird_dead <= 'd1;
    end
    else if(Bird_x0 > Obstacle_03_x0+10 - Bird_length && Bird_x0 < Obstacle_03_x0-10 + Obstacle_length) begin
         if(Bird_y0 > Obstacle_03_y0 - 'd100 && Bird_y0 < Obstacle_03_y0+100-Bird_length)
            Bird_dead <= 'd0;
        else Bird_dead <= 'd1;
    end
    else Bird_dead <= Bird_dead;
end



//显示
always @(posedge clk or negedge rst) begin
    case (state_number)
        //开始菜�
        2'b00:if(!rst)
                lcd_data <= 24'b0;
            else if(Camera_en)begin
                
                lcd_data<={bin_data,bin_data,bin_data};
            end
            else if(Startbutton_en)begin
                Startbutton_rom_add<=lcd_xpos-Startbutton_x0+(lcd_ypos-Startbutton_y0)*100;
                lcd_data <= {Startbutton_rom_data,Startbutton_rom_data,Startbutton_rom_data};
            end
                
            else if(Moon_en)begin
                Moon_rom_add<=lcd_xpos-Moon_x0+(lcd_ypos-Moon_y0)*100;
                lcd_data <= {Moon_rom_data,Moon_rom_data,Moon_rom_data};
            end  
            else if(Star_00_en)begin
                Star_rom_add<=lcd_xpos-star_x0+(lcd_ypos-star_y0)*20;
                lcd_data <= {Star_rom_data,Star_rom_data,Star_rom_data};
            end
                
            else if(Star_01_en)begin
                Star_rom_add<=lcd_xpos-star_x1+(lcd_ypos-star_y1)*20;
                lcd_data <= {Star_rom_data,Star_rom_data,Star_rom_data};
            end
                
            else if(Star_02_en)begin
                Star_rom_add<=lcd_xpos-star_x2+(lcd_ypos-star_y2)*20;
                lcd_data <= {Star_rom_data,Star_rom_data,Star_rom_data};
            end
                
            else if(Star_03_en)begin
                Star_rom_add<=lcd_xpos-star_x3+(lcd_ypos-star_y3)*20;
                lcd_data <= {Star_rom_data,Star_rom_data,Star_rom_data};
            end
                
            else if(Star_04_en)begin
                Star_rom_add<=lcd_xpos-star_x4+(lcd_ypos-star_y4)*20;
                lcd_data <= {Star_rom_data,Star_rom_data,Star_rom_data};
            end
                
            else if(grass_00_en)begin
                grass_rom_add <= lcd_xpos - grass_x0 + (lcd_ypos - grass_y0)*100;
                lcd_data <= {Grass_rom_data,Grass_rom_data,Grass_rom_data};
            end
               
            else if(grass_01_en)begin
                grass_rom_add <= lcd_xpos - grass_x1 + (lcd_ypos - grass_y1)*100;
                lcd_data <= {Grass_rom_data,Grass_rom_data,Grass_rom_data};
            end
                
           
            else lcd_data= 24'h808080;
        //游戏进行
        2'b01:if(!rst)
                lcd_data <= 24'b0;
            else if(Camera_en)begin
                lcd_data<={bin_data,bin_data,bin_data};
            end

            else if(Bird_Fly_en)
                begin
                addra<=lcd_xpos-Bird_x0+(lcd_ypos-Bird_y0)*60;
                lcd_data<= Bird_Fly_rom_data;
                end
            else if(Obstacle_01_en)
                lcd_data <= 24'hF0F8FF;
            else if(Obstacle_02_en)
                lcd_data <= 24'hF0FFF0;
            else if(Obstacle_03_en)
                lcd_data <=24'hFFF5EE;
                              
            else if(Moon_en)begin
                Moon_rom_add<=lcd_xpos-Moon_x0+(lcd_ypos-Moon_y0)*100;
                lcd_data <= {Moon_rom_data,Moon_rom_data,Moon_rom_data};
            end  
            else if(Star_00_en)begin
                Star_rom_add<=lcd_xpos-star_x0+(lcd_ypos-star_y0)*20;
                lcd_data <= {Star_rom_data,Star_rom_data,Star_rom_data};
            end
                
            else if(Star_01_en)begin
                Star_rom_add<=lcd_xpos-star_x1+(lcd_ypos-star_y1)*20;
                lcd_data <= {Star_rom_data,Star_rom_data,Star_rom_data};
            end
                
            else if(Star_02_en)begin
                Star_rom_add<=lcd_xpos-star_x2+(lcd_ypos-star_y2)*20;
                lcd_data <= {Star_rom_data,Star_rom_data,Star_rom_data};
            end
                
            else if(Star_03_en)begin
                Star_rom_add<=lcd_xpos-star_x3+(lcd_ypos-star_y3)*20;
                lcd_data <= {Star_rom_data,Star_rom_data,Star_rom_data};
            end
                
            else if(Star_04_en)begin
                Star_rom_add<=lcd_xpos-star_x4+(lcd_ypos-star_y4)*20;
                lcd_data <= {Star_rom_data,Star_rom_data,Star_rom_data};
            end
                
            else if(grass_00_en)begin
                grass_rom_add <= lcd_xpos - grass_x0 + (lcd_ypos - grass_y0)*100;
                lcd_data <= {Grass_rom_data,Grass_rom_data,Grass_rom_data};
            end
               
            else if(grass_01_en)begin
                grass_rom_add <= lcd_xpos - grass_x1 + (lcd_ypos - grass_y1)*100;
                lcd_data <= {Grass_rom_data,Grass_rom_data,Grass_rom_data};
            end
                
           else lcd_data= 24'h808080;
        //结束菜单
        2'b10:if(!rst)
                lcd_data <= 24'b0;
               else if(Camera_en)begin
                
                lcd_data<={bin_data,bin_data,bin_data};
            end
            
            else if(Gameoverbutton_en)begin
                Gameoverbutton_rom_add <= lcd_xpos - Gameoverbutton_x0 + (lcd_ypos - Gameoverbutton_y0)*100;
                lcd_data <= {Gameoverbutton_rom_data,Gameoverbutton_rom_data,Gameoverbutton_rom_data}; 
            end

            else if(Moon_en)begin
                Moon_rom_add<=lcd_xpos-Moon_x0+(lcd_ypos-Moon_y0)*100;
                lcd_data <= {Moon_rom_data,Moon_rom_data,Moon_rom_data};
            end  
            else if(Star_00_en)begin
                Star_rom_add<=lcd_xpos-star_x0+(lcd_ypos-star_y0)*20;
                lcd_data <= {Star_rom_data,Star_rom_data,Star_rom_data};
            end
                
            else if(Star_01_en)begin
                Star_rom_add<=lcd_xpos-star_x1+(lcd_ypos-star_y1)*20;
                lcd_data <= {Star_rom_data,Star_rom_data,Star_rom_data};
            end
                
            else if(Star_02_en)begin
                Star_rom_add<=lcd_xpos-star_x2+(lcd_ypos-star_y2)*20;
                lcd_data <= {Star_rom_data,Star_rom_data,Star_rom_data};
            end
                
            else if(Star_03_en)begin
                Star_rom_add<=lcd_xpos-star_x3+(lcd_ypos-star_y3)*20;
                lcd_data <= {Star_rom_data,Star_rom_data,Star_rom_data};
            end
                
            else if(Star_04_en)begin
                Star_rom_add<=lcd_xpos-star_x4+(lcd_ypos-star_y4)*20;
                lcd_data <= {Star_rom_data,Star_rom_data,Star_rom_data};
            end
                
            else if(grass_00_en)begin
                grass_rom_add <= lcd_xpos - grass_x0 + (lcd_ypos - grass_y0)*100;
                lcd_data <= {Grass_rom_data,Grass_rom_data,Grass_rom_data};
            end
               
            else if(grass_01_en)begin
                grass_rom_add <= lcd_xpos - grass_x1 + (lcd_ypos - grass_y1)*100;
                lcd_data <= {Grass_rom_data,Grass_rom_data,Grass_rom_data};
            end
                
            
            else lcd_data= 24'h808080;
        default: lcd_data <= 24'h808080;
    endcase
end




endmodule
