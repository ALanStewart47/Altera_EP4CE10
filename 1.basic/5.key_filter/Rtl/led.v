
module led(
    input       sys_clk,
    input       sys_rst_n,

    input       key_flag,
    input       key_value,
    output   reg   led
);

always @(posedge sys_clk  or negedge sys_rst_n )begin
    if(!sys_rst_n)
        led <= 1'b1;
    else if (key_flag && (~key_value))
        led <= ~led;
end

endmodule
