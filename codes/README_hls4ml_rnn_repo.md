## Introduction:

This manual describes how to use `hls4ml_rnn_repo` which is available at [https://github.com/raminrasoulinezhad/hls4ml](https://github.com/raminrasoulinezhad/hls4ml). This repo provides a framework to use hls4ml and vivado_hls tools for RNN models such as vanilla RNNs, LSTMs, and GRUs.

## Instruction:

1- Download and install the repo (including creating a virtual environment using conda):

	git clone https://github.com/raminrasoulinezhad/hls4ml.git
	cd hls4ml
	chmod +x ./install.sh
	./install.sh

**Note** this repository is based on [https://github.com/richarao/hls4ml/tree/keras-lstm](https://github.com/richarao/hls4ml/tree/keras-lstm) (a variend of [https://github.com/fastmachinelearning/hls4ml/tree/master/hls4ml](https://github.com/fastmachinelearning/hls4ml/tree/master/hls4ml) which is the standard hls4ml tool).

Then activate the environment:

	conda activate hls4ml-env

You need to manually replace hls4ml library files with a specific version with is located at the repo. So, check where the hls4ml is installed. 

	python
	>>> import hls4ml
	>>> hls4ml.__path__
	the output in our case: ['~/.local/lib/python3.6/site-packages/hls4ml']

<!--- To replace the files, use the following code:

	cp repo_addr/hls4ml ~/.local/lib/python3.6/site-packages/
--->

Also, as we only need synthesis process, turn off the simulation task by 

	vim ~/.local/lib/python3.6/site-packages/hls4ml/templates/vivado/build_prj.tcl

and change the begining part to:

	array set opt {
	  reset      0
	  csim       0
	  synth      1
	  cosim      0
	  validation 0
	  export     0
	  vsynth     0
	}

also change the maximum for max multiplier:

	catch {config_array_partition -maximum_size 4096}
to 
	
	catch {config_array_partition -maximum_size 12288}


We also need to modify the `MAXMULT` value.

	vim ~/.local/lib/python3.6/site-packages/hls4ml/converters/keras_to_hls.py

Modify the begining of the file to:

	MAXMULT = 12288

2- Run hls4ml and vivado_hls for a sample mode:

	cd test
	./keras-to-hls.sh --help  			# to see the options
	./keras-to-hls.sh \
		-x 'xc7vx690tffg1927-2' \
		-c 5					\
		-i io_serial			\
		-r  16					\
		-d ./projects 			\
		-t 'ap_fixed<8,4>' 		\
		-g Resource 			\
		-m 20 					\
		KERAS_lstm_model

**Note:** Model name should be any model name located in `repo_addr/example-models/keras/*` wihtout `.json` or `_weight.h5` 

**Note:** to have better control of the process, please defines all arguments. 

**Note** -m means max loop, which defines the loop/sequence iterations for the rnn layer. 

3- Run the vivado_hls tool
The previous command generate the c++ and scripts required for Vivado HLS tool. Now, move to the vivado_hls directory and run the synthesis. before that you need to modify some files.  

	cd ./projects/project_dir
	vim build_prj.tcl

Let's turn the simulations off and turn the synthesis process on. So, at the begining of the file, change the values like the bellow lines.

	array set opt {
	  reset      0
	  csim       0
	  synth      1
	  cosim      0
	  validation 0
	  export     0
	  vsynth     0
	}

Now, finally you can run it by: 

	vivado_hls -f build_prj.tcl

**Note**
This works well for GRU models. However, for LSTM models, you need to modify the generated files. The problem is that the hls4ml library does not correctly create the `project_addr/firmware/parameters.h` file. So, before running the the vivado_hls tool, you need to add the missed infomration regarding number of sequences in LSTM layers.

	vim project_dir/firmware/parameter.h

Now, add these informations to the config varibale of the lstm layers using `defines.h` parameters (let's say config3 relates to an lstm layer):

if in your keras model `return_sequences` is `False`:

	struct config3 : nnet::lstm_config {
		...
		static const unsigned n_sequence = N_LOOP_3;
		static const unsigned n_sequence_out = N_LOOP_3;
		...
	};

else:

	struct config3 : nnet::lstm_config {
		...
		static const unsigned n_sequence = N_LOOP_3;
		static const unsigned n_sequence_out = 1;
		...
	};

Then you can run the vivado_hls tool. 

## Some rules for acceptable RNN models:

1- Rule 1:

	(Number of Sequences) * (Hidden layer size) < 2^16

Reason: It will be saved in a `short int` variable. It is a HLS4ML's limit. You can ignore this part as does not affect the HW. 

2- Rule 2:

	(Hidden layer size) * (Hidden layer size) * 3 < MAXMULT	--> GRU
	(Hidden layer size) * (Hidden layer size) * 4 < MAXMULT	--> LSTM


## What is the difference between this repo and it's origin repo? 

To use the `repo_addr/test/keras_to_hls.sh` script for LSTM models, we needed to update this file to be more general. You can follow them by checking the very first two commits `12b06cd30212941833726d8fc59c53f93df10820`, `37601216ee3725e759b4f8918f235da537638cf7`, and `b6add159927c68d3cfde1df529b0d8e2c44c37f1`.
