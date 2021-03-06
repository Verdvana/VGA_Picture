`include "vga_para.v"

module vga_display(
							input       clk_25m,
							input       rst_n,
							
							input  [10:0] vga_xpos,
							input  [10:0] vga_ypos,
							
							//output reg [23:0] vga_data 
							output  [23:0] vga_data 
							
);
/*

`define RED      24'hff0000
`define GREEN    24'h00ff00
`define BLUE     24'h0000ff
`define WHITE    24'hffffff
`define BLACK    24'h000000
`define YELLOW   24'hffff00
`define CYAN     24'hff00ff
`define ROYAL    24'h00ffff

always@(posedge clk_25m or negedge rst_n)
begin
	if(!rst_n)
		vga_data <= 24'h0;
	else
		begin
		if	(vga_ypos >= 0 && vga_ypos < (`V_DISP/8)*1)
			vga_data <= `RED;
		else if(vga_ypos >= (`V_DISP/8)*1 && vga_ypos < (`V_DISP/8)*2)
			vga_data <= `GREEN;
		else if(vga_ypos >= (`V_DISP/8)*2 && vga_ypos < (`V_DISP/8)*3)
			vga_data <= `BLUE;
		else if(vga_ypos >= (`V_DISP/8)*3 && vga_ypos < (`V_DISP/8)*4)
			vga_data <= `WHITE;
		else if(vga_ypos >= (`V_DISP/8)*4 && vga_ypos < (`V_DISP/8)*5)
			vga_data <= `BLACK;
		else if(vga_ypos >= (`V_DISP/8)*5 && vga_ypos < (`V_DISP/8)*6)
			vga_data <= `YELLOW;
		else if(vga_ypos >= (`V_DISP/8)*6 && vga_ypos < (`V_DISP/8)*7)
			vga_data <= `CYAN;
		else// if(vga_ypos >= (`V_DISP/8)*7 && vga_ypos < (`V_DISP/8)*8)
			vga_data <= `ROYAL;
		end
end
*/

wire    [23:0]      image_data;
wire    [16:0]      addr;
assign  addr = vga_xpos[10:1] + vga_ypos[10:1]*400;
ROM	ROM_inst (
	.address ( addr ),
	.clock ( clk_25m),
	.q ( image_data )
	);


//--------------------------------------------
//  lcd data output
assign  vga_data = image_data;
//assign  vga_data = {{image_data[15:11],3'b111},{image_data[10:5],2'b11},{image_data[4:0],3'b111}};

endmodule
