# DeepBenchVerilog

This repository includes the verilog HDL version of the kernels presented in DeepBench, Baidu (https://github.com/baidu-research/DeepBench). To generate them, we used Xilinx HLS tool v2018.2 and it's sample projects as starters. The generated HDL kernels are captured and posted here. 


## Details:

    Arch = 3                // Adder-tree
    Data precision = 8 bit  // sutable for PIR-DSP (https://ieeexplore.ieee.org/document/8735533)

## Please cite our work at ***ISFPGA 2021***:

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

