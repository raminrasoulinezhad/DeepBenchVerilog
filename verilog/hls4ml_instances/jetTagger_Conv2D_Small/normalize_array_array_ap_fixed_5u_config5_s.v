// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module normalize_array_array_ap_fixed_5u_config5_s (
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
        res_V_data_4_V_write
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state6 = 3'd4;

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

reg ap_done;
reg ap_idle;
reg start_write;

reg    real_start;
reg    start_once_reg;
reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    internal_ap_ready;
reg    data_V_data_0_V_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg   [0:0] tmp_reg_4071;
reg    data_V_data_1_V_blk_n;
reg    data_V_data_2_V_blk_n;
reg    data_V_data_3_V_blk_n;
reg    data_V_data_4_V_blk_n;
reg    res_V_data_0_V_blk_n;
reg    ap_enable_reg_pp0_iter3;
reg   [0:0] tmp_reg_4071_pp0_iter2_reg;
reg    res_V_data_1_V_blk_n;
reg    res_V_data_2_V_blk_n;
reg    res_V_data_3_V_blk_n;
reg    res_V_data_4_V_blk_n;
reg   [6:0] i_reg_241;
wire   [0:0] tmp_fu_3912_p2;
wire    ap_block_state2_pp0_stage0_iter0;
wire    data_V_data_0_V0_status;
reg    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    res_V_data_0_V1_status;
reg    ap_block_state5_pp0_stage0_iter3;
reg    ap_block_pp0_stage0_11001;
reg   [0:0] tmp_reg_4071_pp0_iter1_reg;
wire   [6:0] i_6_fu_3918_p2;
reg    ap_enable_reg_pp0_iter0;
reg   [7:0] tmp_data_V_0_reg_4080;
reg   [7:0] tmp_data_V_0_reg_4080_pp0_iter2_reg;
reg  signed [7:0] tmp_data_V_1_reg_4086;
reg   [7:0] tmp_data_V_2_reg_4092;
reg   [7:0] tmp_data_V_3_reg_4097;
wire   [7:0] tmp_data_4_V_fu_3958_p2;
reg   [7:0] tmp_data_4_V_reg_4102;
reg   [7:0] tmp_data_4_V_reg_4102_pp0_iter2_reg;
reg   [7:0] p_Val2_6_1_reg_4107;
reg   [7:0] p_Val2_6_2_reg_4112;
reg   [7:0] p_Val2_6_3_reg_4117;
reg    ap_block_state1;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg    ap_enable_reg_pp0_iter2;
reg    data_V_data_0_V0_update;
reg    res_V_data_0_V1_update;
reg    ap_block_pp0_stage0_01001;
wire  signed [7:0] p_Val2_2_fu_452_p0;
wire  signed [7:0] p_Val2_3_fu_499_p0;
wire   [6:0] tmp_13_fu_3944_p4;
wire  signed [7:0] p_Val2_6_4_fu_3954_p1;
wire   [11:0] p_shl_fu_3967_p3;
wire  signed [11:0] OP1_V_1_cast_fu_3964_p1;
wire   [11:0] p_Val2_1_fu_3974_p2;
wire   [11:0] p_Val2_2_fu_452_p2;
wire   [11:0] p_Val2_3_fu_499_p2;
wire   [9:0] p_shl2_fu_4025_p3;
wire  signed [11:0] p_shl2_cast_fu_4032_p1;
wire   [11:0] p_shl1_fu_4018_p3;
wire   [11:0] p_Val2_s_fu_4036_p2;
wire    ap_CS_fsm_state6;
reg   [2:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 3'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
end

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
        end else if ((1'b1 == ap_CS_fsm_state6)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state2) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state2)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end else if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter3 <= 1'b0;
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
    if (((tmp_fu_3912_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        i_reg_241 <= i_6_fu_3918_p2;
    end else if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        i_reg_241 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_reg_4071_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        p_Val2_6_1_reg_4107 <= {{p_Val2_1_fu_3974_p2[11:4]}};
        p_Val2_6_2_reg_4112 <= {{p_Val2_2_fu_452_p2[11:4]}};
        p_Val2_6_3_reg_4117 <= {{p_Val2_3_fu_499_p2[11:4]}};
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_reg_4071 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_data_4_V_reg_4102 <= tmp_data_4_V_fu_3958_p2;
        tmp_data_V_0_reg_4080 <= data_V_data_0_V_dout;
        tmp_data_V_1_reg_4086 <= data_V_data_1_V_dout;
        tmp_data_V_2_reg_4092 <= data_V_data_2_V_dout;
        tmp_data_V_3_reg_4097 <= data_V_data_3_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        tmp_data_4_V_reg_4102_pp0_iter2_reg <= tmp_data_4_V_reg_4102;
        tmp_data_V_0_reg_4080_pp0_iter2_reg <= tmp_data_V_0_reg_4080;
        tmp_reg_4071_pp0_iter2_reg <= tmp_reg_4071_pp0_iter1_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_reg_4071 <= tmp_fu_3912_p2;
        tmp_reg_4071_pp0_iter1_reg <= tmp_reg_4071;
    end
end

always @ (*) begin
    if ((tmp_fu_3912_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
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
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_reg_4071 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        data_V_data_0_V0_update = 1'b1;
    end else begin
        data_V_data_0_V0_update = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_reg_4071 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        data_V_data_0_V_blk_n = data_V_data_0_V_empty_n;
    end else begin
        data_V_data_0_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_reg_4071 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        data_V_data_1_V_blk_n = data_V_data_1_V_empty_n;
    end else begin
        data_V_data_1_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_reg_4071 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        data_V_data_2_V_blk_n = data_V_data_2_V_empty_n;
    end else begin
        data_V_data_2_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_reg_4071 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        data_V_data_3_V_blk_n = data_V_data_3_V_empty_n;
    end else begin
        data_V_data_3_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_reg_4071 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        data_V_data_4_V_blk_n = data_V_data_4_V_empty_n;
    end else begin
        data_V_data_4_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
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
    if (((tmp_reg_4071_pp0_iter2_reg == 1'd0) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        res_V_data_0_V1_update = 1'b1;
    end else begin
        res_V_data_0_V1_update = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_reg_4071_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        res_V_data_0_V_blk_n = res_V_data_0_V_full_n;
    end else begin
        res_V_data_0_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_reg_4071_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        res_V_data_1_V_blk_n = res_V_data_1_V_full_n;
    end else begin
        res_V_data_1_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_reg_4071_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        res_V_data_2_V_blk_n = res_V_data_2_V_full_n;
    end else begin
        res_V_data_2_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_reg_4071_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        res_V_data_3_V_blk_n = res_V_data_3_V_full_n;
    end else begin
        res_V_data_3_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_reg_4071_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        res_V_data_4_V_blk_n = res_V_data_4_V_full_n;
    end else begin
        res_V_data_4_V_blk_n = 1'b1;
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
            if ((~((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (tmp_fu_3912_p2 == 1'd1)) & ~((ap_enable_reg_pp0_iter3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (tmp_fu_3912_p2 == 1'd1)) | ((ap_enable_reg_pp0_iter3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign OP1_V_1_cast_fu_3964_p1 = tmp_data_V_1_reg_4086;

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((tmp_reg_4071 == 1'd0) & (data_V_data_0_V0_status == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((tmp_reg_4071_pp0_iter2_reg == 1'd0) & (res_V_data_0_V1_status == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((tmp_reg_4071 == 1'd0) & (data_V_data_0_V0_status == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((tmp_reg_4071_pp0_iter2_reg == 1'd0) & (res_V_data_0_V1_status == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((tmp_reg_4071 == 1'd0) & (data_V_data_0_V0_status == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((tmp_reg_4071_pp0_iter2_reg == 1'd0) & (res_V_data_0_V1_status == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1)));
end

always @ (*) begin
    ap_block_state1 = ((real_start == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state3_pp0_stage0_iter1 = ((tmp_reg_4071 == 1'd0) & (data_V_data_0_V0_status == 1'b0));
end

assign ap_block_state4_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state5_pp0_stage0_iter3 = ((tmp_reg_4071_pp0_iter2_reg == 1'd0) & (res_V_data_0_V1_status == 1'b0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_ready = internal_ap_ready;

assign data_V_data_0_V0_status = (data_V_data_4_V_empty_n & data_V_data_3_V_empty_n & data_V_data_2_V_empty_n & data_V_data_1_V_empty_n & data_V_data_0_V_empty_n);

assign data_V_data_0_V_read = data_V_data_0_V0_update;

assign data_V_data_1_V_read = data_V_data_0_V0_update;

assign data_V_data_2_V_read = data_V_data_0_V0_update;

assign data_V_data_3_V_read = data_V_data_0_V0_update;

assign data_V_data_4_V_read = data_V_data_0_V0_update;

assign i_6_fu_3918_p2 = (i_reg_241 + 7'd1);

assign p_Val2_1_fu_3974_p2 = ($signed(p_shl_fu_3967_p3) - $signed(OP1_V_1_cast_fu_3964_p1));

assign p_Val2_2_fu_452_p0 = tmp_data_V_2_reg_4092;

assign p_Val2_2_fu_452_p2 = ($signed(p_Val2_2_fu_452_p0) * $signed('h13));

assign p_Val2_3_fu_499_p0 = tmp_data_V_3_reg_4097;

assign p_Val2_3_fu_499_p2 = ($signed(p_Val2_3_fu_499_p0) * $signed('hD));

assign p_Val2_6_4_fu_3954_p1 = $signed(tmp_13_fu_3944_p4);

assign p_Val2_s_fu_4036_p2 = ($signed(p_shl2_cast_fu_4032_p1) + $signed(p_shl1_fu_4018_p3));

assign p_shl1_fu_4018_p3 = {{tmp_data_V_0_reg_4080_pp0_iter2_reg}, {4'd0}};

assign p_shl2_cast_fu_4032_p1 = $signed(p_shl2_fu_4025_p3);

assign p_shl2_fu_4025_p3 = {{tmp_data_V_0_reg_4080_pp0_iter2_reg}, {2'd0}};

assign p_shl_fu_3967_p3 = {{tmp_data_V_1_reg_4086}, {4'd0}};

assign res_V_data_0_V1_status = (res_V_data_4_V_full_n & res_V_data_3_V_full_n & res_V_data_2_V_full_n & res_V_data_1_V_full_n & res_V_data_0_V_full_n);

assign res_V_data_0_V_din = {{p_Val2_s_fu_4036_p2[11:4]}};

assign res_V_data_0_V_write = res_V_data_0_V1_update;

assign res_V_data_1_V_din = ($signed(p_Val2_6_1_reg_4107) + $signed(8'd255));

assign res_V_data_1_V_write = res_V_data_0_V1_update;

assign res_V_data_2_V_din = ($signed(p_Val2_6_2_reg_4112) + $signed(8'd255));

assign res_V_data_2_V_write = res_V_data_0_V1_update;

assign res_V_data_3_V_din = ($signed(p_Val2_6_3_reg_4117) + $signed(8'd255));

assign res_V_data_3_V_write = res_V_data_0_V1_update;

assign res_V_data_4_V_din = tmp_data_4_V_reg_4102_pp0_iter2_reg;

assign res_V_data_4_V_write = res_V_data_0_V1_update;

assign start_out = real_start;

assign tmp_13_fu_3944_p4 = {{data_V_data_4_V_dout[7:1]}};

assign tmp_data_4_V_fu_3958_p2 = ($signed(p_Val2_6_4_fu_3954_p1) + $signed(8'd255));

assign tmp_fu_3912_p2 = ((i_reg_241 == 7'd81) ? 1'b1 : 1'b0);

endmodule //normalize_array_array_ap_fixed_5u_config5_s