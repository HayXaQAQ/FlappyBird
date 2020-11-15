module AngryBird_Demo( 

	input  wire			clk_24m,
	input  wire			rst_n,
	input  wire         key1,
	input  wire         key2,
	input  wire         key3,
	input  wire         key4,
	//lcd interface
	input 	wire 		cam_pclk,	//����ʱ��
	output 	wire 		cam_xclk,	//ϵͳʱ��
	input 	wire 		cam_href,	//��ͬ
	input 	wire 		cam_vsync,	//֡ͬ
	output 	wire 		cam_pwdn,	//ģʽ
	output 	wire 		cam_rst,	//��λ
	output 	wire 		cam_soic,	//SCCB
	inout 	wire 		cam_soid,	//SCCB
	input 	wire [7:0]	cam_data,	//
	//switches
	input wire [7:0] switch,		//gray threhold;
	//seg4
	// output	wire [7:0] sm_seg,
	// output	wire [3:0] sm_bit,
	output	wire led,
	//vgaģ��
	output wire			vga_clk,	//lcd pixel clock			
	output wire			vga_hs,		//lcd horizontal sync 
	output wire			vga_vs,		//lcd vertical sync

    output wire			vga_de,		//lcd data enable
    
	output wire [7:0]  	vga_r,		//lcd red data
	output wire [7:0]	vga_g,		//lcd green data
	output wire [7:0]	vga_b,		//lcd blue data
	output    [5:0]  seg_sel  ,       // �����λѡ�ź�?
    output    [7:0]  seg_led          // ����ܶ�ѡ�ź�?
);
wire [7:0]threshold;
wire	clk_vga;
wire	[11:0]	lcd_xpos;		//lcd horizontal coordinate
wire	[11:0]	lcd_ypos;		//lcd vertical coordinate
wire	[23:0]	lcd_data;		//lcd data
wire 	[1:0]   state_number;
wire			Bird_dead; 
wire  [10:0]score0;

assign threshold=switch;

wire 		clk_lcd;
wire 		clk_cam;
wire 		clk_sccb;

wire        camera_wrreq;
wire        camera_wclk;
wire [15:0] camera_wrdat;
wire [19:0] camera_addr;
wire [23:0] data_ycbcr;
wire [7 :0] data_gray;
reg 		init_state;
wire 		init_ready;
wire 		sda_oe;
wire 		sda;
wire 		sda_in;
wire 		scl;
//picture
wire [7:0]	binary;
//button
//seg4

//lcd display
wire [10:0] hsync_cnt;
wire [10:0] vsync_cnt;
wire 		vga_rden;
wire [15:0]	vga_rddat;	//lcd read
wire [15:0]	vga_rdaddr;

assign cam_soid = (sda_oe == 1'b1) ? sda : 1'bz;
assign sda_in 	= cam_soid;
assign cam_soic = scl;
assign cam_pwdn = 1'b0;
assign cam_rst 	= rst_n;
wire birdfly_enable;

//VGA driver timing
Driver u1_Driver
(
// Input
	.clk			(clk_lcd				),		
	.rst_n			(rst_n					),  
	.lcd_data		(lcd_data				),
// Output 	
	.lcd_dclk		(vga_clk				),		    	
	.lcd_hs			(vga_hs					),		
	.lcd_vs			(vga_vs					),
	.lcd_en			(vga_de					),		
	.lcd_rgb		({vga_r, vga_g ,vga_b}	),	
	.lcd_xpos		(lcd_xpos				),	
	.lcd_ypos		(lcd_ypos				),
	.addr			(vga_rdaddr				),
	.img_ack		(vga_rden				)
);

//lcd data simulation
Display	u2_Display
(
// Input
	.key1			(key2			),
	.key2			(birdfly_enable	),
	.state_number   (state_number   ),
	.clk			(vga_clk		),		
	.rst			(rst_n			), 	
	.lcd_xpos		(lcd_xpos		),	
	.lcd_ypos		(lcd_ypos		),
	.bin_data		(data_gray		),
// Output 	
	.lcd_data		(lcd_data		),
	.Bird_dead      (Bird_dead		),
	.score0			(score0			)
);
Top_logic u3_Top_Logic
(
	// Input
	.clk			(vga_clk		),
	.rst			(rst_n			),
	.start_button   (key2			),
	.restart_button (key3			),
	.dead			(Bird_dead		),
	//output
	.state_number   (state_number   )   
	);

/*******************************/
rgb2ycbcr u_2ycbcr(
    .clk        (vga_clk	),
    .rst_n      (rst_n      ),
    .data_rgb   (vga_rddat  ),
    .data_ycbcr (data_ycbcr )
);


ycbcr2gray2binary u_2gray( 
    .clk         (vga_clk			),
    .rst_n       (rst_n				),

	 .threshold	 (switch			),

    .data_cbcr   (data_ycbcr[15:0]	),
	
    .data_binary (data_gray			)
);
/*******************************/

// seg4
// #(
// 	.CNT_TIME ( 2400_000) //0.1s
// )
// u_seg4
// ( 
// 	.clk_24m(clk_24m),  
// 	.rst_n(rst_n),
// 	.num(switch),
//     .sm_seg(sm_seg),//output	wire [7:0] 
//     .sm_bit(sm_bit)//output	wire [3:0] 
// );

pll u_pll(
	.refclk(clk_24m),		//24M
	.clk0_out(clk_lcd),		//25M,VGA clk
	.clk1_out(clk_cam),		//12m,for cam xclk
	.clk2_out(clk_sccb)		//4m,for sccb init
);

camera_init u_camera_init
(
	.clk(clk_sccb),
	.reset_n(rst_n),
	.ready(init_ready),
	.sda_oe(sda_oe),
	.sda(sda),
	.sda_in(sda_in),
	.scl(scl)
);

camera_reader u_camera_reader
(
	.clk		(clk_cam		),
	.reset_n	(rst_n			),
	.csi_xclk	(cam_xclk		),
	.csi_pclk	(cam_pclk		),
	.csi_data	(cam_data		),
	.csi_vsync	(!cam_vsync		),
	.csi_hsync	(cam_href		),
	.data_out	(camera_wrdat	),
	.wrreq		(camera_wrreq	),
	.wrclk		(camera_wclk	),
	.wraddr		(camera_addr	)
);

img_cache u_img 
( 
	//write 45000*8
	.dia		(camera_wrdat	), 
	.addra		(camera_addr[15:0]	), 
	.cea		(camera_wrreq	), 
	.clka		(camera_wclk	), 
	.rsta		(!rst_n			), 
	//read 22500*16
	.dob		(vga_rddat		), 
	.addrb		(vga_rdaddr		), 
	.ceb		(vga_rden		),
	.clkb		(clk_lcd		), 
	.rstb		(!rst_n			)
);

process u_pro
(
	.clk		(vga_clk		),
	.rst		(rst_n			),
	.x_pos		(lcd_xpos		),
	.y_pos		(lcd_ypos		),
	.data_in    (lcd_data[7:0]	),
	//output
	.birdfly_enable (birdfly_enable)
);
	assign led=birdfly_enable;

//wire define
wire    [19:0]  data;                 // �������ʾ����ֵ
wire    [ 5:0]  point;                // �����С�����λ��
wire            en;                   // �������ʾʹ���ź�
wire            sign;                 // �������ʾ���ݵķ���λ



count u_count(
    .clk           (clk_24m  ),       // ʱ���ź�
    .rst_n         (rst_n),       // ��λ�ź�

    .data          (data     ),       // 6λ�����Ҫ��ʾ����ֵ
    .point         (point    ),       // С���������ʾ��λ��,�ߵ�ƽ��Ч
    .en            (en       ),       // �����ʹ���ź�
    .sign          (sign     )        // ����λ
);
//����ܶ�̬��ʾģ��
seg_led u_seg_led(
    .clk           (clk_24m  ),       // ʱ���ź�
    .rst_n         (rst_n),       // ��λ�ź�

    .data          (score0     ),       // ��ʾ����ֵ
    .point         (point    ),       // С���������ʾ��λ��,�ߵ�ƽ��Ч
    .en            (en       ),       // �����ʹ���ź�
    .sign          (sign     ),       // ����λ���ߵ�ƽ��ʾ����(-)
    
    .seg_sel       (seg_sel  ),       // λѡ
    .seg_led       (seg_led  )        // ��ѡ
);

endmodule
