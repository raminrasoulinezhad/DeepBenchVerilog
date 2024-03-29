// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module relu_array_array_ap_fixed_10u_relu_config7_s (
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
        data_V_data_0_V_dout,
        data_V_data_0_V_empty_n,
        data_V_data_0_V_read,
        data_V_data_1_V_dout,
        data_V_data_1_V_empty_n,
        data_V_data_1_V_read,
        data_V_data_2_V_dout,
        data_V_data_2_V_empty_n,
        data_V_data_2_V_read,
        data_V_data_3_V_dout,
        data_V_data_3_V_empty_n,
        data_V_data_3_V_read,
        data_V_data_4_V_dout,
        data_V_data_4_V_empty_n,
        data_V_data_4_V_read,
        data_V_data_5_V_dout,
        data_V_data_5_V_empty_n,
        data_V_data_5_V_read,
        data_V_data_6_V_dout,
        data_V_data_6_V_empty_n,
        data_V_data_6_V_read,
        data_V_data_7_V_dout,
        data_V_data_7_V_empty_n,
        data_V_data_7_V_read,
        data_V_data_8_V_dout,
        data_V_data_8_V_empty_n,
        data_V_data_8_V_read,
        data_V_data_9_V_dout,
        data_V_data_9_V_empty_n,
        data_V_data_9_V_read,
        res_V_data_0_V_din,
        res_V_data_0_V_full_n,
        res_V_data_0_V_write,
        res_V_data_1_V_din,
        res_V_data_1_V_full_n,
        res_V_data_1_V_write,
        res_V_data_2_V_din,
        res_V_data_2_V_full_n,
        res_V_data_2_V_write,
        res_V_data_3_V_din,
        res_V_data_3_V_full_n,
        res_V_data_3_V_write,
        res_V_data_4_V_din,
        res_V_data_4_V_full_n,
        res_V_data_4_V_write,
        res_V_data_5_V_din,
        res_V_data_5_V_full_n,
        res_V_data_5_V_write,
        res_V_data_6_V_din,
        res_V_data_6_V_full_n,
        res_V_data_6_V_write,
        res_V_data_7_V_din,
        res_V_data_7_V_full_n,
        res_V_data_7_V_write,
        res_V_data_8_V_din,
        res_V_data_8_V_full_n,
        res_V_data_8_V_write,
        res_V_data_9_V_din,
        res_V_data_9_V_full_n,
        res_V_data_9_V_write
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

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
input  [7:0] data_V_data_0_V_dout;
input   data_V_data_0_V_empty_n;
output   data_V_data_0_V_read;
input  [7:0] data_V_data_1_V_dout;
input   data_V_data_1_V_empty_n;
output   data_V_data_1_V_read;
input  [7:0] data_V_data_2_V_dout;
input   data_V_data_2_V_empty_n;
output   data_V_data_2_V_read;
input  [7:0] data_V_data_3_V_dout;
input   data_V_data_3_V_empty_n;
output   data_V_data_3_V_read;
input  [7:0] data_V_data_4_V_dout;
input   data_V_data_4_V_empty_n;
output   data_V_data_4_V_read;
input  [7:0] data_V_data_5_V_dout;
input   data_V_data_5_V_empty_n;
output   data_V_data_5_V_read;
input  [7:0] data_V_data_6_V_dout;
input   data_V_data_6_V_empty_n;
output   data_V_data_6_V_read;
input  [7:0] data_V_data_7_V_dout;
input   data_V_data_7_V_empty_n;
output   data_V_data_7_V_read;
input  [7:0] data_V_data_8_V_dout;
input   data_V_data_8_V_empty_n;
output   data_V_data_8_V_read;
input  [7:0] data_V_data_9_V_dout;
input   data_V_data_9_V_empty_n;
output   data_V_data_9_V_read;
output  [7:0] res_V_data_0_V_din;
input   res_V_data_0_V_full_n;
output   res_V_data_0_V_write;
output  [7:0] res_V_data_1_V_din;
input   res_V_data_1_V_full_n;
output   res_V_data_1_V_write;
output  [7:0] res_V_data_2_V_din;
input   res_V_data_2_V_full_n;
output   res_V_data_2_V_write;
output  [7:0] res_V_data_3_V_din;
input   res_V_data_3_V_full_n;
output   res_V_data_3_V_write;
output  [7:0] res_V_data_4_V_din;
input   res_V_data_4_V_full_n;
output   res_V_data_4_V_write;
output  [7:0] res_V_data_5_V_din;
input   res_V_data_5_V_full_n;
output   res_V_data_5_V_write;
output  [7:0] res_V_data_6_V_din;
input   res_V_data_6_V_full_n;
output   res_V_data_6_V_write;
output  [7:0] res_V_data_7_V_din;
input   res_V_data_7_V_full_n;
output   res_V_data_7_V_write;
output  [7:0] res_V_data_8_V_din;
input   res_V_data_8_V_full_n;
output   res_V_data_8_V_write;
output  [7:0] res_V_data_9_V_din;
input   res_V_data_9_V_full_n;
output   res_V_data_9_V_write;

reg ap_done;
reg ap_idle;
reg start_write;

reg    real_start;
reg    start_once_reg;
reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
reg    internal_ap_ready;
wire    data_V_data_0_V0_status;
reg    ap_block_state1_pp0_stage0_iter0;
wire    res_V_data_0_V1_status;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_11001;
reg    data_V_data_0_V_blk_n;
wire    ap_block_pp0_stage0;
reg    data_V_data_1_V_blk_n;
reg    data_V_data_2_V_blk_n;
reg    data_V_data_3_V_blk_n;
reg    data_V_data_4_V_blk_n;
reg    data_V_data_5_V_blk_n;
reg    data_V_data_6_V_blk_n;
reg    data_V_data_7_V_blk_n;
reg    data_V_data_8_V_blk_n;
reg    data_V_data_9_V_blk_n;
reg    res_V_data_0_V_blk_n;
reg    res_V_data_1_V_blk_n;
reg    res_V_data_2_V_blk_n;
reg    res_V_data_3_V_blk_n;
reg    res_V_data_4_V_blk_n;
reg    res_V_data_5_V_blk_n;
reg    res_V_data_6_V_blk_n;
reg    res_V_data_7_V_blk_n;
reg    res_V_data_8_V_blk_n;
reg    res_V_data_9_V_blk_n;
reg   [7:0] tmp_data_V_0_reg_540;
reg   [7:0] tmp_data_V_1_reg_546;
reg   [7:0] tmp_data_V_2_reg_552;
reg   [7:0] tmp_data_V_3_reg_558;
reg   [7:0] tmp_data_V_4_reg_564;
reg   [7:0] tmp_data_V_5_reg_570;
reg   [7:0] tmp_data_V_6_reg_576;
reg   [7:0] tmp_data_V_7_reg_582;
reg   [7:0] tmp_data_V_8_reg_588;
reg   [7:0] tmp_data_V_9_reg_594;
reg    ap_block_pp0_stage0_subdone;
reg    data_V_data_0_V0_update;
reg    res_V_data_0_V1_update;
reg    ap_block_pp0_stage0_01001;
wire   [0:0] tmp1_fu_410_p2;
wire   [0:0] tmp_1_fu_415_p2;
wire   [0:0] tmp_2_fu_420_p2;
wire   [0:0] tmp_3_fu_425_p2;
wire   [0:0] tmp_4_fu_430_p2;
wire   [0:0] tmp_5_fu_435_p2;
wire   [0:0] tmp_6_fu_440_p2;
wire   [0:0] tmp_7_fu_445_p2;
wire   [0:0] tmp_8_fu_450_p2;
wire   [0:0] tmp_9_fu_455_p2;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
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
        end else if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter1 <= real_start;
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_data_V_0_reg_540 <= data_V_data_0_V_dout;
        tmp_data_V_1_reg_546 <= data_V_data_1_V_dout;
        tmp_data_V_2_reg_552 <= data_V_data_2_V_dout;
        tmp_data_V_3_reg_558 <= data_V_data_3_V_dout;
        tmp_data_V_4_reg_564 <= data_V_data_4_V_dout;
        tmp_data_V_5_reg_570 <= data_V_data_5_V_dout;
        tmp_data_V_6_reg_576 <= data_V_data_6_V_dout;
        tmp_data_V_7_reg_582 <= data_V_data_7_V_dout;
        tmp_data_V_8_reg_588 <= data_V_data_8_V_dout;
        tmp_data_V_9_reg_594 <= data_V_data_9_V_dout;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((real_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if ((ap_enable_reg_pp0_iter0 == 1'b0)) begin
        ap_idle_pp0_0to0 = 1'b1;
    end else begin
        ap_idle_pp0_0to0 = 1'b0;
    end
end

always @ (*) begin
    if (((real_start == 1'b0) & (ap_idle_pp0_0to0 == 1'b1))) begin
        ap_reset_idle_pp0 = 1'b1;
    end else begin
        ap_reset_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (real_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        data_V_data_0_V0_update = 1'b1;
    end else begin
        data_V_data_0_V0_update = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (real_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        data_V_data_0_V_blk_n = data_V_data_0_V_empty_n;
    end else begin
        data_V_data_0_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (real_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        data_V_data_1_V_blk_n = data_V_data_1_V_empty_n;
    end else begin
        data_V_data_1_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (real_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        data_V_data_2_V_blk_n = data_V_data_2_V_empty_n;
    end else begin
        data_V_data_2_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (real_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        data_V_data_3_V_blk_n = data_V_data_3_V_empty_n;
    end else begin
        data_V_data_3_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (real_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        data_V_data_4_V_blk_n = data_V_data_4_V_empty_n;
    end else begin
        data_V_data_4_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (real_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        data_V_data_5_V_blk_n = data_V_data_5_V_empty_n;
    end else begin
        data_V_data_5_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (real_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        data_V_data_6_V_blk_n = data_V_data_6_V_empty_n;
    end else begin
        data_V_data_6_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (real_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        data_V_data_7_V_blk_n = data_V_data_7_V_empty_n;
    end else begin
        data_V_data_7_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (real_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        data_V_data_8_V_blk_n = data_V_data_8_V_empty_n;
    end else begin
        data_V_data_8_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (real_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        data_V_data_9_V_blk_n = data_V_data_9_V_empty_n;
    end else begin
        data_V_data_9_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (real_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        internal_ap_ready = 1'b1;
    end else begin
        internal_ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((start_full_n == 1'b0) & (start_once_reg == 1'b0))) begin
        real_start = 1'b0;
    end else begin
        real_start = ap_start;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        res_V_data_0_V1_update = 1'b1;
    end else begin
        res_V_data_0_V1_update = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        res_V_data_0_V_blk_n = res_V_data_0_V_full_n;
    end else begin
        res_V_data_0_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        res_V_data_1_V_blk_n = res_V_data_1_V_full_n;
    end else begin
        res_V_data_1_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        res_V_data_2_V_blk_n = res_V_data_2_V_full_n;
    end else begin
        res_V_data_2_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        res_V_data_3_V_blk_n = res_V_data_3_V_full_n;
    end else begin
        res_V_data_3_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        res_V_data_4_V_blk_n = res_V_data_4_V_full_n;
    end else begin
        res_V_data_4_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        res_V_data_5_V_blk_n = res_V_data_5_V_full_n;
    end else begin
        res_V_data_5_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        res_V_data_6_V_blk_n = res_V_data_6_V_full_n;
    end else begin
        res_V_data_6_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        res_V_data_7_V_blk_n = res_V_data_7_V_full_n;
    end else begin
        res_V_data_7_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        res_V_data_8_V_blk_n = res_V_data_8_V_full_n;
    end else begin
        res_V_data_8_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        res_V_data_9_V_blk_n = res_V_data_9_V_full_n;
    end else begin
        res_V_data_9_V_blk_n = 1'b1;
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
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((res_V_data_0_V1_status == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((real_start == 1'b1) & ((real_start == 1'b0) | (data_V_data_0_V0_status == 1'b0) | (ap_done_reg == 1'b1))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((res_V_data_0_V1_status == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((real_start == 1'b1) & ((real_start == 1'b0) | (data_V_data_0_V0_status == 1'b0) | (ap_done_reg == 1'b1))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((res_V_data_0_V1_status == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((real_start == 1'b1) & ((real_start == 1'b0) | (data_V_data_0_V0_status == 1'b0) | (ap_done_reg == 1'b1))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((real_start == 1'b0) | (data_V_data_0_V0_status == 1'b0) | (ap_done_reg == 1'b1));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (res_V_data_0_V1_status == 1'b0);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = real_start;

assign ap_ready = internal_ap_ready;

assign data_V_data_0_V0_status = (data_V_data_9_V_empty_n & data_V_data_8_V_empty_n & data_V_data_7_V_empty_n & data_V_data_6_V_empty_n & data_V_data_5_V_empty_n & data_V_data_4_V_empty_n & data_V_data_3_V_empty_n & data_V_data_2_V_empty_n & data_V_data_1_V_empty_n & data_V_data_0_V_empty_n);

assign data_V_data_0_V_read = data_V_data_0_V0_update;

assign data_V_data_1_V_read = data_V_data_0_V0_update;

assign data_V_data_2_V_read = data_V_data_0_V0_update;

assign data_V_data_3_V_read = data_V_data_0_V0_update;

assign data_V_data_4_V_read = data_V_data_0_V0_update;

assign data_V_data_5_V_read = data_V_data_0_V0_update;

assign data_V_data_6_V_read = data_V_data_0_V0_update;

assign data_V_data_7_V_read = data_V_data_0_V0_update;

assign data_V_data_8_V_read = data_V_data_0_V0_update;

assign data_V_data_9_V_read = data_V_data_0_V0_update;

assign res_V_data_0_V1_status = (res_V_data_9_V_full_n & res_V_data_8_V_full_n & res_V_data_7_V_full_n & res_V_data_6_V_full_n & res_V_data_5_V_full_n & res_V_data_4_V_full_n & res_V_data_3_V_full_n & res_V_data_2_V_full_n & res_V_data_1_V_full_n & res_V_data_0_V_full_n);

assign res_V_data_0_V_din = ((tmp1_fu_410_p2[0:0] === 1'b1) ? tmp_data_V_0_reg_540 : 8'd0);

assign res_V_data_0_V_write = res_V_data_0_V1_update;

assign res_V_data_1_V_din = ((tmp_1_fu_415_p2[0:0] === 1'b1) ? tmp_data_V_1_reg_546 : 8'd0);

assign res_V_data_1_V_write = res_V_data_0_V1_update;

assign res_V_data_2_V_din = ((tmp_2_fu_420_p2[0:0] === 1'b1) ? tmp_data_V_2_reg_552 : 8'd0);

assign res_V_data_2_V_write = res_V_data_0_V1_update;

assign res_V_data_3_V_din = ((tmp_3_fu_425_p2[0:0] === 1'b1) ? tmp_data_V_3_reg_558 : 8'd0);

assign res_V_data_3_V_write = res_V_data_0_V1_update;

assign res_V_data_4_V_din = ((tmp_4_fu_430_p2[0:0] === 1'b1) ? tmp_data_V_4_reg_564 : 8'd0);

assign res_V_data_4_V_write = res_V_data_0_V1_update;

assign res_V_data_5_V_din = ((tmp_5_fu_435_p2[0:0] === 1'b1) ? tmp_data_V_5_reg_570 : 8'd0);

assign res_V_data_5_V_write = res_V_data_0_V1_update;

assign res_V_data_6_V_din = ((tmp_6_fu_440_p2[0:0] === 1'b1) ? tmp_data_V_6_reg_576 : 8'd0);

assign res_V_data_6_V_write = res_V_data_0_V1_update;

assign res_V_data_7_V_din = ((tmp_7_fu_445_p2[0:0] === 1'b1) ? tmp_data_V_7_reg_582 : 8'd0);

assign res_V_data_7_V_write = res_V_data_0_V1_update;

assign res_V_data_8_V_din = ((tmp_8_fu_450_p2[0:0] === 1'b1) ? tmp_data_V_8_reg_588 : 8'd0);

assign res_V_data_8_V_write = res_V_data_0_V1_update;

assign res_V_data_9_V_din = ((tmp_9_fu_455_p2[0:0] === 1'b1) ? tmp_data_V_9_reg_594 : 8'd0);

assign res_V_data_9_V_write = res_V_data_0_V1_update;

assign start_out = real_start;

assign tmp1_fu_410_p2 = (($signed(tmp_data_V_0_reg_540) > $signed(8'd0)) ? 1'b1 : 1'b0);

assign tmp_1_fu_415_p2 = (($signed(tmp_data_V_1_reg_546) > $signed(8'd0)) ? 1'b1 : 1'b0);

assign tmp_2_fu_420_p2 = (($signed(tmp_data_V_2_reg_552) > $signed(8'd0)) ? 1'b1 : 1'b0);

assign tmp_3_fu_425_p2 = (($signed(tmp_data_V_3_reg_558) > $signed(8'd0)) ? 1'b1 : 1'b0);

assign tmp_4_fu_430_p2 = (($signed(tmp_data_V_4_reg_564) > $signed(8'd0)) ? 1'b1 : 1'b0);

assign tmp_5_fu_435_p2 = (($signed(tmp_data_V_5_reg_570) > $signed(8'd0)) ? 1'b1 : 1'b0);

assign tmp_6_fu_440_p2 = (($signed(tmp_data_V_6_reg_576) > $signed(8'd0)) ? 1'b1 : 1'b0);

assign tmp_7_fu_445_p2 = (($signed(tmp_data_V_7_reg_582) > $signed(8'd0)) ? 1'b1 : 1'b0);

assign tmp_8_fu_450_p2 = (($signed(tmp_data_V_8_reg_588) > $signed(8'd0)) ? 1'b1 : 1'b0);

assign tmp_9_fu_455_p2 = (($signed(tmp_data_V_9_reg_594) > $signed(8'd0)) ? 1'b1 : 1'b0);

endmodule //relu_array_array_ap_fixed_10u_relu_config7_s
