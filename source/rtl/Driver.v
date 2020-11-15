`timescale 1ns/1ns
module Driver
#(
	parameter H_SYNC = 136	, 		// 行同步信号时间
	parameter H_BACK = 160	, 		// 行消隐后肩时间
	parameter H_DISP = 1024	, 		// 行数据有效时间
	parameter H_FRONT = 24	, 		// 行消隐前肩时间
	parameter H_TOTAL = 1344, 		// 行扫描总时间
			
	parameter V_SYNC = 6	, 		// 列同步信号时间
	parameter V_BACK = 29	, 		// 列消隐后肩时间
	parameter V_DISP = 768	, 		// 列数据有效时间
	parameter V_FRONT = 3	, 		// 列消隐前肩时间
	parameter V_TOTAL = 806 , 		// 列扫描总时间
	parameter IMG_W = 200,  		//摄像头分辨率
	parameter IMG_H = 164,
	parameter IMG_X = 0,
	parameter IMG_Y = 0
)
(
	input  wire			clk,			//VGA clock
	input  wire			rst_n,     		//sync reset
	input  wire	[23:0]	lcd_data,		//lcd data
	
	//lcd interface
	output wire			lcd_dclk,   	//lcd pixel clock
	output wire			lcd_hs,	    	//lcd horizontal sync
	output wire			lcd_vs,	    	//lcd vertical sync
	output wire			lcd_en,			//lcd display enable
	output wire	[23:0]	lcd_rgb,		//lcd display data

	//user interface
	output wire	[11:0]	lcd_xpos,		//lcd horizontal coordinate
	output wire	[11:0]	lcd_ypos,		//lcd vertical coordinate
	output 	wire 		img_ack,
	output 	wire [15:0]	addr
);	
wire lcd_de;
localparam	H_AHEAD = 	12'd1;
localparam 	THB 	= 	286;
localparam TH 	 = H_DISP + THB;
localparam  TVB   	= 	38;
localparam TV    = V_DISP + TVB;
reg [11:0] hcnt; 
reg [11:0] vcnt;
wire lcd_request;
reg [15:0] read_addr;
/*******************************************
		SYNC--BACK--DISP--FRONT
*******************************************/ 
//h_sync counter & generator
always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
		hcnt <= 12'd0;
	else
	begin
        if(hcnt < H_TOTAL - 1'b1)		//line over			
            hcnt <= hcnt + 1'b1;
        else
            hcnt <= 12'd0;
	end
end 

assign	lcd_hs = (hcnt <= H_SYNC - 1'b1) ? 1'b0 : 1'b1; // line over flag

//v_sync counter & generator
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n)
		vcnt <= 12'b0;
	else if(hcnt == H_TOTAL - 1'b1)	//line over
		begin
		if(vcnt == V_TOTAL - 1'b1)		//frame over
			vcnt <= 12'd0;
		else
			vcnt <= vcnt + 1'b1;
		end
end

assign	lcd_vs = (vcnt <= V_SYNC - 1'b1) ? 1'b0 : 1'b1; // frame over flag

// LED clock
assign	lcd_dclk = ~clk;

// Control Display
assign	lcd_en		=	(hcnt >= H_SYNC + H_BACK  && hcnt < H_SYNC + H_BACK + H_DISP) &&
						(vcnt >= V_SYNC + V_BACK  && vcnt < V_SYNC + V_BACK + V_DISP) 
						? 1'b1 : 1'b0;                   // Display Enable Signal
						
assign	lcd_rgb 	= 	lcd_en ? lcd_data : 24'h000000;	

//ahead x clock
assign	lcd_request	=	(hcnt >= H_SYNC + H_BACK - H_AHEAD && hcnt < H_SYNC + H_BACK + H_DISP - H_AHEAD) &&
						(vcnt >= V_SYNC + V_BACK && vcnt < V_SYNC + V_BACK + V_DISP) 
						? 1'b1 : 1'b0;

assign img_ack = lcd_de &&
((hcnt - THB) >= IMG_X && (hcnt - THB) < (IMG_X + IMG_W)) && 
((vcnt - TVB) >= IMG_Y && (vcnt - TVB) < (IMG_Y + IMG_H)) ? 1'b1 : 1'b0;
//lcd xpos & ypos
assign	lcd_xpos	= 	lcd_request ? (hcnt - (H_SYNC + H_BACK - H_AHEAD)) : 12'd0;
assign	lcd_ypos	= 	lcd_request ? (vcnt - (V_SYNC + V_BACK)) : 12'd0;
assign addr = read_addr;
assign lcd_de    = ( hcnt >= THB && hcnt <= TH && vcnt >= TVB  && vcnt < TV) ? 1 : 0;
always@(posedge clk or negedge rst_n)
 begin
	 if(!rst_n)
		 read_addr <= 16'd0;
	 else if(img_ack)
		 read_addr <= (hcnt - IMG_X - THB) + (vcnt - IMG_Y - TVB) * IMG_W;
	 else
		 read_addr <= 16'd0;  
 end


endmodule
