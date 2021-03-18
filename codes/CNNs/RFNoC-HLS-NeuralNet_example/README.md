This directory describes "How to use" [github.com/Xilinx/RFNoC-HLS-NeuralNet](https://github.com/Xilinx/RFNoC-HLS-NeuralNet) repository samples. The goal of this repository is building an SOC for RFNoC project using keras/pytorch/tensorflow models. Their examples are explained [here](https://github.com/Xilinx/RFNoC-HLS-NeuralNet/tree/master/rfnoc/hls/keras_1layer). 

**Follow this steps to compile their examples:**

1- Install hls4ml using pip3:

    pip3 install hls4ml

2- Clone hls4ml repository as used in [Xilinx/RFNoC-HLS-NeuralNet](https://github.com/Xilinx/RFNoC-HLS-NeuralNet) (by their example):

    git clone https://github.com/fastmachinelearning/hls4ml.git

3- checkout the specfic commit with hash number of "099aa99ccb9af486b2d511da9b90e7f60361dd74":

    cd hls4ml
    git checkout 099aa99ccb9af486b2d511da9b90e7f60361dd74

4- Let's prepare the required configuration files.

    config.yml --> describe the architecture parameters and locations of following two files.
    model.json --> describe the network architecture.
    weights.h5 --> describe the network weiht parameters 

So, for any configuration we need to change model.jason. We need to remove weights.h5 and the corresponding codes. To do so, we need to work on `hls4ml/keras_to_hls/keras_to_hls..py` to somehow bypass the h5 file and generate random numbers. (it is possible)


5- Then, use keras to hls convertor (`hls4ml_addr` = the location of cloned repository of hls4ml). This generates all required C files for passing to Vivado HLS tool.
    
    python hls4ml_addr/keras-to-hls/keras-to-hls.py -c config.yml

6- let's turn of the simulations (soft/hard):

    vim build_prj.tcl 

and change 

    array set opt {
      csim   1
      synth  1
      cosim  1
      export 1
    }

to 

    array set opt {
      csim   0
      synth  1
      cosim  0
      export 1
    }


7- Then, generate the verilog file

    vivado_hls -f build_prj.tcl

