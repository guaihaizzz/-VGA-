module VGA(
    input                               sys_clk                    ,
    input                               rst_n                      ,
    input              [  23:0]         Data                       ,
    output reg                          VGA_HS                     ,
    output reg                          VGA_VS                     ,
    output reg                          VGA_BLK                    ,
    output reg         [  23:0]         VGA_RGB                    ,//(R[7:0],G[7:0],B[7:0])
    output reg         [  11:0]         hcount                     ,
    //X����λ��
    output reg         [  11:0]         vcount                     , 
    //Y����λ��
    output reg                          VGA_BLK_r                   
    );

// //TODO:���������rgbΪʱ������VGA_BLK��rgb���ݿ�һ�ġ����ź����ڸ�VGA_BLK����
//reg                                     VGA_BLK_r                  ;

`include "resolution_parameter.v"


//TODO:640*480�ֱ���
//HS_Begin;//��ͬ�����忪ʼ=0(pclk)
localparam   HS_End     = `H_Sync_Time                                               ;
localparam   Hdat_Begin = `H_Sync_Time+`H_Left_Border+`H_Back_Porch                 ;
localparam   Hdat_End   = `H_Sync_Time+`H_Left_Border+`H_Back_Porch+`H_Data_Time    ;
localparam   HSYNC_End  = `H_Total_Time                                              ;
localparam   VS_End     = `V_Sync_Time                                               ;
localparam   Vdat_Begin = `V_Sync_Time+`V_Back_Porch+`V_Top_Border                   ;
localparam   Vdat_End   = `V_Sync_Time+`V_Back_Porch+`V_Top_Border+`V_Data_Time      ;
localparam   VSYNC_End  = `V_Total_Time                                              ;


////�м�����
reg                    [  11:0]         h_cnt                      ;
always @(posedge sys_clk or negedge rst_n) begin
    if (!rst_n) begin
        h_cnt <= 0;
    end
    else if(h_cnt >= HSYNC_End - 1) begin
            h_cnt <= 0;
        end
        else
            h_cnt <= h_cnt+1'b1;
    end
//assign VGA_HS = (h_cnt < HS_End -1'b1) ? 0 : 1;
always@(posedge sys_clk)begin
    VGA_HS <= (h_cnt < HS_End) ? 0 : 1;
end


////��������
reg                    [  11:0]         v_cnt                      ;
always @(posedge sys_clk or negedge rst_n) begin
    if (!rst_n) begin
        v_cnt <= 0;
    end
    else if(h_cnt >= HSYNC_End - 1'b1) begin
            if(v_cnt >= VSYNC_End - 1'b1)
                v_cnt <= 0;
        else
            v_cnt <= v_cnt+1'b1;
        end       
            else
            v_cnt <= v_cnt;
    end
//assign VGA_VS = (v_cnt < VS_End -1'b1) ? 0 : 1;
always@(posedge sys_clk)begin
    VGA_VS <= (v_cnt < VS_End) ? 0 : 1;
end


////BLK��ʾ�����ʱ���
// //assign VGA_BLK = ((h_cnt>=Hdat_Begin-1'b1) && (h_cnt<Hdat_End-1'b1) && (v_cnt>=Vdat_Begin-1'b1) && (v_cnt<Vdat_End-1'b1))?1:0;
// always@(posedge sys_clk)begin
//     VGA_BLK <= ((h_cnt>=Hdat_Begin-1'b1) && (h_cnt<Hdat_End-1'b1) && (v_cnt>=Vdat_Begin-1'b1) && (v_cnt<Vdat_End))?1:0;
// end

// reg VGA_BLK_r;
always@(posedge sys_clk)begin
    VGA_BLK_r <= ((h_cnt>=Hdat_Begin-1'b1) && (h_cnt<Hdat_End-1'b1) && (v_cnt>=Vdat_Begin) && (v_cnt<Vdat_End))?1:0;
end
//��VGA_BLK����
always @(posedge sys_clk) begin
    VGA_BLK <= VGA_BLK_r;
end

////���rgb����
//assign VGA_RGB = VGA_BLK ? Data : 0;
always@(posedge sys_clk)begin
    VGA_RGB <= VGA_BLK_r ? Data : 0;
end


always@(posedge sys_clk)begin
    hcount <= VGA_BLK_r ? (h_cnt - Hdat_Begin) : 0;
end
always@(posedge sys_clk)begin
    vcount <= VGA_BLK_r ? (v_cnt - Vdat_Begin) : 0;
end



endmodule
