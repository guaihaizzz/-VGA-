//`define Resolutions_480x272     //时钟为9MHz
//`define Resolutions_640x480   //时钟为25.175MHz
//`define Resolutions_800x480   //时钟为33MHz
//`define Resolutions_800x600   //时钟为40MHz
//`define Resolutions_1024x768  //时钟为65MHz
//`define Resolutions_1280x720  //时钟为74.25MHz
`define Resolutions_1920x1080 //时钟为148.5MHz

`ifdef Resolutions_480x272
    `define H_Total_Time    525
    `define H_Right_Border  0
    `define H_Front_Porch   2
    `define H_Sync_Time     41
    `define H_Data_Time     480
    `define H_Back_Porch    2
    `define H_Left_Border   0

    `define V_Total_Time    286
    `define V_Bottom_Border 0
    `define V_Front_Porch   2    
    `define V_Sync_Time     10  
    `define V_Data_Time     272
    `define V_Back_Porch    2
    `define V_Top_Border    0

`elsif Resolutions_640x480
    `define H_Total_Time    12'd800
    `define H_Right_Border  12'd8
    `define H_Front_Porch   12'd8
    `define H_Sync_Time     12'd96
    `define H_Data_Time     12'd640
    `define H_Back_Porch    12'd40
    `define H_Left_Border   12'd8

    `define V_Total_Time    12'd525
    `define V_Bottom_Border 12'd8
    `define V_Front_Porch   12'd2
    `define V_Sync_Time     12'd2
    `define V_Data_Time     12'd480
    `define V_Back_Porch    12'd25
    `define V_Top_Border    12'd8

`elsif Resolutions_800x480
    `define H_Total_Time    12'd1056
    `define H_Right_Border  12'd0
    `define H_Front_Porch   12'd40
    `define H_Sync_Time     12'd128
    `define H_Data_Time     12'd800
    `define H_Back_Porch    12'd88
    `define H_Left_Border   12'd0

    `define V_Total_Time    12'd525
    `define V_Bottom_Border 12'd8
    `define V_Front_Porch   12'd2
    `define V_Sync_Time     12'd2
    `define V_Data_Time     12'd480
    `define V_Back_Porch    12'd25
    `define V_Top_Border    12'd8

`elsif Resolutions_800x600
    `define H_Total_Time    12'd1056
    `define H_Right_Border  12'd0
    `define H_Front_Porch   12'd40
    `define H_Sync_Time     12'd128
    `define H_Data_Time     12'd800
    `define H_Back_Porch    12'd83
    `define H_Left_Border   12'd0

    `define V_Total_Time    12'd628
    `define V_Bottom_Border 12'd0
    `define V_Front_Porch   12'd1
    `define V_Sync_Time     12'd4
    `define V_Data_Time     12'd600
    `define V_Back_Porch    12'd23
    `define V_Top_Border    12'd0

`elsif Resolutions_1024x768
    `define H_Total_Time    12'd1344
    `define H_Right_Border  12'd0
    `define H_Front_Porch   12'd24
    `define H_Sync_Time     12'd136
    `define H_Data_Time     12'd1024
    `define H_Back_Porch    12'd160
    `define H_Left_Border   12'd0

    `define V_Total_Time    12'd806
    `define V_Bottom_Border 12'd0
    `define V_Front_Porch   12'd3
    `define V_Sync_Time     12'd6
    `define V_Data_Time     12'd763
    `define V_Back_Porch    12'd29
    `define V_Top_Border    12'd0

`elsif Resolutions_1280x720
    `define H_Total_Time    12'd1650
    `define H_Right_Border  12'd0
    `define H_Front_Porch   12'd110
    `define H_Sync_Time     12'd40
    `define H_Data_Time     12'd1280
    `define H_Back_Porch    12'd220
    `define H_Left_Border   12'd0

    `define V_Total_Time    12'd750
    `define V_Bottom_Border 12'd0
    `define V_Front_Porch   12'd5
    `define V_Sync_Time     12'd5
    `define V_Data_Time     12'd720
    `define V_Back_Porch    12'd20
    `define V_Top_Border    12'd0

`elsif Resolutions_1920x1080
    `define H_Total_Time    12'd2200
    `define H_Right_Border  12'd0
    `define H_Front_Porch   12'd88
    `define H_Sync_Time     12'd44
    `define H_Data_Time     12'd1920
    `define H_Back_Porch    12'd148
    `define H_Left_Border   12'd0

    `define V_Total_Time    12'd1125
    `define V_Bottom_Border 12'd0
    `define V_Front_Porch   12'd4
    `define V_Sync_Time     12'd5
    `define V_Data_Time     12'd1080
    `define V_Back_Porch    12'd36
    `define V_Top_Border    12'd0

`endif 
