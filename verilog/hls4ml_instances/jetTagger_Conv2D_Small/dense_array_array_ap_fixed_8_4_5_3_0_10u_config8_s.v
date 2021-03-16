// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module dense_array_array_ap_fixed_8_4_5_3_0_10u_config8_s (
        ap_clk,
        ap_rst,
        ap_start,
        start_full_n,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        start_out,
        start_write,
        data_stream_V_data_0_V_dout,
        data_stream_V_data_0_V_empty_n,
        data_stream_V_data_0_V_read,
        data_stream_V_data_1_V_dout,
        data_stream_V_data_1_V_empty_n,
        data_stream_V_data_1_V_read,
        res_stream_V_data_0_V_din,
        res_stream_V_data_0_V_full_n,
        res_stream_V_data_0_V_write,
        res_stream_V_data_1_V_din,
        res_stream_V_data_1_V_full_n,
        res_stream_V_data_1_V_write,
        res_stream_V_data_2_V_din,
        res_stream_V_data_2_V_full_n,
        res_stream_V_data_2_V_write,
        res_stream_V_data_3_V_din,
        res_stream_V_data_3_V_full_n,
        res_stream_V_data_3_V_write,
        res_stream_V_data_4_V_din,
        res_stream_V_data_4_V_full_n,
        res_stream_V_data_4_V_write,
        res_stream_V_data_5_V_din,
        res_stream_V_data_5_V_full_n,
        res_stream_V_data_5_V_write,
        res_stream_V_data_6_V_din,
        res_stream_V_data_6_V_full_n,
        res_stream_V_data_6_V_write,
        res_stream_V_data_7_V_din,
        res_stream_V_data_7_V_full_n,
        res_stream_V_data_7_V_write,
        res_stream_V_data_8_V_din,
        res_stream_V_data_8_V_full_n,
        res_stream_V_data_8_V_write,
        res_stream_V_data_9_V_din,
        res_stream_V_data_9_V_full_n,
        res_stream_V_data_9_V_write
);

parameter    ap_ST_fsm_state1 = 6'd1;
parameter    ap_ST_fsm_pp0_stage0 = 6'd2;
parameter    ap_ST_fsm_state4 = 6'd4;
parameter    ap_ST_fsm_state5 = 6'd8;
parameter    ap_ST_fsm_state6 = 6'd16;
parameter    ap_ST_fsm_state7 = 6'd32;

input   ap_clk;
input   ap_rst;
input   ap_start;
input   start_full_n;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output   start_out;
output   start_write;
input  [7:0] data_stream_V_data_0_V_dout;
input   data_stream_V_data_0_V_empty_n;
output   data_stream_V_data_0_V_read;
input  [7:0] data_stream_V_data_1_V_dout;
input   data_stream_V_data_1_V_empty_n;
output   data_stream_V_data_1_V_read;
output  [7:0] res_stream_V_data_0_V_din;
input   res_stream_V_data_0_V_full_n;
output   res_stream_V_data_0_V_write;
output  [7:0] res_stream_V_data_1_V_din;
input   res_stream_V_data_1_V_full_n;
output   res_stream_V_data_1_V_write;
output  [7:0] res_stream_V_data_2_V_din;
input   res_stream_V_data_2_V_full_n;
output   res_stream_V_data_2_V_write;
output  [7:0] res_stream_V_data_3_V_din;
input   res_stream_V_data_3_V_full_n;
output   res_stream_V_data_3_V_write;
output  [7:0] res_stream_V_data_4_V_din;
input   res_stream_V_data_4_V_full_n;
output   res_stream_V_data_4_V_write;
output  [7:0] res_stream_V_data_5_V_din;
input   res_stream_V_data_5_V_full_n;
output   res_stream_V_data_5_V_write;
output  [7:0] res_stream_V_data_6_V_din;
input   res_stream_V_data_6_V_full_n;
output   res_stream_V_data_6_V_write;
output  [7:0] res_stream_V_data_7_V_din;
input   res_stream_V_data_7_V_full_n;
output   res_stream_V_data_7_V_write;
output  [7:0] res_stream_V_data_8_V_din;
input   res_stream_V_data_8_V_full_n;
output   res_stream_V_data_8_V_write;
output  [7:0] res_stream_V_data_9_V_din;
input   res_stream_V_data_9_V_full_n;
output   res_stream_V_data_9_V_write;

reg ap_done;
reg ap_idle;
reg start_write;

reg    real_start;
reg    start_once_reg;
reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    internal_ap_ready;
reg    data_stream_V_data_0_V_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg    data_stream_V_data_1_V_blk_n;
reg    res_stream_V_data_0_V_blk_n;
wire    ap_CS_fsm_state7;
reg    res_stream_V_data_1_V_blk_n;
reg    res_stream_V_data_2_V_blk_n;
reg    res_stream_V_data_3_V_blk_n;
reg    res_stream_V_data_4_V_blk_n;
reg    res_stream_V_data_5_V_blk_n;
reg    res_stream_V_data_6_V_blk_n;
reg    res_stream_V_data_7_V_blk_n;
reg    res_stream_V_data_8_V_blk_n;
reg    res_stream_V_data_9_V_blk_n;
reg   [4:0] i_in_reg_500;
wire   [0:0] tmp_fu_566_p2;
reg   [0:0] tmp_reg_1386;
wire    ap_block_state2_pp0_stage0_iter0;
wire    data_stream_V_data_0_V0_status;
reg    ap_block_state3_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_11001;
wire   [4:0] i_in_1_fu_572_p2;
reg   [4:0] i_in_1_reg_1390;
reg    ap_enable_reg_pp0_iter0;
wire    ap_CS_fsm_state4;
reg    ap_block_state1;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
wire   [7:0] grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_0;
wire   [7:0] grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_1;
wire   [7:0] grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_2;
wire   [7:0] grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_3;
wire   [7:0] grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_4;
wire   [7:0] grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_5;
wire   [7:0] grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_6;
wire   [7:0] grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_7;
wire   [7:0] grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_8;
wire   [7:0] grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_9;
reg   [4:0] ap_phi_mux_i_in_phi_fu_504_p4;
reg    data_stream_V_data_0_V0_update;
reg    res_stream_V_data_0_V1_update;
wire    res_stream_V_data_0_V1_status;
reg   [7:0] tmp_data_0_V_fu_258;
reg   [7:0] tmp_data_1_V_fu_262;
reg   [7:0] tmp_data_0_V_2_fu_266;
reg   [7:0] tmp_data_1_V_2_fu_270;
reg   [7:0] tmp_data_0_V_3_fu_274;
reg   [7:0] tmp_data_1_V_3_fu_278;
reg   [7:0] tmp_data_0_V_4_fu_282;
reg   [7:0] tmp_data_1_V_4_fu_286;
reg   [7:0] tmp_data_0_V_5_fu_290;
reg   [7:0] tmp_data_1_V_5_fu_294;
reg   [7:0] tmp_data_0_V_6_fu_298;
reg   [7:0] tmp_data_1_V_6_fu_302;
reg   [7:0] tmp_data_0_V_7_fu_306;
reg   [7:0] tmp_data_1_V_7_fu_310;
reg   [7:0] tmp_data_0_V_8_fu_314;
reg   [7:0] tmp_data_1_V_8_fu_318;
reg   [7:0] tmp_data_0_V_9_fu_322;
reg   [7:0] tmp_data_1_V_9_fu_326;
reg   [7:0] tmp_data_0_V_10_fu_330;
reg   [7:0] tmp_data_1_V_10_fu_334;
reg   [7:0] tmp_data_0_V_11_fu_338;
reg   [7:0] tmp_data_1_V_11_fu_342;
reg   [7:0] tmp_data_0_V_12_fu_346;
reg   [7:0] tmp_data_1_V_12_fu_350;
reg   [7:0] tmp_data_0_V_13_fu_354;
reg   [7:0] tmp_data_1_V_13_fu_358;
reg   [7:0] tmp_data_0_V_14_fu_362;
reg   [7:0] tmp_data_1_V_14_fu_366;
reg   [7:0] tmp_data_0_V_15_fu_370;
reg   [7:0] tmp_data_1_V_15_fu_374;
reg   [7:0] tmp_data_0_V_16_fu_378;
reg   [7:0] tmp_data_1_V_16_fu_382;
reg   [7:0] tmp_data_0_V_17_fu_386;
reg   [7:0] tmp_data_1_V_17_fu_390;
reg   [7:0] tmp_data_0_V_18_fu_394;
reg   [7:0] tmp_data_1_V_18_fu_398;
reg   [7:0] tmp_data_0_V_19_fu_402;
reg   [7:0] tmp_data_1_V_19_fu_406;
reg   [7:0] tmp_data_0_V_20_fu_410;
reg   [7:0] tmp_data_1_V_20_fu_414;
reg   [7:0] tmp_data_0_V_21_fu_418;
reg   [7:0] tmp_data_1_V_21_fu_422;
reg   [7:0] tmp_data_0_V_22_fu_426;
reg   [7:0] tmp_data_1_V_22_fu_430;
reg   [7:0] tmp_data_0_V_23_fu_434;
reg   [7:0] tmp_data_1_V_23_fu_438;
reg   [7:0] tmp_data_0_V_24_fu_442;
reg   [7:0] tmp_data_1_V_24_fu_446;
reg   [7:0] tmp_data_0_V_25_fu_450;
reg   [7:0] tmp_data_1_V_25_fu_454;
reg   [5:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 6'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
end

dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_0_V_read(tmp_data_0_V_fu_258),
    .data_1_V_read(tmp_data_1_V_fu_262),
    .data_2_V_read(tmp_data_0_V_2_fu_266),
    .data_3_V_read(tmp_data_1_V_2_fu_270),
    .data_4_V_read(tmp_data_0_V_3_fu_274),
    .data_5_V_read(tmp_data_1_V_3_fu_278),
    .data_6_V_read(tmp_data_0_V_4_fu_282),
    .data_7_V_read(tmp_data_1_V_4_fu_286),
    .data_8_V_read(tmp_data_0_V_5_fu_290),
    .data_9_V_read(tmp_data_1_V_5_fu_294),
    .data_10_V_read(tmp_data_0_V_6_fu_298),
    .data_11_V_read(tmp_data_1_V_6_fu_302),
    .data_12_V_read(tmp_data_0_V_7_fu_306),
    .data_13_V_read(tmp_data_1_V_7_fu_310),
    .data_14_V_read(tmp_data_0_V_8_fu_314),
    .data_15_V_read(tmp_data_1_V_8_fu_318),
    .data_16_V_read(tmp_data_0_V_9_fu_322),
    .data_17_V_read(tmp_data_1_V_9_fu_326),
    .data_18_V_read(tmp_data_0_V_10_fu_330),
    .data_19_V_read(tmp_data_1_V_10_fu_334),
    .data_20_V_read(tmp_data_0_V_11_fu_338),
    .data_21_V_read(tmp_data_1_V_11_fu_342),
    .data_22_V_read(tmp_data_0_V_12_fu_346),
    .data_23_V_read(tmp_data_1_V_12_fu_350),
    .data_24_V_read(tmp_data_0_V_13_fu_354),
    .data_25_V_read(tmp_data_1_V_13_fu_358),
    .data_26_V_read(tmp_data_0_V_14_fu_362),
    .data_27_V_read(tmp_data_1_V_14_fu_366),
    .data_28_V_read(tmp_data_0_V_15_fu_370),
    .data_29_V_read(tmp_data_1_V_15_fu_374),
    .data_30_V_read(tmp_data_0_V_16_fu_378),
    .data_31_V_read(tmp_data_1_V_16_fu_382),
    .data_32_V_read(tmp_data_0_V_17_fu_386),
    .data_33_V_read(tmp_data_1_V_17_fu_390),
    .data_34_V_read(tmp_data_0_V_18_fu_394),
    .data_35_V_read(tmp_data_1_V_18_fu_398),
    .data_36_V_read(tmp_data_0_V_19_fu_402),
    .data_37_V_read(tmp_data_1_V_19_fu_406),
    .data_38_V_read(tmp_data_0_V_20_fu_410),
    .data_39_V_read(tmp_data_1_V_20_fu_414),
    .data_40_V_read(tmp_data_0_V_21_fu_418),
    .data_41_V_read(tmp_data_1_V_21_fu_422),
    .data_42_V_read(tmp_data_0_V_22_fu_426),
    .data_43_V_read(tmp_data_1_V_22_fu_430),
    .data_44_V_read(tmp_data_0_V_23_fu_434),
    .data_45_V_read(tmp_data_1_V_23_fu_438),
    .data_46_V_read(tmp_data_0_V_24_fu_442),
    .data_47_V_read(tmp_data_1_V_24_fu_446),
    .data_48_V_read(tmp_data_0_V_25_fu_450),
    .data_49_V_read(tmp_data_1_V_25_fu_454),
    .ap_return_0(grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_0),
    .ap_return_1(grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_1),
    .ap_return_2(grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_2),
    .ap_return_3(grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_3),
    .ap_return_4(grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_4),
    .ap_return_5(grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_5),
    .ap_return_6(grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_6),
    .ap_return_7(grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_7),
    .ap_return_8(grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_8),
    .ap_return_9(grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_9)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((res_stream_V_data_0_V1_status == 1'b1) & (1'b1 == ap_CS_fsm_state7))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state2))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state2))) begin
            ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        start_once_reg <= 1'b0;
    end else begin
        if (((internal_ap_ready == 1'b0) & (real_start == 1'b1))) begin
            start_once_reg <= 1'b1;
        end else if ((internal_ap_ready == 1'b1)) begin
            start_once_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (tmp_reg_1386 == 1'd0))) begin
        i_in_reg_500 <= i_in_1_reg_1390;
    end else if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        i_in_reg_500 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        i_in_1_reg_1390 <= i_in_1_fu_572_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (i_in_reg_500 == 5'd9))) begin
        tmp_data_0_V_10_fu_330 <= data_stream_V_data_0_V_dout;
        tmp_data_1_V_10_fu_334 <= data_stream_V_data_1_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (i_in_reg_500 == 5'd10))) begin
        tmp_data_0_V_11_fu_338 <= data_stream_V_data_0_V_dout;
        tmp_data_1_V_11_fu_342 <= data_stream_V_data_1_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (i_in_reg_500 == 5'd11))) begin
        tmp_data_0_V_12_fu_346 <= data_stream_V_data_0_V_dout;
        tmp_data_1_V_12_fu_350 <= data_stream_V_data_1_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (i_in_reg_500 == 5'd12))) begin
        tmp_data_0_V_13_fu_354 <= data_stream_V_data_0_V_dout;
        tmp_data_1_V_13_fu_358 <= data_stream_V_data_1_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (i_in_reg_500 == 5'd13))) begin
        tmp_data_0_V_14_fu_362 <= data_stream_V_data_0_V_dout;
        tmp_data_1_V_14_fu_366 <= data_stream_V_data_1_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (i_in_reg_500 == 5'd14))) begin
        tmp_data_0_V_15_fu_370 <= data_stream_V_data_0_V_dout;
        tmp_data_1_V_15_fu_374 <= data_stream_V_data_1_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (i_in_reg_500 == 5'd15))) begin
        tmp_data_0_V_16_fu_378 <= data_stream_V_data_0_V_dout;
        tmp_data_1_V_16_fu_382 <= data_stream_V_data_1_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (i_in_reg_500 == 5'd16))) begin
        tmp_data_0_V_17_fu_386 <= data_stream_V_data_0_V_dout;
        tmp_data_1_V_17_fu_390 <= data_stream_V_data_1_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (i_in_reg_500 == 5'd17))) begin
        tmp_data_0_V_18_fu_394 <= data_stream_V_data_0_V_dout;
        tmp_data_1_V_18_fu_398 <= data_stream_V_data_1_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (i_in_reg_500 == 5'd18))) begin
        tmp_data_0_V_19_fu_402 <= data_stream_V_data_0_V_dout;
        tmp_data_1_V_19_fu_406 <= data_stream_V_data_1_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (i_in_reg_500 == 5'd19))) begin
        tmp_data_0_V_20_fu_410 <= data_stream_V_data_0_V_dout;
        tmp_data_1_V_20_fu_414 <= data_stream_V_data_1_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (i_in_reg_500 == 5'd20))) begin
        tmp_data_0_V_21_fu_418 <= data_stream_V_data_0_V_dout;
        tmp_data_1_V_21_fu_422 <= data_stream_V_data_1_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (i_in_reg_500 == 5'd21))) begin
        tmp_data_0_V_22_fu_426 <= data_stream_V_data_0_V_dout;
        tmp_data_1_V_22_fu_430 <= data_stream_V_data_1_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (i_in_reg_500 == 5'd22))) begin
        tmp_data_0_V_23_fu_434 <= data_stream_V_data_0_V_dout;
        tmp_data_1_V_23_fu_438 <= data_stream_V_data_1_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (i_in_reg_500 == 5'd23))) begin
        tmp_data_0_V_24_fu_442 <= data_stream_V_data_0_V_dout;
        tmp_data_1_V_24_fu_446 <= data_stream_V_data_1_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & ((i_in_reg_500 == 5'd31) | (i_in_reg_500 == 5'd30) | (i_in_reg_500 == 5'd29) | (i_in_reg_500 == 5'd28) | (i_in_reg_500 == 5'd27) | (i_in_reg_500 == 5'd26) | (i_in_reg_500 == 5'd25) | (i_in_reg_500 == 5'd24)))) begin
        tmp_data_0_V_25_fu_450 <= data_stream_V_data_0_V_dout;
        tmp_data_1_V_25_fu_454 <= data_stream_V_data_1_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (i_in_reg_500 == 5'd1))) begin
        tmp_data_0_V_2_fu_266 <= data_stream_V_data_0_V_dout;
        tmp_data_1_V_2_fu_270 <= data_stream_V_data_1_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (i_in_reg_500 == 5'd2))) begin
        tmp_data_0_V_3_fu_274 <= data_stream_V_data_0_V_dout;
        tmp_data_1_V_3_fu_278 <= data_stream_V_data_1_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (i_in_reg_500 == 5'd3))) begin
        tmp_data_0_V_4_fu_282 <= data_stream_V_data_0_V_dout;
        tmp_data_1_V_4_fu_286 <= data_stream_V_data_1_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (i_in_reg_500 == 5'd4))) begin
        tmp_data_0_V_5_fu_290 <= data_stream_V_data_0_V_dout;
        tmp_data_1_V_5_fu_294 <= data_stream_V_data_1_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (i_in_reg_500 == 5'd5))) begin
        tmp_data_0_V_6_fu_298 <= data_stream_V_data_0_V_dout;
        tmp_data_1_V_6_fu_302 <= data_stream_V_data_1_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (i_in_reg_500 == 5'd6))) begin
        tmp_data_0_V_7_fu_306 <= data_stream_V_data_0_V_dout;
        tmp_data_1_V_7_fu_310 <= data_stream_V_data_1_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (i_in_reg_500 == 5'd7))) begin
        tmp_data_0_V_8_fu_314 <= data_stream_V_data_0_V_dout;
        tmp_data_1_V_8_fu_318 <= data_stream_V_data_1_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (i_in_reg_500 == 5'd8))) begin
        tmp_data_0_V_9_fu_322 <= data_stream_V_data_0_V_dout;
        tmp_data_1_V_9_fu_326 <= data_stream_V_data_1_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (i_in_reg_500 == 5'd0))) begin
        tmp_data_0_V_fu_258 <= data_stream_V_data_0_V_dout;
        tmp_data_1_V_fu_262 <= data_stream_V_data_1_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_reg_1386 <= tmp_fu_566_p2;
    end
end

always @ (*) begin
    if ((tmp_fu_566_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if (((res_stream_V_data_0_V1_status == 1'b1) & (1'b1 == ap_CS_fsm_state7))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((real_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (tmp_reg_1386 == 1'd0))) begin
        ap_phi_mux_i_in_phi_fu_504_p4 = i_in_1_reg_1390;
    end else begin
        ap_phi_mux_i_in_phi_fu_504_p4 = i_in_reg_500;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        data_stream_V_data_0_V0_update = 1'b1;
    end else begin
        data_stream_V_data_0_V0_update = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        data_stream_V_data_0_V_blk_n = data_stream_V_data_0_V_empty_n;
    end else begin
        data_stream_V_data_0_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        data_stream_V_data_1_V_blk_n = data_stream_V_data_1_V_empty_n;
    end else begin
        data_stream_V_data_1_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((res_stream_V_data_0_V1_status == 1'b1) & (1'b1 == ap_CS_fsm_state7))) begin
        internal_ap_ready = 1'b1;
    end else begin
        internal_ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((start_once_reg == 1'b0) & (start_full_n == 1'b0))) begin
        real_start = 1'b0;
    end else begin
        real_start = ap_start;
    end
end

always @ (*) begin
    if (((res_stream_V_data_0_V1_status == 1'b1) & (1'b1 == ap_CS_fsm_state7))) begin
        res_stream_V_data_0_V1_update = 1'b1;
    end else begin
        res_stream_V_data_0_V1_update = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        res_stream_V_data_0_V_blk_n = res_stream_V_data_0_V_full_n;
    end else begin
        res_stream_V_data_0_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        res_stream_V_data_1_V_blk_n = res_stream_V_data_1_V_full_n;
    end else begin
        res_stream_V_data_1_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        res_stream_V_data_2_V_blk_n = res_stream_V_data_2_V_full_n;
    end else begin
        res_stream_V_data_2_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        res_stream_V_data_3_V_blk_n = res_stream_V_data_3_V_full_n;
    end else begin
        res_stream_V_data_3_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        res_stream_V_data_4_V_blk_n = res_stream_V_data_4_V_full_n;
    end else begin
        res_stream_V_data_4_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        res_stream_V_data_5_V_blk_n = res_stream_V_data_5_V_full_n;
    end else begin
        res_stream_V_data_5_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        res_stream_V_data_6_V_blk_n = res_stream_V_data_6_V_full_n;
    end else begin
        res_stream_V_data_6_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        res_stream_V_data_7_V_blk_n = res_stream_V_data_7_V_full_n;
    end else begin
        res_stream_V_data_7_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        res_stream_V_data_8_V_blk_n = res_stream_V_data_8_V_full_n;
    end else begin
        res_stream_V_data_8_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        res_stream_V_data_9_V_blk_n = res_stream_V_data_9_V_full_n;
    end else begin
        res_stream_V_data_9_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((start_once_reg == 1'b0) & (real_start == 1'b1))) begin
        start_write = 1'b1;
    end else begin
        start_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if (~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (tmp_fu_566_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (tmp_fu_566_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            if (((res_stream_V_data_0_V1_status == 1'b1) & (1'b1 == ap_CS_fsm_state7))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd5];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((data_stream_V_data_0_V0_status == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((data_stream_V_data_0_V0_status == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_state1 = ((real_start == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state3_pp0_stage0_iter1 = (data_stream_V_data_0_V0_status == 1'b0);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_ready = internal_ap_ready;

assign data_stream_V_data_0_V0_status = (data_stream_V_data_1_V_empty_n & data_stream_V_data_0_V_empty_n);

assign data_stream_V_data_0_V_read = data_stream_V_data_0_V0_update;

assign data_stream_V_data_1_V_read = data_stream_V_data_0_V0_update;

assign i_in_1_fu_572_p2 = (ap_phi_mux_i_in_phi_fu_504_p4 + 5'd1);

assign res_stream_V_data_0_V1_status = (res_stream_V_data_9_V_full_n & res_stream_V_data_8_V_full_n & res_stream_V_data_7_V_full_n & res_stream_V_data_6_V_full_n & res_stream_V_data_5_V_full_n & res_stream_V_data_4_V_full_n & res_stream_V_data_3_V_full_n & res_stream_V_data_2_V_full_n & res_stream_V_data_1_V_full_n & res_stream_V_data_0_V_full_n);

assign res_stream_V_data_0_V_din = grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_0;

assign res_stream_V_data_0_V_write = res_stream_V_data_0_V1_update;

assign res_stream_V_data_1_V_din = grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_1;

assign res_stream_V_data_1_V_write = res_stream_V_data_0_V1_update;

assign res_stream_V_data_2_V_din = grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_2;

assign res_stream_V_data_2_V_write = res_stream_V_data_0_V1_update;

assign res_stream_V_data_3_V_din = grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_3;

assign res_stream_V_data_3_V_write = res_stream_V_data_0_V1_update;

assign res_stream_V_data_4_V_din = grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_4;

assign res_stream_V_data_4_V_write = res_stream_V_data_0_V1_update;

assign res_stream_V_data_5_V_din = grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_5;

assign res_stream_V_data_5_V_write = res_stream_V_data_0_V1_update;

assign res_stream_V_data_6_V_din = grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_6;

assign res_stream_V_data_6_V_write = res_stream_V_data_0_V1_update;

assign res_stream_V_data_7_V_din = grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_7;

assign res_stream_V_data_7_V_write = res_stream_V_data_0_V1_update;

assign res_stream_V_data_8_V_din = grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_8;

assign res_stream_V_data_8_V_write = res_stream_V_data_0_V1_update;

assign res_stream_V_data_9_V_din = grp_dense_wrapper_ap_fixed_ap_fixed_8_4_5_3_0_config8_s_fu_512_ap_return_9;

assign res_stream_V_data_9_V_write = res_stream_V_data_0_V1_update;

assign start_out = real_start;

assign tmp_fu_566_p2 = ((ap_phi_mux_i_in_phi_fu_504_p4 == 5'd25) ? 1'b1 : 1'b0);

endmodule //dense_array_array_ap_fixed_8_4_5_3_0_10u_config8_s
