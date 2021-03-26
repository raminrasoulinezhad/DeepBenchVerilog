
## Requirements:

1- Creat a python3 virtual environment. Then install hls4ml and it's dependancies. Note `venv_addr` is the location of your virtual environment.

	virtualenv -p /usr/bin/python3 venv_addr
	source venv_addr/bin/activate
	pip install hls4ml
	pip install hls4ml[profiling]

There is an issue in the hls4ml library. To solve that we need to modify a file. Opne the following file:

	venv_addr/lib/python3.7/site-packages/hls4ml/converters/keras_to_hls.py

modify this:

	def __del__(self):
        if self.h5file:
            self.h5file.close()

to this:

	def __del__(self):
        if self.h5file:
            try:
                self.h5file.close()
            except ImportError:
                pass


2- To prevent re-downlowding the json and h5 files (which we will modify for different NN models): 

we replace using the `fetch_example_model` function from `venv_addr/lib/python3.7/site-packages/hls4ml/utils/example_models.py` by `fetch_example_model_flex` located at `my_utils.py`. 


## HLS4ML for convolution layers: 

source: 
    
    https://github.com/fastmachinelearning/hls4ml/issues/289

1- change the compile strategy to `Resource`, located at `HLSConfig` class.
	
	vim venv_addr/lib/python3.7/site-packages/hls4ml/model/hls_model.py

modify this:

	self.model_strategy = 'Latency' 

to this:

	self.model_strategy = 'Resource' # Two options: 'Resource' and 'Latency' 


2- change IO-type to `io_stream` rather than `io_parallel`.

open the `main.py` file:

	vim ./main.py

modify this line:

	io_type = 'io_parallel'

to this:

	io_type = 'io_stream' # Two options: 'io_stream' or 'io_parallel'

3- Note, if the number of MAXMUL is a limit to the synthesis, and you have good amount of RAM memories, then try expanding the limit on  the number of implementation limited multipliers by modifying two files. (4096 --> to any number you want)

    vim     venv_addr/lib/python3.7/site-packages/hls4ml/converters/keras_to_hls.py
    vim     venv_addr/lib/python3.7/site-packages/hls4ml/templates/vivado/build_prj.tcl

### HLS4ML Samples:

To run the process:

    python3 main.py --do_compilation=True \
                    --force_replace=False \
                    --Precision='ap_fixed<8,4>' \
                    --ReuseFactor='1' \
                    --fpga_part='xcku115-flvb2104-2-i' \
                    --clock_period=5 \
                    --io_type='io_stream'

To generate verilog version for these models, you need to set the `model_name` parameter in `main.py` to one of the follwoing list:

    'keras': [  'KERAS_3layer_binarydense_relu_max.json',      --> Done (Strategy=Latency, io_type=io_parallel, Reuse=1)
                'keras_bnn.json',                              --> Done (Strategy=Latency, io_type=io_stream, Reuse=1)
                'jetTagger_Conv2D_Small.json',                 --> Done (Strategy=Resource, io_type=io_stream, Reuse=1)
                'KERAS_conv2d_model.json',                     --> Done (Strategy=Resource, io_type=io_stream, Reuse=1)
                'KERAS_dense_16x100x100x100x100x100x5.json',   2
                'qkeras_mnist_dense.json',                     Exception: ERROR: Unsupported layer type: QActivation
                'KERAS_dense_16x200x200x200x200x200x5.json',   
                'KERAS_3layer_ternary_small.json',             --> Done (Strategy=Resource, io_type=io_stream, Reuse=1)
                'qkeras_3layer.json',                          
                'KERAS_conv1d_small.json',
                'jetTagger_Conv2D_Small_NoBatchNorm.json',     --> Done (Strategy=Resource, io_type=io_stream, Reuse=1)
                'KERAS_3layer_binary_smaller.json',            Unsupported layers 
                'KERAS_conv1d.json',
                'garnet_1layer.json',                          
                'KERAS_3layer.json',
                'KERAS_1layer.json',
                'KERAS_3layer_batch_norm.json',
                'garnet_3layer.json',
                'KERAS_dense_16x500x500x500x500x500x5.json'],
    'onnx': [   'three_layer_bn_keras.onnx',
                'two_layer_pytorch.onnx',
                'conv1d_small_keras.onnx',
                'three_layer_bn_pytorch.onnx',
                'three_layer_keras.onnx',
                'dense_big_keras.onnx',
                'two_layer_keras.onnx',
                'conv2d_small_mp_keras.onnx',
                'conv2d_small_keras.onnx',
                'three_layer_pytorch.onnx'],
    'pytorch': ['two_layer_model.pt', 'three_layer_model.pt'],
    'tensorflow': ['3layer.pb']}

Then, it automatically implements it. Note you may need to chnage `Strategy` and `io_type` and `Reuse` parameters according to ech individual model. 

Your generated verilog files are located at: `hls_wrapper/my-hls-test/myproject_prj/solution1/syn/verilog`

We already generated some of the models. The results are located at `DeepBenchVerilog/verilog/hls4ml_instances`.

## simple rules:

1- Conv layers: 
    
    Strategy  = Resource
    io_type = io_stream
    reuse = reasonable number

2- MatMul (Dense layers)

    Strategy  = Resource
    io_type = io_serial
    reuse = reasonable number

3- Small cases   

    Strategy = Latency
    io_type = io_parallel
    reuse = does not matter

some limitaiton for Keras model:

    https://github.com/fastmachinelearning/models/blob/master/keras/README.md

A usefull tutorial:

    https://indico.cern.ch/event/925648/contributions/3889861/attachments/2049418/3435155/hls4ml_tutorial.pdf
