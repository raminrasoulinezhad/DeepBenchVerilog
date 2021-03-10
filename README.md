# DeepBenchVerilog

This repository includes the verilog HDL version of the kernels presented in DeepBench, Baidu (https://github.com/baidu-research/DeepBench). To generate them, we used Xilinx HLS tool v2018.2 and it's sample projects as starters. The generated HDL kernels are captured and posted here. 


## Details:

Precision:

    Data precision = 8 bit  // sutable for PIR-DSP (https://ieeexplore.ieee.org/document/8735533)

Architecture:

We used Cascade architecture, which is optimized for fixed point arithmetics for high throughput. 

    ARCH_OPT = 4                // Cascade

Adder-tree architecture is not suitale as it is optimized for floating point arithmetic. this is based on comment presented in Vivado HLS codes. 

    ARCH_OPT = 3                // Adder-tree

IP core unrolling method:

1- larger IP cores are more efficient.
2- kernels with dimentions larger than 256 takes time to compile.
3- powers of two are not always delivering the best performance due to under-utilization
4- if the size is not dividable, we used the largest power of two which is lower or equal to 256.
5- complete unrolling for more than 1024 is not accepted. so we hard limited this unrrolling factor for all cases.

So, we picked largest kernels which dimentions are lower than 300. If the kernel is very narrow in one dimention, we enlargeed the boundaries. 


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

# Some usefull links:

online numerical factor decomposition tools:

        https://www.dcode.fr/2-factors-decomposition
