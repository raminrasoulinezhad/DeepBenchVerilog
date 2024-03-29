// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module normalize_ap_int_ap_fixed_config16_0_0_0_0_0_0_0_0_0_0 (
        ap_ready,
        data_0_V_read,
        data_1_V_read,
        data_2_V_read,
        data_3_V_read,
        data_4_V_read,
        ap_return_0,
        ap_return_1,
        ap_return_2,
        ap_return_3,
        ap_return_4
);


output   ap_ready;
input  [6:0] data_0_V_read;
input  [6:0] data_1_V_read;
input  [6:0] data_2_V_read;
input  [6:0] data_3_V_read;
input  [6:0] data_4_V_read;
output  [7:0] ap_return_0;
output  [7:0] ap_return_1;
output  [7:0] ap_return_2;
output  [7:0] ap_return_3;
output  [7:0] ap_return_4;

wire  signed [7:0] OP1_V_fu_76_p1;
wire  signed [7:0] OP1_V_1_fu_86_p1;
wire   [7:0] p_Val2_s_fu_96_p3;
wire   [7:0] p_Val2_2_fu_110_p3;
wire  signed [7:0] OP1_V_4_fu_124_p1;
wire   [7:0] res_0_V_write_assign_fu_80_p2;
wire   [7:0] res_1_V_write_assign_fu_90_p2;
wire   [7:0] res_2_V_write_assign_fu_104_p2;
wire   [7:0] res_3_V_write_assign_fu_118_p2;
wire   [7:0] res_4_V_write_assign_fu_128_p2;

assign OP1_V_1_fu_86_p1 = $signed(data_1_V_read);

assign OP1_V_4_fu_124_p1 = $signed(data_4_V_read);

assign OP1_V_fu_76_p1 = $signed(data_0_V_read);

assign ap_ready = 1'b1;

assign ap_return_0 = res_0_V_write_assign_fu_80_p2;

assign ap_return_1 = res_1_V_write_assign_fu_90_p2;

assign ap_return_2 = res_2_V_write_assign_fu_104_p2;

assign ap_return_3 = res_3_V_write_assign_fu_118_p2;

assign ap_return_4 = res_4_V_write_assign_fu_128_p2;

assign p_Val2_2_fu_110_p3 = {{data_3_V_read}, {1'd0}};

assign p_Val2_s_fu_96_p3 = {{data_2_V_read}, {1'd0}};

assign res_0_V_write_assign_fu_80_p2 = ($signed(OP1_V_fu_76_p1) + $signed(8'd246));

assign res_1_V_write_assign_fu_90_p2 = ($signed(OP1_V_1_fu_86_p1) + $signed(8'd246));

assign res_2_V_write_assign_fu_104_p2 = ($signed(p_Val2_s_fu_96_p3) + $signed(8'd238));

assign res_3_V_write_assign_fu_118_p2 = ($signed(p_Val2_2_fu_110_p3) + $signed(8'd242));

assign res_4_V_write_assign_fu_128_p2 = ($signed(OP1_V_4_fu_124_p1) + $signed(8'd251));

endmodule //normalize_ap_int_ap_fixed_config16_0_0_0_0_0_0_0_0_0_0
