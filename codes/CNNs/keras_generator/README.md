# Keras model generator

### Requirements:

Install the required libraries on your python environment:

<!--pip install tensorflow==2.3 Keras -->

For most recent version of Keras (in out case it was 2.4.0):

	virtualenv -p /usr/bin/python3.6 ../../../venv_2_4_0
	source ../../../venv_2_4_0/bin/activate
	pip install Keras tensorflow  

For Keras 2.1.3 format:

	virtualenv -p /usr/bin/python3.6 ../../../venv_2_1_3
	source ../../../venv_2_1_3/bin/activate
	pip install keras==2.1.3 tensorflow-gpu==1.15
	
**Note:** The keras should be placed before tensorlfow. Why? I really don't know. But, it i important.

### How to use the codes:

This directory provides simple and straightforward automation to create various Keras models. These model generate the input files for the HLS4ML tool.  

These files can be manually used for creating Convolution, matrix multiplication (based on using Dense layer), and RNN layers. 

	keras_conv_generator.py 
	keras_mm_generator.py  
	keras_rnn_generator.py

To run these codes, use the Python3 environment as mentioned at the beginning. Check the input arguments using the following command:

	python3  keras_conv_generator.py  --help
	python3  keras_mm_generator.py  --help
	python3  keras_rnn_generator.py  --help

**Sample:**
For Keras 2.1.3 format:

	python3 keras_rnn_generator.py --batch=1 --timesteps=15 --hidden=28 --rnn_model='GRU' --keras_2_1_3

For most recent version of Keras:

	python3 keras_rnn_generator.py --batch=1 --timesteps=15 --hidden=28 --rnn_model='GRU'

To check the created files, you can load and examine the created models using our script in `keras_loader.py`. This is only a starting point for debugging. 


To clear the temp and generated files, you can use:

	make clean
 
# Sample model configurations:

We used these python codes to generate the required Keras models for DeepBenchVerilog generation. `exps.sh` reports the configurations that we used. After generating each case, you need to use the following command to copy the models to the hls4ml project directory by:

	make  copy_keras_to_hls4ml_prj 

**Note:** we used `KERAS_conv2d_model` as the proxy to feed the hls4ml tool's script out generated models.
