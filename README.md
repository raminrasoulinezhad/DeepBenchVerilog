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


## How to redo our work:

Up to now, we only prepared the GEMM and RNN cases. To do so:

1- Open Vivado HLS tool (we used v2018.2) 

    vivado_hls &

2- Open the sample projects list and select matrix_multipy. 

3- Then, copy the `.cpp` and `.h` files from `repo_addr/codes/GEMMs_and_RNNs/` to the main project directory. Note, you will replace three files and add a new file, named "matrix_multiply_custom.h". 

4- Then, add the new file to the project files on Vivado HSL. 

    project --> add source .. 

5- run the compilation and synthesis process. The used script is located at `repo_addr/codes/GEMMs_and_RNNs/script.tcl`


## Architecture details:

**Precision:**
The arithmetic precision is defined at `repo_addr/codes/GEMMs_and_RNNs/matrix_multipy.h`:

    Data precision = 8 bit // (ap_uint<8>) 

 This is suitable for architecture research such as PIR-DSP (https://ieeexplore.ieee.org/document/8735533)


**Architecture:**

We used Cascade architecture, which is optimized for fixed-point arithmetics for high throughput. 

    ARCH_OPT = 4                // Cascade

Adder-tree architecture is not suitable as it is optimized for floating-point arithmetic. This is based on comments at Vivado HLS libraries. 

    ARCH_OPT = 3                // Adder-tree

**Unrolling factors**

As it is impossible to unroll large kernels fully, we used the following methodology to select the IP core computation. Then the IP can be used by scheduling the data over that to perform the calculation. We used the IP core Verilog model as the Verilog model for the corresponding benchmark case. Our used methodology is designed for 1) having a reasonable unrolling approach for embedded FPGA implementation with restricted resources and 2) for a reasonable compilation time targeting less than 12 hours per cases. The following are the observations/bases of the methodology, which are driven by cycle estimation analysis: 

1- Larger unrollings lead to higher performance and lower latency IP cores. 

2- In the case of RNNs and GEMMs, we deal with matrix multiplications. So, we can unroll three dimensions. Vivado HLS has a 1024 limitation for unrolling each dimension. 

3- Larger unrollings require higher compilation time. As a rule of thumb, if dimensions are all less or equal to 256, the compilation time is within 12 hours.

4- unrolling by the powers of two are not the best performance cases as it highly depends on the kernel sizes due to under-utilization. So, we see a lot of various IP core sizings. 

5- To avoid underutilization, we picked the largest divider of each kernel dimension size which is less or equal to 256.  Let's say a GEMM kernel is defined by `M=5124, N=9124, K=2560`. We choose ` 244` for unrolling the `M` dimension with reusing the IP for that dimension 21 times. 

We are still working on the convolution layer and all-reduce kernels. 

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
| 1536         | 4          | 50        | LSTM           | [6144, 3072] x [3072, 4] | 256 x 4 x 256 | 24 x 1 x 12 | tuna     | 6899
| 256          | 4          | 150       | LSTM           | [1024, 512]  x [512,  4] | 256 x 4 x 256 | 4  x 1 x 2  | tuna     | 6899
| 2816         | 1          | 1500      | GRU            | [8448, 5632] x [5632, 1] | 256 x 1 x 256 | 33 x 1 x 22 | Yes  |
| 2560         | 2          | 375       | GRU            | [7680, 5120] x [5120, 2] | 256 x 2 x 256 | 30 x 1 x 20 | Yes  | 


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

Online numerical factor decomposition tools:

        https://www.dcode.fr/2-factors-decomposition
