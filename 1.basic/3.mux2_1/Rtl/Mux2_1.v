module mux2_1 (
    input wire  in1,
    input wire  in2,
    input wire  sel,
    output  reg [0:0] out_1
);

always @(*) begin
    if(sel == 1'd1)
        out_1 = in1;

    else 
        out_1 = in2;
end
    
endmodule