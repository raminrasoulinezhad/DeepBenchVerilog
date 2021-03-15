
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



### Samples:

'keras': [   'KERAS_3layer_binarydense_relu_max.json',      --> not working
                 'keras_bnn.json',                          
                 'jetTagger_Conv2D_Small.json',
                 'KERAS_conv2d_model.json',                 --> io_stream / Reuse=1 / Strategy: Resource
                 'KERAS_dense_16x100x100x100x100x100x5.json',
                 'qkeras_mnist_dense.json',
                 'KERAS_dense_16x200x200x200x200x200x5.json',
                 'KERAS_3layer_ternary_small.json',
                 'qkeras_3layer.json',
                 'KERAS_conv1d_small.json',
                 'jetTagger_Conv2D_Small_NoBatchNorm.json',
                 'KERAS_3layer_binary_smaller.json',
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

