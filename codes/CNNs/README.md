To generate the CNN models, Please read the `README.md` fils in both `hls4ml_wrapper` and `keras_generator` directories. 

Files and folders hierarchies:

    CNNs
    ├── RFNoC-HLS-NeuralNet_example --> used for RFNoC project, to use old versions of HLS4ML tools
    ├── keras_generator				--> to generate required Keras model (it will be the input for HLS4ML tool)
	└── hls4ml_wrapper      		--> To generate verilog files from the Keras models

## To use the hls4ml over the provided samples by hls4ml repository:

In this case you only need to use `hls4ml_wrapper`. 

1- `cd hls4ml_wrapper`
2- modify the `main.py` file. you can choose the `Precision`, `model_name`, ....
3- use `make run_main`

## To synthesis any Keras model:

You need to first use `keras_generator` directory to creat a keras model and save it as a `.json` and `.h5` files. To do so, see the `keras_generator/README.md` for more information. Briefly, you need to use `keras_generator/keras_conv_generator.py` file. It can generate any given configuration of convolution layer using KEras and save it as `.json` and `.h5` files. If you need to have more conplex models, you need to modify this code or creat a similar one. Some examples showing how to use this file is provided in exps.sh. Also, the Makefile can run this code as well.

after generating the `.json` and `.h5` files, you need to move them to `hls4ml_wrapper` directory with a specific name. To do so, use `make copy_keras_to_hls4ml_prj`. it do the following commands:

	cp model.json ../hls4ml_wrapper/KERAS_conv2d_model.json
	cp model_weights.h5 ../hls4ml_wrapper/KERAS_conv2d_model_weights.h5

Then you should go to the `hls4ml_wrapper` directory and modify the `model_name` to `hls4ml_wrapper` at `main.py`. then you can use `make run_main` command at `hls4ml_wrapper` directory to start the modeling.

