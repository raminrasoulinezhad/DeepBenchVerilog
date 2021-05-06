## Introduction:

This manual describes how to use `hls4ml_rnn_repo` which is available at [https://github.com/chaitanyaPaikara/hls4ml.git](https://github.com/chaitanyaPaikara/hls4ml.git). This repo provides a framework to use hls4ml and vivado_hls tools for RNN models such as vanilla RNNs, LSTMs, and GRUs.

## Instruction:

1- Download and install the repo (including creating a virtual environment using conda):

	git clone https://github.com/chaitanyaPaikara/hls4ml.git
	mv hls4ml/ hls4ml_rnn_repo_chaitanyaPaikara/
	cd hls4ml_rnn_repo_chaitanyaPaikara
	git checkout keras-RNN

install the required libraries:

	virtualenv -p /usr/bin/python3.6 venv
	source venv/bin/activate
	pip install torch torchvision scikit-learn h5py pyyaml hls4ml
	cp -r hls4ml venv/lib/python3.6/site-packages/

2- Run hls4ml and vivado_hls for a sample mode:

**Note:** Model name should be any model name located in `repo_addr/example-models/keras/*` wihtout `.json` or `_weight.h5` 

	cp -r ../../hls4ml_rnn_repo/example-models/keras/ ../example-models/

generate the c++ files:

	cd test
	./keras-to-hls.sh --help  			# to see the options
	#./keras-to-hls.sh -x 'xc7vx690tffg1927-2' -c 5 -s  -r  16 -d ./projects  -t 'ap_fixed<8,4>' -g Resource  KERAS_lstm_model
	./keras-to-hls.sh -x 'xcvu13p-fsga2577-2-i' -c 5 -s  -r  16 -d ./projects  -t 'ap_fixed<8,4>' -g Resource  KERAS_lstm_model

3- Run the vivado_hls tool
The previous command generate the c++ and scripts required for Vivado HLS tool. Now, move to the vivado_hls directory and run the synthesis. before that you need to modify some files.  

	tar -zxvf projects/*.tar.gz
	#cd ./projects/project_dir
	cd ./projects/*

Now, finally you can run it. Due to the new vivado_hls pragmas, like STABLE, we need 2019.2 or more recent versions: 
	
	source /opt/Xilinx/Vivado/2019.2/settings64.sh
	vivado_hls -f build_prj.tcl
