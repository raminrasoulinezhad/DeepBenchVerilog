# Keras model generator

### Requirements:

Install the required libraries on your python environment:

	pip install tensorflow==2.3 Keras 

### How to use the codes:

This directory provides simple and straightforward automation to create various Keras models. These model generate the input files for the HLS4ML tool.  

These files can be manually used for creating Convolution, matrix multiplication (based on using Dense layer), and RNN layers. 

	keras_conv_generator.py 
	keras_mm_generator.py  

To run these codes, use the Python3 environment as mentioned at the beginning. Check the input arguments using the following command:

	python3  keras_conv_generator.py  --help



To check the created files, you can load and examine the created models using our script in `keras_loader.py`. This is only a starting point for debugging. 


To clear the temp and generated files, you can use:

	make clean
 
# Sample model configurations:

We used these python codes to generate the required Keras models for DeepBenchVerilog generation. `exps.sh` reports the configurations that we used. After generating each case, you need to use the following command to copy the models to the hls4ml project directory by:

	make  copy_keras_to_hls4ml_prj 

**Note:** we used `KERAS_conv2d_model` as the proxy to feed the hls4ml tool's script out generated models.
