

module ycbcr2gray2binary( 
    input clk,
    input rst_n,

    

    input [15:0] data_cbcr,
    input [7:0]threshold,
    output [7:0] data_binary
);

/*******************************************************************
��һ���ּ���ָ������ʽ

x = 7880 + 22*cb^2>>6 + 15*cr^2>>6 - 8*cb*cr^2>>6 - 68*cb - 51*cr

7880 = 123*2^6 + 8

���x>320, x=320, ��xʵ��ֵ�Ŵ�64����Ϊ9λ����
*******************************************************************/
//ȡcbcr����
wire [7:0] data_cb;
wire [7:0] data_cr;
//cb^2, cr^2, cb*cr�����м����
reg [15:0] cb2;
reg [15:0] cr2;
reg [15:0] cbcr;
//����ϵ������м����
reg [20:0] cb2_t;
reg [20:0] cr2_t;
reg [20:0] cbcr_t;
reg [14:0] cb_t;
reg [14:0] cr_t;
//��ͺ��м����
reg [15:0] cb_cr_t;
reg [20:0] neg_sum;
reg [20:0] pos_sum;
//��һ�����
reg [8:0] x;


assign data_cb = data_cbcr[15:8];
assign data_cr = data_cbcr[7:0];

//��һ����ˮ��
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        cb2  <= 16'd0;
        cr2  <= 16'd0;
        cbcr <= 16'd0;
        cb_t   <= 15'd0;
        cr_t   <= 15'd0;
    end
    else begin
        cb2  <= data_cb*data_cb;
        cr2  <= data_cr*data_cr;
        cbcr <= data_cb*data_cr;
        cb_t <= 7'd68*data_cb;
        cr_t <= 7'd51*data_cr;
    end
end

//�ڶ�����ˮ��
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        cb2_t   <= 21'd0;
        cr2_t   <= 21'd0;
        cbcr_t  <= 21'd0;
    end
    else begin
        cb2_t   <= 5'd22*cb2;
        cr2_t   <= 5'd15*cr2;
        cbcr_t  <= 5'd8*cbcr;
        cb_cr_t <= cb_t + cr_t;
    end
end

//����ʽ֮���м����
wire [15:0] temp;
assign temp = (cb2_t[20:6] + cr2_t[20:6] + 13'd7880) - (cbcr_t[20:6] + cb_cr_t);

//��������ˮ��
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        x   <= 9'd0;
    end
    else begin
        //���Ĳ���֮�ͱȸ��Ĳ��ִ�320
        if( temp > 320 )
            x <= 9'd320;
        else begin
            x <= temp[8:0];
        end
    end
end

/*******************************************************************
�ڶ����ּ�����

data_gray = 238 - 7*x^3>>1 + 86x^2>>1 - 175x
*******************************************************************/
//
reg [17:0] x3;
reg [17:0] x2;

//
reg [8:0]  x_t0;
reg [8:0]  x_t1;
reg [17:0] x_t2;
reg [8:0]  x2_t0;
reg [17:0] x2_t1;
reg [17:0] x3_t;
//
reg [7:0] data_gray;
reg [7:0] data_binary1;


//���ļ���ˮ��
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        x2   <= 18'd0;
        x_t0 <= 18'd0;
    end
    else begin
        x2   <= x*x;
        x_t0 <= x;
    end
end

//���弶��ˮ��
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        x3    <= 18'd0;
        x2_t0 <= 9'd0;
        x_t1  <= 9'd0;
    end
    else begin
        x3    <= x_t0*x2[17:9];
        x2_t0 <= x2[17:9];
        x_t1  <= x_t0;
    end
end

//��������ˮ��
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        x3_t   <= 18'd0;
        x2_t1  <= 18'd0;
        x_t2   <= 18'd0;
    end
    else begin
        x3_t   <= 3'd7*x3[17:9];
        x2_t1  <= 7'd86*x2_t0;
        x_t2   <= 8'd175*x_t1;
    end
end

//���
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        data_gray <= 0;
    end
    else begin
        data_gray <= 8'd238 - x3_t[17:1] + x2_t1[17:4] - x_t2[17:6];
    end
end

//ͨ������������ֵ�ָ�
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        data_binary1 <= 0;
    end
    else 
    if(data_gray > threshold)
        data_binary1 <= 8'h00;
    else
        data_binary1 <= 8'hff;
end

assign data_binary = data_binary1;
// assign data_gray = post_frame_hsync ? data_gray1: 24'd0;

endmodule