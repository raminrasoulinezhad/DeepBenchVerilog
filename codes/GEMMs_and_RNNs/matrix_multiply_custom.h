
#ifndef MATRIX_MULTIPLY_CUSTOM_H
#define MATRIX_MULTIPLY_CUSTOM_H

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
      matrix_multiply_add_tree<TransposeFormA, TransposeFormB, RowsA,  ColsA,  RowsB, ColsB, RowsC, ColsC, MULTIPLIER_TRAITS, InputType, OutputType> (A, B, C);
      break;
    case 4:
    	matrix_multiply_full<TransposeFormA, TransposeFormB, RowsA,  ColsA,  RowsB, ColsB, RowsC, ColsC, MULTIPLIER_TRAITS, InputType, OutputType> (A, B, C);
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

#endif
