module VGA_top(
    input                               sys_clk                    ,
    input                               rst_n                      ,
    input              [  23:0]         Data                       ,

    output                              p_clk                      ,
    output                              VGA_HA                     ,
    output                              VGA_VS                     ,
    output                              VGA_RGB                    ,
    output                              VGA_BLK                     
    );

wire                   [  11:0]         hcount                     ;
    //X坐标位置
wire                   [  11:0]         vcount                     ;
    //Y坐标位置
wire                                    VGA_BLK_r                  ;

wire                                    locked                      ;

VGA_clk instance_name
    (
    // Clock out ports
    .clk_out1(p_clk),     // output clk_out1
    // Status and control signals
    .reset(reset), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(sys_clk));      // input clk_in1




VGA u_VGA(
    .sys_clk  ( p_clk    ),
    .rst_n    ( locked   ),
    .Data     ( Data     ),
    .VGA_HS   ( VGA_HS   ),
    .VGA_VS   ( VGA_VS   ),
    .VGA_BLK  ( VGA_BLK  ),
    .VGA_RGB  ( VGA_RGB  ),
    .hcount   ( hcount   ),
    .vcount   ( vcount   ),
    .VGA_BLK_r  ( VGA_BLK_r  )
);

endmodule
