
module rgb2ycbcr( 
    input clk,
    input rst_n,
    input [15:0] data_rgb,

    output [23:0] data_ycbcr
);



/******************************************************/

wire [7:0] data_r;
wire [7:0] data_g;
wire [7:0] data_b;

//�м����
reg [15:0] data_y_t1 , data_y_t2 , data_y_t3 ;
reg [14:0] data_cb_t1, data_cb_t2, data_cb_t3;
reg [14:0] data_cr_t1, data_cr_t2, data_cr_t3;
reg [15:0] data_y ;
reg [15:0] data_cb;
reg [15:0] data_cr;

//rgb565תrgb888
assign data_r = {data_rgb[15:11], data_rgb[15:13]};
assign data_g = {data_rgb[10:5], data_rgb[10:9]};
assign data_b = {data_rgb[4:0], data_rgb[4:2]};

/************************************************
Y  = (77R  + 150G + 29B )>>8

Cr = (-43R - 85G  + 128B + 32768)>>8

Cb = (128R - 107G - 21B  + 32768)>>8
************************************************/
//�����һ�γ˷�
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        data_y_t1  <= 0;
        data_y_t2  <= 0;
        data_y_t3  <= 0;
        data_cb_t1 <= 0;
        data_cb_t2 <= 0;
        data_cb_t3 <= 0;
        data_cr_t1 <= 0;
        data_cr_t2 <= 0;
        data_cr_t3 <= 0;
    end
    else begin
        data_y_t1  <= 77  * data_r;
        data_y_t2  <= 150 * data_g;
        data_y_t3  <= 29  * data_b;
        data_cb_t1 <= 43  * data_r;
        data_cb_t2 <= 85  * data_g;
        data_cb_t3 <= 128 * data_b;
        data_cr_t1 <= 128 * data_r;
        data_cr_t2 <= 107 * data_g;
        data_cr_t3 <= 21  * data_b;
    end
end

//�˷�������
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        data_y  <= 0;
        data_cb <= 0;
        data_cr <= 0;
    end
    else begin
        data_y  <= data_y_t1 + data_y_t2 + data_y_t3;
        data_cb <= 16'd32768 - data_cb_t1 - data_cb_t2 + data_cb_t3;
        data_cr <= 16'd32768 + data_cr_t1 - data_cr_t2 - data_cr_t3;
    end
end

assign data_ycbcr = {data_y[15:8], data_cb[15:8], data_cr[15:8]};


endmodule
