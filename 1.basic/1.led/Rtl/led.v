// led flow

module led (
    input              sys_rst_n,
    input              sys_clk,

    output  reg[3:0]    led
);

reg [23:0]  time_counter;


always @(posedge sys_clk or negedge sys_rst_n) begin
    if (sys_rst_n==0) begin
        time_counter <= 24'd0;
    end 
    
    else if(time_counter < 24'd499_9999)
        time_counter <= time_counter+1'd1;

    else
        time_counter <= 24'd0;
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n == 0) begin
        led <= 4'b0001;
		end
    else if(time_counter == 24'd499_9999)
        led[3:0]    <=  {led[2:0],led[3]};
    else
        led <= led;
end
    
endmodule