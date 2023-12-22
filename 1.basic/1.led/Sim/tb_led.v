`timescale 1ns/1ns


module  tb_led;

parameter  T = 20;      //clock cycle ：20ns

reg sys_clk;
reg sys_rst_n;

wire    [3:0]   led;

//***********************************************
//               main code
//***********************************************

initial begin
    sys_clk     =   1'b0;
    sys_rst_n   =   1'b0;
    #(T+1)  sys_rst_n   =   1'b1;
end 

always  #(T/2)  sys_clk =   ~sys_clk;

led m_tb_led(
    .sys_clk    (sys_clk),
    .sys_rst_n  (sys_rst_n),
    .led        (led)
);

endmodule