// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module normalize_array_array_ap_fixed_5u_config16_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        res_V_data_0_V_TREADY,
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
        res_V_data_0_V_TDATA,
        res_V_data_0_V_TVALID,
        res_V_data_1_V_TDATA,
        res_V_data_1_V_TVALID,
        res_V_data_1_V_TREADY,
        res_V_data_2_V_TDATA,
        res_V_data_2_V_TVALID,
        res_V_data_2_V_TREADY,
        res_V_data_3_V_TDATA,
        res_V_data_3_V_TVALID,
        res_V_data_3_V_TREADY,
        res_V_data_4_V_TDATA,
        res_V_data_4_V_TVALID,
        res_V_data_4_V_TREADY
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input   res_V_data_0_V_TREADY;
input  [6:0] data_V_data_0_V_dout;
input   data_V_data_0_V_empty_n;
output   data_V_data_0_V_read;
input  [6:0] data_V_data_1_V_dout;
input   data_V_data_1_V_empty_n;
output   data_V_data_1_V_read;
input  [6:0] data_V_data_2_V_dout;
input   data_V_data_2_V_empty_n;
output   data_V_data_2_V_read;
input  [6:0] data_V_data_3_V_dout;
input   data_V_data_3_V_empty_n;
output   data_V_data_3_V_read;
input  [6:0] data_V_data_4_V_dout;
input   data_V_data_4_V_empty_n;
output   data_V_data_4_V_read;
output  [7:0] res_V_data_0_V_TDATA;
output   res_V_data_0_V_TVALID;
output  [7:0] res_V_data_1_V_TDATA;
output   res_V_data_1_V_TVALID;
input   res_V_data_1_V_TREADY;
output  [7:0] res_V_data_2_V_TDATA;
output   res_V_data_2_V_TVALID;
input   res_V_data_2_V_TREADY;
output  [7:0] res_V_data_3_V_TDATA;
output   res_V_data_3_V_TVALID;
input   res_V_data_3_V_TREADY;
output  [7:0] res_V_data_4_V_TDATA;
output   res_V_data_4_V_TVALID;
input   res_V_data_4_V_TREADY;

reg ap_done;
reg ap_idle;
reg ap_ready;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
reg    ap_block_state1_pp0_stage0_iter0;
wire    res_V_data_0_V_1_ack_in;
wire    data_V_data_0_V0_status;
wire    res_V_data_1_V_1_ack_in;
wire    res_V_data_2_V_1_ack_in;
wire    res_V_data_3_V_1_ack_in;
wire    res_V_data_4_V_1_ack_in;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_11001;
wire   [7:0] res_V_data_0_V_1_data_out;
reg    res_V_data_0_V_1_vld_in;
wire    res_V_data_0_V_1_vld_out;
wire    res_V_data_0_V_1_ack_out;
reg    res_V_data_0_V_1_sel_rd;
wire    res_V_data_0_V_1_sel;
reg   [1:0] res_V_data_0_V_1_state;
wire   [7:0] res_V_data_1_V_1_data_out;
reg    res_V_data_1_V_1_vld_in;
wire    res_V_data_1_V_1_vld_out;
wire    res_V_data_1_V_1_ack_out;
reg    res_V_data_1_V_1_sel_rd;
wire    res_V_data_1_V_1_sel;
reg   [1:0] res_V_data_1_V_1_state;
wire   [7:0] res_V_data_2_V_1_data_out;
reg    res_V_data_2_V_1_vld_in;
wire    res_V_data_2_V_1_vld_out;
wire    res_V_data_2_V_1_ack_out;
reg    res_V_data_2_V_1_sel_rd;
wire    res_V_data_2_V_1_sel;
reg   [1:0] res_V_data_2_V_1_state;
wire   [7:0] res_V_data_3_V_1_data_out;
reg    res_V_data_3_V_1_vld_in;
wire    res_V_data_3_V_1_vld_out;
wire    res_V_data_3_V_1_ack_out;
reg    res_V_data_3_V_1_sel_rd;
wire    res_V_data_3_V_1_sel;
reg   [1:0] res_V_data_3_V_1_state;
wire   [7:0] res_V_data_4_V_1_data_out;
reg    res_V_data_4_V_1_vld_in;
wire    res_V_data_4_V_1_vld_out;
wire    res_V_data_4_V_1_ack_out;
reg    res_V_data_4_V_1_sel_rd;
wire    res_V_data_4_V_1_sel;
reg   [1:0] res_V_data_4_V_1_state;
reg    data_V_data_0_V_blk_n;
wire    ap_block_pp0_stage0;
reg    data_V_data_1_V_blk_n;
reg    data_V_data_2_V_blk_n;
reg    data_V_data_3_V_blk_n;
reg    data_V_data_4_V_blk_n;
reg    res_V_data_0_V_TDATA_blk_n;
reg    res_V_data_1_V_TDATA_blk_n;
reg    res_V_data_2_V_TDATA_blk_n;
reg    res_V_data_3_V_TDATA_blk_n;
reg    res_V_data_4_V_TDATA_blk_n;
reg    ap_block_pp0_stage0_subdone;
reg    data_V_data_0_V0_update;
reg    ap_block_pp0_stage0_01001;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 res_V_data_0_V_1_sel_rd = 1'b0;
#0 res_V_data_0_V_1_state = 2'd0;
#0 res_V_data_1_V_1_sel_rd = 1'b0;
#0 res_V_data_1_V_1_state = 2'd0;
#0 res_V_data_2_V_1_sel_rd = 1'b0;
#0 res_V_data_2_V_1_state = 2'd0;
#0 res_V_data_3_V_1_sel_rd = 1'b0;
#0 res_V_data_3_V_1_state = 2'd0;
#0 res_V_data_4_V_1_sel_rd = 1'b0;
#0 res_V_data_4_V_1_state = 2'd0;
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
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        res_V_data_0_V_1_sel_rd <= 1'b0;
    end else begin
        if (((res_V_data_0_V_1_ack_out == 1'b1) & (res_V_data_0_V_1_vld_out == 1'b1))) begin
            res_V_data_0_V_1_sel_rd <= ~res_V_data_0_V_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        res_V_data_0_V_1_state <= 2'd0;
    end else begin
        if ((((res_V_data_0_V_1_vld_in == 1'b0) & (res_V_data_0_V_1_state == 2'd2)) | ((res_V_data_0_V_1_vld_in == 1'b0) & (res_V_data_0_V_1_ack_out == 1'b1) & (res_V_data_0_V_1_state == 2'd3)))) begin
            res_V_data_0_V_1_state <= 2'd2;
        end else if ((((res_V_data_0_V_1_ack_out == 1'b0) & (res_V_data_0_V_1_state == 2'd1)) | ((res_V_data_0_V_1_ack_out == 1'b0) & (res_V_data_0_V_1_vld_in == 1'b1) & (res_V_data_0_V_1_state == 2'd3)))) begin
            res_V_data_0_V_1_state <= 2'd1;
        end else if (((~((res_V_data_0_V_1_vld_in == 1'b0) & (res_V_data_0_V_1_ack_out == 1'b1)) & ~((res_V_data_0_V_1_ack_out == 1'b0) & (res_V_data_0_V_1_vld_in == 1'b1)) & (res_V_data_0_V_1_state == 2'd3)) | ((res_V_data_0_V_1_ack_out == 1'b1) & (res_V_data_0_V_1_state == 2'd1)) | ((res_V_data_0_V_1_vld_in == 1'b1) & (res_V_data_0_V_1_state == 2'd2)))) begin
            res_V_data_0_V_1_state <= 2'd3;
        end else begin
            res_V_data_0_V_1_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        res_V_data_1_V_1_sel_rd <= 1'b0;
    end else begin
        if (((res_V_data_1_V_1_ack_out == 1'b1) & (res_V_data_1_V_1_vld_out == 1'b1))) begin
            res_V_data_1_V_1_sel_rd <= ~res_V_data_1_V_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        res_V_data_1_V_1_state <= 2'd0;
    end else begin
        if ((((res_V_data_1_V_1_vld_in == 1'b0) & (res_V_data_1_V_1_state == 2'd2)) | ((res_V_data_1_V_1_vld_in == 1'b0) & (res_V_data_1_V_1_ack_out == 1'b1) & (res_V_data_1_V_1_state == 2'd3)))) begin
            res_V_data_1_V_1_state <= 2'd2;
        end else if ((((res_V_data_1_V_1_ack_out == 1'b0) & (res_V_data_1_V_1_state == 2'd1)) | ((res_V_data_1_V_1_ack_out == 1'b0) & (res_V_data_1_V_1_vld_in == 1'b1) & (res_V_data_1_V_1_state == 2'd3)))) begin
            res_V_data_1_V_1_state <= 2'd1;
        end else if (((~((res_V_data_1_V_1_vld_in == 1'b0) & (res_V_data_1_V_1_ack_out == 1'b1)) & ~((res_V_data_1_V_1_ack_out == 1'b0) & (res_V_data_1_V_1_vld_in == 1'b1)) & (res_V_data_1_V_1_state == 2'd3)) | ((res_V_data_1_V_1_ack_out == 1'b1) & (res_V_data_1_V_1_state == 2'd1)) | ((res_V_data_1_V_1_vld_in == 1'b1) & (res_V_data_1_V_1_state == 2'd2)))) begin
            res_V_data_1_V_1_state <= 2'd3;
        end else begin
            res_V_data_1_V_1_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        res_V_data_2_V_1_sel_rd <= 1'b0;
    end else begin
        if (((res_V_data_2_V_1_ack_out == 1'b1) & (res_V_data_2_V_1_vld_out == 1'b1))) begin
            res_V_data_2_V_1_sel_rd <= ~res_V_data_2_V_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        res_V_data_2_V_1_state <= 2'd0;
    end else begin
        if ((((res_V_data_2_V_1_vld_in == 1'b0) & (res_V_data_2_V_1_state == 2'd2)) | ((res_V_data_2_V_1_vld_in == 1'b0) & (res_V_data_2_V_1_ack_out == 1'b1) & (res_V_data_2_V_1_state == 2'd3)))) begin
            res_V_data_2_V_1_state <= 2'd2;
        end else if ((((res_V_data_2_V_1_ack_out == 1'b0) & (res_V_data_2_V_1_state == 2'd1)) | ((res_V_data_2_V_1_ack_out == 1'b0) & (res_V_data_2_V_1_vld_in == 1'b1) & (res_V_data_2_V_1_state == 2'd3)))) begin
            res_V_data_2_V_1_state <= 2'd1;
        end else if (((~((res_V_data_2_V_1_vld_in == 1'b0) & (res_V_data_2_V_1_ack_out == 1'b1)) & ~((res_V_data_2_V_1_ack_out == 1'b0) & (res_V_data_2_V_1_vld_in == 1'b1)) & (res_V_data_2_V_1_state == 2'd3)) | ((res_V_data_2_V_1_ack_out == 1'b1) & (res_V_data_2_V_1_state == 2'd1)) | ((res_V_data_2_V_1_vld_in == 1'b1) & (res_V_data_2_V_1_state == 2'd2)))) begin
            res_V_data_2_V_1_state <= 2'd3;
        end else begin
            res_V_data_2_V_1_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        res_V_data_3_V_1_sel_rd <= 1'b0;
    end else begin
        if (((res_V_data_3_V_1_ack_out == 1'b1) & (res_V_data_3_V_1_vld_out == 1'b1))) begin
            res_V_data_3_V_1_sel_rd <= ~res_V_data_3_V_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        res_V_data_3_V_1_state <= 2'd0;
    end else begin
        if ((((res_V_data_3_V_1_vld_in == 1'b0) & (res_V_data_3_V_1_state == 2'd2)) | ((res_V_data_3_V_1_vld_in == 1'b0) & (res_V_data_3_V_1_ack_out == 1'b1) & (res_V_data_3_V_1_state == 2'd3)))) begin
            res_V_data_3_V_1_state <= 2'd2;
        end else if ((((res_V_data_3_V_1_ack_out == 1'b0) & (res_V_data_3_V_1_state == 2'd1)) | ((res_V_data_3_V_1_ack_out == 1'b0) & (res_V_data_3_V_1_vld_in == 1'b1) & (res_V_data_3_V_1_state == 2'd3)))) begin
            res_V_data_3_V_1_state <= 2'd1;
        end else if (((~((res_V_data_3_V_1_vld_in == 1'b0) & (res_V_data_3_V_1_ack_out == 1'b1)) & ~((res_V_data_3_V_1_ack_out == 1'b0) & (res_V_data_3_V_1_vld_in == 1'b1)) & (res_V_data_3_V_1_state == 2'd3)) | ((res_V_data_3_V_1_ack_out == 1'b1) & (res_V_data_3_V_1_state == 2'd1)) | ((res_V_data_3_V_1_vld_in == 1'b1) & (res_V_data_3_V_1_state == 2'd2)))) begin
            res_V_data_3_V_1_state <= 2'd3;
        end else begin
            res_V_data_3_V_1_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        res_V_data_4_V_1_sel_rd <= 1'b0;
    end else begin
        if (((res_V_data_4_V_1_ack_out == 1'b1) & (res_V_data_4_V_1_vld_out == 1'b1))) begin
            res_V_data_4_V_1_sel_rd <= ~res_V_data_4_V_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        res_V_data_4_V_1_state <= 2'd0;
    end else begin
        if ((((res_V_data_4_V_1_vld_in == 1'b0) & (res_V_data_4_V_1_state == 2'd2)) | ((res_V_data_4_V_1_vld_in == 1'b0) & (res_V_data_4_V_1_ack_out == 1'b1) & (res_V_data_4_V_1_state == 2'd3)))) begin
            res_V_data_4_V_1_state <= 2'd2;
        end else if ((((res_V_data_4_V_1_ack_out == 1'b0) & (res_V_data_4_V_1_state == 2'd1)) | ((res_V_data_4_V_1_ack_out == 1'b0) & (res_V_data_4_V_1_vld_in == 1'b1) & (res_V_data_4_V_1_state == 2'd3)))) begin
            res_V_data_4_V_1_state <= 2'd1;
        end else if (((~((res_V_data_4_V_1_vld_in == 1'b0) & (res_V_data_4_V_1_ack_out == 1'b1)) & ~((res_V_data_4_V_1_ack_out == 1'b0) & (res_V_data_4_V_1_vld_in == 1'b1)) & (res_V_data_4_V_1_state == 2'd3)) | ((res_V_data_4_V_1_ack_out == 1'b1) & (res_V_data_4_V_1_state == 2'd1)) | ((res_V_data_4_V_1_vld_in == 1'b1) & (res_V_data_4_V_1_state == 2'd2)))) begin
            res_V_data_4_V_1_state <= 2'd3;
        end else begin
            res_V_data_4_V_1_state <= 2'd2;
        end
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
    if (((ap_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (ap_idle_pp0_0to0 == 1'b1))) begin
        ap_reset_idle_pp0 = 1'b1;
    end else begin
        ap_reset_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        data_V_data_0_V0_update = 1'b1;
    end else begin
        data_V_data_0_V0_update = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        data_V_data_0_V_blk_n = data_V_data_0_V_empty_n;
    end else begin
        data_V_data_0_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        data_V_data_1_V_blk_n = data_V_data_1_V_empty_n;
    end else begin
        data_V_data_1_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        data_V_data_2_V_blk_n = data_V_data_2_V_empty_n;
    end else begin
        data_V_data_2_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        data_V_data_3_V_blk_n = data_V_data_3_V_empty_n;
    end else begin
        data_V_data_3_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        data_V_data_4_V_blk_n = data_V_data_4_V_empty_n;
    end else begin
        data_V_data_4_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        res_V_data_0_V_1_vld_in = 1'b1;
    end else begin
        res_V_data_0_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | (~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b0 == ap_block_pp0_stage0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        res_V_data_0_V_TDATA_blk_n = res_V_data_0_V_1_state[1'd1];
    end else begin
        res_V_data_0_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        res_V_data_1_V_1_vld_in = 1'b1;
    end else begin
        res_V_data_1_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | (~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b0 == ap_block_pp0_stage0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        res_V_data_1_V_TDATA_blk_n = res_V_data_1_V_1_state[1'd1];
    end else begin
        res_V_data_1_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        res_V_data_2_V_1_vld_in = 1'b1;
    end else begin
        res_V_data_2_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | (~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b0 == ap_block_pp0_stage0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        res_V_data_2_V_TDATA_blk_n = res_V_data_2_V_1_state[1'd1];
    end else begin
        res_V_data_2_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        res_V_data_3_V_1_vld_in = 1'b1;
    end else begin
        res_V_data_3_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | (~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b0 == ap_block_pp0_stage0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        res_V_data_3_V_TDATA_blk_n = res_V_data_3_V_1_state[1'd1];
    end else begin
        res_V_data_3_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        res_V_data_4_V_1_vld_in = 1'b1;
    end else begin
        res_V_data_4_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | (~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b0 == ap_block_pp0_stage0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        res_V_data_4_V_TDATA_blk_n = res_V_data_4_V_1_state[1'd1];
    end else begin
        res_V_data_4_V_TDATA_blk_n = 1'b1;
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
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & ((res_V_data_4_V_1_ack_in == 1'b0) | (res_V_data_3_V_1_ack_in == 1'b0) | (res_V_data_2_V_1_ack_in == 1'b0) | (res_V_data_1_V_1_ack_in == 1'b0) | (data_V_data_0_V0_status == 1'b0) | (res_V_data_0_V_1_ack_in == 1'b0))) | ((ap_start == 1'b1) & ((ap_start == 1'b0) | (ap_done_reg == 1'b1))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & ((res_V_data_4_V_1_ack_in == 1'b0) | (res_V_data_3_V_1_ack_in == 1'b0) | (res_V_data_2_V_1_ack_in == 1'b0) | (res_V_data_1_V_1_ack_in == 1'b0) | (data_V_data_0_V0_status == 1'b0) | (res_V_data_0_V_1_ack_in == 1'b0))) | ((ap_start == 1'b1) & ((ap_start == 1'b0) | (res_V_data_0_V_1_ack_in == 1'b0) | (ap_done_reg == 1'b1))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & ((res_V_data_4_V_1_ack_in == 1'b0) | (res_V_data_3_V_1_ack_in == 1'b0) | (res_V_data_2_V_1_ack_in == 1'b0) | (res_V_data_1_V_1_ack_in == 1'b0) | (data_V_data_0_V0_status == 1'b0) | (res_V_data_0_V_1_ack_in == 1'b0))) | ((ap_start == 1'b1) & ((ap_start == 1'b0) | (res_V_data_0_V_1_ack_in == 1'b0) | (ap_done_reg == 1'b1))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((res_V_data_4_V_1_ack_in == 1'b0) | (res_V_data_3_V_1_ack_in == 1'b0) | (res_V_data_2_V_1_ack_in == 1'b0) | (res_V_data_1_V_1_ack_in == 1'b0) | (data_V_data_0_V0_status == 1'b0) | (res_V_data_0_V_1_ack_in == 1'b0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

assign data_V_data_0_V0_status = (data_V_data_4_V_empty_n & data_V_data_3_V_empty_n & data_V_data_2_V_empty_n & data_V_data_1_V_empty_n & data_V_data_0_V_empty_n);

assign data_V_data_0_V_read = data_V_data_0_V0_update;

assign data_V_data_1_V_read = data_V_data_0_V0_update;

assign data_V_data_2_V_read = data_V_data_0_V0_update;

assign data_V_data_3_V_read = data_V_data_0_V0_update;

assign data_V_data_4_V_read = data_V_data_0_V0_update;

assign res_V_data_0_V_1_ack_in = res_V_data_0_V_1_state[1'd1];

assign res_V_data_0_V_1_ack_out = res_V_data_0_V_TREADY;

assign res_V_data_0_V_1_data_out = 8'd245;

assign res_V_data_0_V_1_sel = res_V_data_0_V_1_sel_rd;

assign res_V_data_0_V_1_vld_out = res_V_data_0_V_1_state[1'd0];

assign res_V_data_0_V_TDATA = res_V_data_0_V_1_data_out;

assign res_V_data_0_V_TVALID = res_V_data_0_V_1_state[1'd0];

assign res_V_data_1_V_1_ack_in = res_V_data_1_V_1_state[1'd1];

assign res_V_data_1_V_1_ack_out = res_V_data_1_V_TREADY;

assign res_V_data_1_V_1_data_out = 8'd244;

assign res_V_data_1_V_1_sel = res_V_data_1_V_1_sel_rd;

assign res_V_data_1_V_1_vld_out = res_V_data_1_V_1_state[1'd0];

assign res_V_data_1_V_TDATA = res_V_data_1_V_1_data_out;

assign res_V_data_1_V_TVALID = res_V_data_1_V_1_state[1'd0];

assign res_V_data_2_V_1_ack_in = res_V_data_2_V_1_state[1'd1];

assign res_V_data_2_V_1_ack_out = res_V_data_2_V_TREADY;

assign res_V_data_2_V_1_data_out = 8'd245;

assign res_V_data_2_V_1_sel = res_V_data_2_V_1_sel_rd;

assign res_V_data_2_V_1_vld_out = res_V_data_2_V_1_state[1'd0];

assign res_V_data_2_V_TDATA = res_V_data_2_V_1_data_out;

assign res_V_data_2_V_TVALID = res_V_data_2_V_1_state[1'd0];

assign res_V_data_3_V_1_ack_in = res_V_data_3_V_1_state[1'd1];

assign res_V_data_3_V_1_ack_out = res_V_data_3_V_TREADY;

assign res_V_data_3_V_1_data_out = 8'd244;

assign res_V_data_3_V_1_sel = res_V_data_3_V_1_sel_rd;

assign res_V_data_3_V_1_vld_out = res_V_data_3_V_1_state[1'd0];

assign res_V_data_3_V_TDATA = res_V_data_3_V_1_data_out;

assign res_V_data_3_V_TVALID = res_V_data_3_V_1_state[1'd0];

assign res_V_data_4_V_1_ack_in = res_V_data_4_V_1_state[1'd1];

assign res_V_data_4_V_1_ack_out = res_V_data_4_V_TREADY;

assign res_V_data_4_V_1_data_out = 8'd246;

assign res_V_data_4_V_1_sel = res_V_data_4_V_1_sel_rd;

assign res_V_data_4_V_1_vld_out = res_V_data_4_V_1_state[1'd0];

assign res_V_data_4_V_TDATA = res_V_data_4_V_1_data_out;

assign res_V_data_4_V_TVALID = res_V_data_4_V_1_state[1'd0];

endmodule //normalize_array_array_ap_fixed_5u_config16_s