/*****************************************************************************
 *
 *     Author: Xilinx, Inc.
 *
 *     This text contains proprietary, confidential information of
 *     Xilinx, Inc. , is distributed by under license from Xilinx,
 *     Inc., and may be used, copied and/or disclosed only pursuant to
 *     the terms of a valid license agreement with Xilinx, Inc.
 *
 *     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"
 *     AS A COURTESY TO YOU, SOLELY FOR USE IN DEVELOPING PROGRAMS AND
 *     SOLUTIONS FOR XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE,
 *     OR INFORMATION AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,
 *     APPLICATION OR STANDARD, XILINX IS MAKING NO REPRESENTATION
 *     THAT THIS IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,
 *     AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE
 *     FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY
 *     WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE
 *     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR
 *     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF
 *     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 *     FOR A PARTICULAR PURPOSE.
 *
 *     Xilinx products are not intended for use in life support appliances,
 *     devices, or systems. Use in such applications is expressly prohibited.
 *
 *     (c) Copyright 2013-2014 Xilinx Inc.
 *     All rights reserved.
 *
 *****************************************************************************/

#ifndef MATRIX_MULTIPLY_H
#define MATRIX_MULTIPLY_H

#include "hls_linear_algebra.h"


namespace hls {
  // This is a copy from "matrix_multiply_traits" which is in "hls_matrix_multiply.h".
  // The only difference is the Arch input to select between the architectures.
  template<
    class TransposeFormA,
    class TransposeFormB,
    int RowsA,
    int ColsA,
    int RowsB,
    int ColsB,
	const int Arch,
    typename InputType,
    typename OutputType>
  struct matrix_multiply_traits_flexible {
    static const int RowsATrans         = ( TransposeFormA::TransposeType != 0 ? ColsA : RowsA);
    static const int ColsATrans         = ( TransposeFormA::TransposeType != 0 ? RowsA : ColsA);
    static const int RowsBTrans         = ( TransposeFormB::TransposeType != 0 ? ColsB : RowsB);
    static const int ColsBTrans         = ( TransposeFormB::TransposeType != 0 ? RowsB : ColsB);
    static const int B_UNROLL_DIM       = ( TransposeFormB::TransposeType != 0 ? 1 : 2); // Determine B input unroll dimension for MATRIX_MULTIPLY_ADD_ALT 1&2 architectures
    static const int A_FULL_UNROLL_DIM  = ( TransposeFormA::TransposeType != 0 ? 1 : 2); // Determine A input unroll dimension for MATRIX_MULTIPLY_ADD_TREE and MATRIX_MULTIPLY_FULL architectures
    static const int B_FULL_UNROLL_DIM  = ( TransposeFormB::TransposeType != 0 ? 2 : 1); // Determine B input unroll dimension for MATRIX_MULTIPLY_ADD_TREE and MATRIX_MULTIPLY_FULL architectures
    typedef          InputType                                 INPUT_T;
    typedef typename x_traits<InputType,InputType>::MULT_T     MULT_T;
    typedef typename x_traits_d<InputType,ColsATrans>::ACCUM_T ACCUM_T;
    static const int ARCH              = Arch; // Select implementation:
                                            // 0: MATRIX_MULTIPLY_DEFAULT
                                            // 1: MATRIX_MULTIPLY_ALT1
                                            // 2: MATRIX_MULTIPLY_ALT2
                                            // 3: MATRIX_MULTIPLY_ADD_TREE
                                            // 4: MATRIX_MULTIPLY_FULL
    static const int INNER_II          = 1; // Specify the pipelining target for the inner loop
    static const int UNROLL_FACTOR     = 1; // Specify the inner loop unrolling factor
  };

  // ===================================================================================================================
  // MATRIX_MULTIPLY_ADD_TREE: Architecture using an adder tree
  // o Optimized for unrolled floating-point. In fixed-point, this adds overhead.
  template<
    class TransposeFormA,
    class TransposeFormB,
    int RowsA,
    int ColsA,
    int RowsB,
    int ColsB,
    int RowsC,
    int ColsC,
    typename MULTIPLIER_TRAITS,
    typename InputType,
    typename OutputType>
  void matrix_multiply_add_tree_flexible(const InputType A [RowsA][ColsA],
                                const InputType B [RowsB][ColsB],
                                OutputType C [RowsC][ColsC])
  {

    // Check defined array dimensions are compatible
    // - The ROWS and COLS value of the traits considers the transpose operation request for A & B
    assert(MULTIPLIER_TRAITS::ColsATrans == MULTIPLIER_TRAITS::RowsBTrans);
    assert(RowsC == MULTIPLIER_TRAITS::RowsATrans);
    assert(ColsC == MULTIPLIER_TRAITS::ColsBTrans);

	#pragma HLS ARRAY_PARTITION variable=A complete dim=MULTIPLIER_TRAITS::A_FULL_UNROLL_DIM
	#pragma HLS ARRAY_PARTITION variable=B complete dim=MULTIPLIER_TRAITS::B_FULL_UNROLL_DIM

    // Use the traits struct to specify the correct type for the intermediate variables
    typename MULTIPLIER_TRAITS::INPUT_T cast_in_a, cast_in_b;
    typename MULTIPLIER_TRAITS::MULT_T  mult;

    // Determine the number of ranks for the adder tree and declare array
    // o The adder_tree is larger than required as each rank only needs to be half the size of the previous rank
    const unsigned a_cols_log2      = BitWidth<MULTIPLIER_TRAITS::ColsATrans>::Value;
    const unsigned a_cols_sub1_log2 = BitWidth<MULTIPLIER_TRAITS::ColsATrans-1>::Value;
    const unsigned num_ranks = (a_cols_log2 != a_cols_sub1_log2 ? a_cols_log2 : a_cols_log2 + 1);

    typename MULTIPLIER_TRAITS::ACCUM_T adder_tree[num_ranks][MULTIPLIER_TRAITS::ColsATrans];

    a_row_loop: for (int i=0; i < MULTIPLIER_TRAITS::RowsATrans; i++) {
      b_col_loop: for (int j=0; j < MULTIPLIER_TRAITS::ColsBTrans; j++) {
        // Fully unrolled inner loop
        #pragma HLS PIPELINE II = 1
        a_col_loop: for (int k=0; k < MULTIPLIER_TRAITS::ColsATrans; k++) {
          cast_in_a = GetMatrixElement<TransposeFormA,RowsA,ColsA,InputType>(A, i, k);
          cast_in_b = GetMatrixElement<TransposeFormB,RowsB,ColsB,InputType>(B, k, j);
          mult =  cast_in_a * cast_in_b;
          // Assign multiplier output to the first rank of the adder tree array
          adder_tree[num_ranks-1][k] = mult;
        }

        // Build adder tree
        unsigned rank_size = MULTIPLIER_TRAITS::ColsATrans;
        add_level_loop: for(int adder_tree_rank=num_ranks-2; adder_tree_rank>=0; adder_tree_rank--) {
          unsigned prev_rank_is_odd = rank_size % 2;
          rank_size = (rank_size+1) / 2; // rank size
          // Fixed loop size so it can be unrolled.
          add_col_loop: for(int jj=0; jj<((MULTIPLIER_TRAITS::ColsATrans+1)/2); jj++) {
            if (jj<rank_size) {
              if ( prev_rank_is_odd && jj == rank_size-1 ) {
                // Bypass, no adder required.
                adder_tree[adder_tree_rank][jj] = adder_tree[adder_tree_rank+1][(jj*2)];
              } else {
                adder_tree[adder_tree_rank][jj] = adder_tree[adder_tree_rank+1][jj*2] + adder_tree[adder_tree_rank+1][(jj*2)+1];
              }
            }
          }
        }
        // Store result
        C[i][j] = adder_tree[0][0];
      }
    }
  }

  // ===================================================================================================================
    // MATRIX_MULTIPLY_FULL: Default architecture including directives to fully unroll inner loop, fixed point implementations
    // o Fixed point implementation maps well to DSP48 cascades
    template<
      class TransposeFormA,
      class TransposeFormB,
      int RowsA,
      int ColsA,
      int RowsB,
      int ColsB,
      int RowsC,
      int ColsC,
      typename MULTIPLIER_TRAITS,
      typename InputType,
      typename OutputType>
    void matrix_multiply_full_flexible(const InputType A [RowsA][ColsA],
                              const InputType B [RowsB][ColsB],
                              OutputType C [RowsC][ColsC])
    {
      // Check defined array dimensions are compatible
      // - The ROWS and COLS value of the traits considers the transpose operation request for A & B
      assert(MULTIPLIER_TRAITS::ColsATrans == MULTIPLIER_TRAITS::RowsBTrans);
      assert(RowsC == MULTIPLIER_TRAITS::RowsATrans);
      assert(ColsC == MULTIPLIER_TRAITS::ColsBTrans);

      // Use the traits struct to specify the correct type for the intermediate variables
      typename MULTIPLIER_TRAITS::INPUT_T cast_in_a, cast_in_b;
      typename MULTIPLIER_TRAITS::MULT_T  mult;
      typename MULTIPLIER_TRAITS::ACCUM_T recast_mult, sum_mult;

      if (MULTIPLIER_TRAITS::ColsATrans <= 1024){
      	  #pragma HLS ARRAY_PARTITION variable=A complete dim=MULTIPLIER_TRAITS::A_FULL_UNROLL_DIM
      	  #pragma HLS ARRAY_PARTITION variable=B complete dim=MULTIPLIER_TRAITS::B_FULL_UNROLL_DIM
      } else {
		  #pragma HLS ARRAY_PARTITION variable=A cyclic factor=1024 dim=MULTIPLIER_TRAITS::A_FULL_UNROLL_DIM
      	  #pragma HLS ARRAY_PARTITION variable=B cyclic factor=1024 dim=MULTIPLIER_TRAITS::B_FULL_UNROLL_DIM
      }

      a_row_loop: for (int r = 0; r < MULTIPLIER_TRAITS::RowsATrans; r++) {
        b_col_loop: for (int c = 0; c < MULTIPLIER_TRAITS::ColsBTrans; c++) {
          // Fully unrolled inner loop
          #pragma HLS PIPELINE II = 1
          a_col_loop: for (int k = 0; k < MULTIPLIER_TRAITS::ColsATrans; k++) {

            cast_in_a = GetMatrixElement<TransposeFormA,RowsA,ColsA,InputType>(A, r, k);
            cast_in_b = GetMatrixElement<TransposeFormB,RowsB,ColsB,InputType>(B, k, c);
            mult      = cast_in_a * cast_in_b;

            // Cast mult to the correct output size before adding.
            recast_mult = mult;
            if (k==0)
              sum_mult = recast_mult;
            else
              sum_mult += recast_mult;

            // Store result
            if (k==MULTIPLIER_TRAITS::ColsATrans-1) C[r][c] = sum_mult;
          }
        }
      }
    }

  // ===================================================================================================================
  // MATRIX_MULTIPLY_TOP: Top level function that selects implementation architecture and internal types based on the
  // traits class provided via the MULTIPLIER_TRAITS template parameter.
  // o Call this function directly if you wish to override the default architecture choice or internal types
  template<
    class TransposeFormA,
    class TransposeFormB,
    int RowsA,
    int ColsA,
    int RowsB,
    int ColsB,
    int RowsC,
    int ColsC,
    typename MULTIPLIER_TRAITS,
    typename InputType,
    typename OutputType>
  void matrix_multiply_top_flexible(const InputType A [RowsA][ColsA],
                           const InputType B [RowsB][ColsB],
                           OutputType C [RowsC][ColsC])
  {

    switch(MULTIPLIER_TRAITS::ARCH) {
    case 0:
      matrix_multiply_default<TransposeFormA, TransposeFormB, RowsA,  ColsA,  RowsB, ColsB, RowsC, ColsC, MULTIPLIER_TRAITS, InputType, OutputType> (A, B, C);
      break;
    case 1:
      matrix_multiply_alt1<TransposeFormA, TransposeFormB, RowsA,  ColsA,  RowsB, ColsB, RowsC, ColsC, MULTIPLIER_TRAITS, InputType, OutputType> (A, B, C);
      break;
    case 2:
      matrix_multiply_alt2<TransposeFormA, TransposeFormB, RowsA,  ColsA,  RowsB, ColsB, RowsC, ColsC, MULTIPLIER_TRAITS, InputType, OutputType> (A, B, C);
      break;
    case 3:
      matrix_multiply_add_tree_flexible<TransposeFormA, TransposeFormB, RowsA,  ColsA,  RowsB, ColsB, RowsC, ColsC, MULTIPLIER_TRAITS, InputType, OutputType> (A, B, C);
      break;
    case 4:
    	matrix_multiply_full_flexible<TransposeFormA, TransposeFormB, RowsA,  ColsA,  RowsB, ColsB, RowsC, ColsC, MULTIPLIER_TRAITS, InputType, OutputType> (A, B, C);
      break;
    default:
      matrix_multiply_default<TransposeFormA, TransposeFormB, RowsA,  ColsA,  RowsB, ColsB, RowsC, ColsC, MULTIPLIER_TRAITS, InputType, OutputType> (A, B, C);
    }
  }

  // This is a copy from "matrix_multiply" which is in "hls_matrix_multiply.h".
  // The only difference is the Arch input to select between the architectures.
  template<
    class TransposeFormA,
    class TransposeFormB,
    int RowsA,
    int ColsA,
    int RowsB,
    int ColsB,
    int RowsC,
    int ColsC,
	const int Arch,
    typename InputType,
    typename OutputType>
  void matrix_multiply_flexible(const InputType A [RowsA][ColsA],
                       const InputType B [RowsB][ColsB],
                       OutputType C [RowsC][ColsC])
  {
    // Define default traits struct for template type
    typedef matrix_multiply_traits_flexible<TransposeFormA, TransposeFormB, RowsA,  ColsA,  RowsB, ColsB, Arch, InputType, OutputType> DEFAULT_MULTIPLIER_TRAITS;
    // Call top level function
    matrix_multiply_top_flexible<TransposeFormA, TransposeFormB, RowsA,  ColsA,  RowsB, ColsB, RowsC, ColsC, DEFAULT_MULTIPLIER_TRAITS, InputType, OutputType> (A, B, C);
  }



}

const unsigned GEMM_M = 3072;
const unsigned GEMM_N = 3000;
const unsigned GEMM_K = 1024;

const unsigned A_ROWS = GEMM_M;
const unsigned A_COLS = GEMM_K;
const unsigned B_ROWS = GEMM_K;
const unsigned B_COLS = GEMM_N;
const unsigned C_ROWS = A_ROWS;
const unsigned C_COLS = B_COLS;

const int ARCH_OPT = 4;

// Define implementation type
typedef ap_uint<8> MATRIX_T;

void matrix_multiply_top(const MATRIX_T A [A_ROWS][A_COLS],
                         const MATRIX_T B [B_ROWS][B_COLS],
                         MATRIX_T C[C_ROWS][C_COLS]);

#endif

