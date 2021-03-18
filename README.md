# DeepBenchVerilog

This repository includes the Verilog version of the DeepBench suit presented by Baidu. (https://github.com/baidu-research/DeepBench). To generate them, we used the Xilinx HLS tool v2018.2, and it's ready to use sample projects. This repository includes the generated Verilog model files.

DeepBench dataset categorizes the cases in the following hierarchy:

    DeepBench
    ├── Training
    │   ├── GEMMs       --> Done
    │   ├── RNNs        --> Done
    │   ├── CNNs        --> ongoing
    │   └── All-Reduce  --> ongoing
    └── Inference
        ├── GEMMs       --> Done
        ├── RNNs        --> Done
        └── CNNs        --> ongoing

## Directories and Files:

    DeepBenchVerilog
    ├── codes                   --> codes and scripts we used for this work
    │   ├── GEMMs_and_RNNs   
    │   └── CNNs                
    │       ├── hls4ml_wrapper       
    │       └── keras_generator      
    ├── verilog                 --> Include are benchmar kernels in Verilog. 
    │   ├── hls4ml_instances  
    │   ├── Training            --> DeepBench equivalents
    │   └── inference           --> DeepBench equivalents
    └── docs                    --> some selected manuals in pdf 

## How to redo our work:

### GEMMs and RNNs:

We used Vivado HLS sample project, matrix_multipy, to implement different matrix multiplicaiton operations. To do so:

1- Open Vivado HLS tool (we used v2018.2) 

    vivado_hls &

2- Open the `sample projects` and select `matrix_multipy`. 

3- Then, copy all the `.cpp` and `.h` files from `repo_addr/codes/GEMMs_and_RNNs/` to the main directory of the created project. Note, you will replace three files and add a new file, named `matrix_multiply_custom.h`. 

4- Then, add the new file (`matrix_multiply_custom.h`) to the Vivado HLS project. 

    project --> add source .. 

5- Tun the compilation and synthesis process. The used script is located at `repo_addr/codes/GEMMs_and_RNNs/script.tcl`

6- to generate thifferent kernel results modify the matrix operation dimentions located in `matrix_multiply.h`.

**Precision:**
The arithmetic precision is defined at `matrix_multiply.h` file:

    typedef ap_uint<8> MATRIX_T; 

This is suitable for architecture research such as PIR-DSP (https://ieeexplore.ieee.org/document/8735533)

**Architecture:**

We used Cascade architecture, which is optimized for fixed-point arithmetics for high throughput (look `matrix_multiply.h`). 

    const int ARCH_OPT = 4;                // Cascade

Adder-tree architecture is not suitable as it is optimized for floating-point arithmetic. This is based on comments at Vivado HLS libraries. 

    const int ARCH_OPT = 3;               // Adder-tree

**Unrolling factors**

As it is impossible to unroll large kernels fully, we used the following methodology to select the IP core computation. Then the IP can be used by scheduling the data over that to perform the calculation. We used the IP core Verilog model as the Verilog model for the corresponding benchmark case. Our used methodology is designed for 1) having a reasonable unrolling approach for embedded FPGA implementation with restricted resources and 2) for a reasonable compilation time targeting less than 12 hours per cases. The following are the observations/bases of the methodology, which are driven by cycle estimation analysis: 

1- Larger unrollings lead to higher performance and lower latency IP cores. 

2- In the case of RNNs and GEMMs, we deal with matrix multiplications. So, we can unroll three dimensions. Vivado HLS has a 1024 limitation for unrolling each dimension. 

3- Larger unrollings require higher compilation time. As a rule of thumb, if dimensions are all less or equal to 256, the compilation time is within 12 hours.

4- unrolling by the powers of two are not the best performance cases as it highly depends on the kernel sizes due to under-utilization. So, we see a lot of various IP core sizings. 

5- To avoid underutilization, we picked the largest divider of each kernel dimension size which is less or equal to 256.  Let's say a GEMM kernel is defined by `M=5124, N=9124, K=2560`. We choose ` 244` for unrolling the `M` dimension with reusing the IP for that dimension 21 times. 

**verilog models**

The output verilog model are available in `verilog/inference/GEMM/`, `verilog/training/GEMM/`, `verilog/inference/RNN/`, `verilog/training/RNN/` directories.


### CNNs

For the case of CNNs, we used the HLS4ML suit. This framework can accept high level describtions of a model, such as Keras models, and produces the corresonding verilog files for the given model. this process is dividable to 1) high-level synthesis (such as Keras model to C++ mode) and 2) HLS compilation (using vivado hls tool) to translate the C++ model to verilog files.

More details can be found at `./codes/CNNs/` directory and it's `README.md` file. Using these codes we translated the DeepBench cnn benchmarks to verilog. the results are saved in `verilog/inference/Conv/` and `verilog/training/Conv/`. We also used this tool to generate a few number of full network examples provided by hls4ml suite. Their verilog models are at `verilog/hls4ml_instances/`.

As there are some limitations, we assumed the following assumptions:

1- There is a maximum on the number of multiplicaitons (MAXMULT = 4096). 
2- input, weight, and output tensors should include less than 2^16 elements.

So, we picked smaller kernels to accelerate the computaitons on FPGA. it is because the kernels are different from the Deep Bench kernels. The mapping is mentioned at `codes/CNNs/kernel_generator/exps.sh`.


### Reduce kernels:
**We are still working on the all-reduce kernels.**

# Case studies:

## Training:

### GEMM Kernels (Done)

| Kernel                 | A^T | B^T | IP sizes        | Reuse        | Done |
|------------------------|-----|-----|-----------------|--------------|------| 
| M=1760, N=128,  K=1760 | N   | N   | 220 x 128 x 220 | 8  x 1  x  8 | Yes  | 
| M=7860, N=64,   K=2560 | N   | N   | 131 x 64  x 256 | 60 x 1  x 10 | Yes  | 
| M=2560, N=64,   K=2560 | N   | N   | 256 x 64  x 256 | 10 x 1  x 10 | Yes  | 
| M=5124, N=9124, K=2560 | T   | N   | 244 x 256 x 256 | 21 x 36 x 10 | Yes  | 
| M=3072, N=128,  K=1024 | T   | N   | 256 x 128 x 256 | 12 x 1  x 4  | Yes  | 


### Recurrent Kernels (Done)

The recurrent op kernels are only run on NVIDIA hardware.

| Hidden Units | Batch Size | TimeSteps | Recurrent Type  | Kernel                     | IP sizes        | Reuse       | Done | 
| -------------| ---------- | --------- | --------------- | -------------------------- | ----------------|-------------|------| 
| 1760         | 16         | 50        | Vanilla         | [1760, 3520] x [3520, 16]  | 220 x 16  x 220 | 8  x 1 x 12 | Yes  | 
| 2560         | 32         | 50        | Vanilla         | [2560, 5120] x [5120, 32]  | 256 x 32  x 256 | 10 x 1 x 20 | Yes  |
| 1024         | 128        | 25        | LSTM            | [4096, 2048] x [2048, 128] | 256 x 128 x 256 | 16 x 1 x 8  | Yes  |        
| 2816         | 32         | 1500      | GRU             | [8448, 5632] x [5632, 32]  | 256 x 32  x 256 | 33 x 1 x 22 | Yes  |         
### Convolution Layers - Conv

Case --> Verilog Directory

    conv_b32_in_161_700_1_f_5_20_32_s_2_p_valid -->  failed
    conv_b8_in_54_54_64_f_3_3_64_s_1_p_same     -->  verilog/training/Conv/conv_b8_in_28_28_16_f_3_3_16_s_1_p_same 
    conv_b16_in_224_224_3_f_3_3_64_s_1_p_same   -->  verilog/training/Conv/conv_b16_in_56_56_3_f_3_3_16_s_1_p_same  
    conv_b16_in_7_7_512_f_3_3_512_s_1_p_same    -->  verilog/training/Conv/conv_b16_in_7_7_16_f_3_3_16_s_1_p_same
    conv_b16_in_28_28_192_f_5_5_32_s_1_p_same   -->  verilog/training/Conv/conv_b16_in_28_28_16_f_5_5_8_s_1_p_same

## Inference:

### GEMM

| Kernel                 | A^T | B^T | IP sizes        | Reuse       | Done |
|------------------------|-----|-----|-----------------|-------------|------| 
| M=5124, N=700,  K=2048 | N   | N   | 244 x 175 x 256 | 21 x 4  x 8 | Yes  | 
| M=35,   N=700,  K=2048 | N   | N   | 35  x 175 x 256 | 1  x 4  x 8 | Yes  | 
| M=3072, N=3000, K=1024 | N   | N   | 256 x 200 x 256 | 12 x 15 x 4 | Yes  | 
| M=512,  N=6000, K=2816 | N   | N   | 256 x 200 x 256 | 2  x 30 x 11| Yes  | 

### Recurrent Kernels

| Hidden Units | Batch Size | TimeSteps | Recurrent Type | Kernel                   | IP sizes      | Reuse       | Done |
|--------------|------------|-----------|----------------|--------------------------|---------------|-------------|------|
| 1536         | 4          | 50        | LSTM           | [6144, 3072] x [3072, 4] | 256 x 4 x 256 | 24 x 1 x 12 | Yes  |
| 256          | 4          | 150       | LSTM           | [1024, 512]  x [512,  4] | 256 x 4 x 256 | 4  x 1 x 2  | Yes  |
| 2816         | 1          | 1500      | GRU            | [8448, 5632] x [5632, 1] | 256 x 1 x 256 | 33 x 1 x 22 | Yes  |
| 2560         | 2          | 375       | GRU            | [7680, 5120] x [5120, 2] | 256 x 2 x 256 | 30 x 1 x 20 | Yes  | 

### Convolution Layers - Conv

# Inference 

Case --> Verilog Directory

    conv_b1_in_224_224_3_f_7_7_64_s_2_p_same   --> verilog/inference/Conv/conv_b1_in_112_112_3_f_7_7_16_s_2_p_same  
    conv_b1_in_56_56_256_f_1_1_128_s_2_p_valid --> verilog/inference/Conv/conv_b1_in_56_56_16_f_1_1_64_s_2_p_valid  
    conv_b2_in_7_7_512_f_1_1_2048_s_1_p_valid  --> verilog/inference/Conv/conv_b2_in_7_7_32_f_1_1_128_s_1_p_valid
    conv_b4_in_171_40_8_f_5_5_32_s_2_p_valid   --> failed

# Notes:

The model to translate Recurrent network kernels to Matrix multiplication (based on MLBlock Repository):
Note: DeepBench assume `in = h`.

    Vanila RNN:  [ h x 2h] x [2h x B]
    LSTM:        [4h x 2h] x [2h x B]
    GRU:         [3h x 2h] x [2h x B]

How to run on servers:

    cd proj_addr
    vivado_hls ./proj_matrix_multiply/solution1/csynth.tcl


# Please cite our work at ***ISFPGA 2021***:

Note: Although these Verilog models are not used in [MLBlocks](https://dl.acm.org/doi/10.1145/3431920.3439479) paper, this repository is part of the development process of this work.

    @inproceedings{10.1145/3431920.3439479,
        author = {Rasoulinezhad, Seyedramin and Boland, David and Leong, Philip H.W.},
        title = {MLBlocks: FPGA Blocks for Machine Learning Applications},
        year = {2021},
        isbn = {9781450382182},
        publisher = {Association for Computing Machinery},
        url = {https://doi.org/10.1145/3431920.3439479},
        doi = {10.1145/3431920.3439479},
        booktitle = {The 2021 ACM/SIGDA International Symposium on Field-Programmable Gate Arrays},
    }

# Some usefull links (To be lazy):

### Online factor decomposition tools:

        https://www.dcode.fr/2-factors-decomposition

### HLS tools:

List of HLS tools (Academic and Commercial):

    https://en.wikipedia.org/wiki/High-level_synthesis

Panda HLS

    https://panda.dei.polimi.it/?page_id=81


PyMTL:

    https://github.com/cornell-brg/pymtl-tut-hls
    https://www.csl.cornell.edu/pymtl2019/

RFNoC:

    https://github.com/Xilinx/RFNoC-HLS-NeuralNet/blob/master/rfnoc/hls/keras_1layer/README.md

HLS4ML:

    https://github.com/fastmachinelearning/hls4ml
    # source: https://arxiv.org/pdf/2103.05579.pdf

### Installing TensorFlow on old CPUs (without supporting AVX instructions):

    https://tech.amikelive.com/node-882/how-to-build-and-install-the-latest-tensorflow-without-cuda-gpu-and-with-optimized-cpu-performance-on-ubuntu/

