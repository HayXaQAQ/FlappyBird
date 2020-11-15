    `timescale 1ns/1ns
module Top_logic #
(
    //格雷码状态编�
    parameter start_scene = 2'b00,
    parameter gameplay_scene = 2'b01,
    //parameter pause_scene = 2'b11,
    parameter gameover_scene = 2'b10 //无尽所以无法通关
)
(
    input clk,
    input rst,
    input start_button,          //开始按�
    //input pause_button,          //暂停按键
    //input continue_button,       //继续按键
    input restart_button,        //重新开始按�
    input quit_button,           //退出到标题界面按键
    input dead,                  //小鸟死亡
    
    output reg[1:0] state_number
);

reg[1:0] state, next_state;


always @(posedge clk or negedge rst) begin
    if(!rst) state <= start_scene;
    else state <= next_state;
end

always @(*) begin
    begin
        case(state)
            start_scene:begin
               if(!start_button) next_state <= gameplay_scene; 
               else             next_state <= start_scene;
            end 

            gameplay_scene:begin
               if(dead)                 next_state <= gameover_scene;
               else if(!restart_button)  next_state <= start_scene;
               else                     next_state <= gameplay_scene; 
            end

            /*
            pause_scene:begin
                if(continue_button)     next_state <= gameplay_scene;
                else if(quit_button)    next_state <= start_scene;
                else                    next_state <= pause_scene;
            end
            */

            gameover_scene:begin
                if(!restart_button)      next_state <=start_scene;
                else                    next_state <= gameover_scene;    
            end

            default: next_state <= start_scene;
        endcase
    end
end

always @(*) begin
    case(state)
        start_scene:    state_number <= 2'b00;
        gameplay_scene: state_number <= 2'b01;
        //pause_scene:    state_number <= 2'b11;
        gameover_scene: state_number <= 2'b10;
        default:        state_number <= 2'b00;
    endcase
end


endmodule  //Top_logic
