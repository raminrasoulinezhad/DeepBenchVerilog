import hls4ml
from my_utils import fetch_example_model_flex

do_compilation = True

# Print full list of example models if you want to explore more
hls4ml.utils.fetch_example_list()

fetch_method = hls4ml.utils.fetch_example_model
#fetch_method = hls4ml.utils.fetch_example_model_flex

# model_name = 'jetTagger_Conv2D_Small_NoBatchNorm.json' 	# fails
#model_name = 'KERAS_conv2d_model.json'		# fails
#model_name = 'KERAS_3layer.json'			# OK
model_name = 'conv2d_small_mp_keras.onnx'	# OK
#model_name = 'conv2d_small_keras.onnx'

# Fetch a keras model (download and return an example configuration file)
#config = hls4ml.utils.fetch_example_model(model_name)
config = fetch_example_model_flex(model_name, force_replace=False)


# Print the configurations
print(config) 


if do_compilation:
	#Convert it to a hls project

	if '.json' in model_name:
		hls_model = hls4ml.converters.keras_to_hls(config)
	elif '.onnx' in model_name:
		hls_model = hls4ml.converters.onnx_to_hls(config)
	elif '.pt' in model_name:
		hls_model = hls4ml.converters.pytorch_to_hls(config)
	elif '.pb' in model_name:
		hls_model = hls4ml.converters.tf_to_hls(config)
	else:
		raise Exception ("model name file type is not supported !! ")
	
	#config['IOType'] = "io_stream"

	# Use Vivado HLS to synthesize the model
	hls_model.build(reset=False, csim=False, synth=True, cosim=False, validation=False, export=True, vsynth=True)

	# Print out the report if you want
	hls4ml.report.read_vivado_report('my-hls-test')
