//Key contrl led 

module key_led(
    input               sys_clk,
    input               sys_rst_n,
    input       [3:0]   key,
    output   reg   [3:0]   led
);

reg [23:0]  time_cnt;
reg [1:0]   led_contrl;


//0.2s timer
always @ (posedge sys_clk or negedge  sys_rst_n)  begin
    if(!sys_rst_n)
        time_cnt <=	24'd9_999_999;
    else if (time_cnt<24'd9_999_999)
        time_cnt <=	time_cnt + 2'd1;
    else
        time_cnt <=0;
end

always @(posedge sys_clk or negedge sys_rst_n)  begin
    if(!sys_rst_n)
        led_contrl <=2'b00;

    else if(time_cnt	==	24'd9_999_999)    
        led_contrl  <=  led_contrl + 1;
    else
        led_contrl  <=   led_contrl;
end

always @(posedge sys_clk or negedge sys_rst_n)  begin
    if(!sys_rst_n) begin
          led<=4'b 0000;
    end


    else if(key[0]==0)
        case (led_contrl)
            2'b00   :   led<=4'b1001;
            2'b01   :   led<=4'b0110;
            2'b10   :   led<=4'b0110;
            2'b11   :   led<=4'b1001; 
            default:    led<=4'b0000;
        endcase

    else if(key[1]==0)
        case (led_contrl)
            2'b00   : led<=4'b0001;
            2'b01   : led<=4'b0010;
            2'b10   : led<=4'b0100;
            2'b11   : led<=4'b1000;
            default  : led<=4'b0000;
        endcase

    else if (key[2]==0)  //按键3按下时，LED闪烁
        case (led_contrl)
            2'b00   : led<=4'b1111;
            2'b01   : led<=4'b0000;
            2'b10   : led<=4'b1111;
            2'b11   : led<=4'b0000;
            default  : led<=4'b0000;
        endcase
    else if (key[3]==0)  //按键4按下时，LED全亮
        led=4'b1111;
    else
        led<=4'b0000;    //无按键按下时，LED熄灭     
    

end

endmodule
