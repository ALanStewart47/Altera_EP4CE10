module top_led(
    input       sys_clk,
    input       sys_rst_n,

    input       key,
    output      led
);

wire key_value;
wire key_flag;


key_fliter  u_key_fliter(
    .sys_clk        (sys_clk),
    .sys_rst_n      (sys_rst_n),

    .key            (key),
    .key_flag       (key_flag),
    .key_value      (key_value)
);

led   u_led(
    .sys_clk        (sys_clk),
    .sys_rst_n      (sys_rst_n),

    .key_flag       (key_flag),
    .key_value      (key_value),
    .led            (led)
);

endmodule