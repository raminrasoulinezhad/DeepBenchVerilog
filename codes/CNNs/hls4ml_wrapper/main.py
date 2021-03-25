import hls4ml
import argparse

from my_utils import fetch_example_model_flex,str2bool

def get_args():
	parser = argparse.ArgumentParser(description='')

	parser.add_argument('--model_name', type=str, default="KERAS_conv2d_model.json", help='select model name. like: KERAS_conv2d_model.json')

	parser.add_argument('--do_compilation', type=str2bool, default=True, help='Run HLS4ML and Vivado HLS?')
	parser.add_argument('--force_replace', type=str2bool, default=False, help='Force to redownload an available model?')

	parser.add_argument('--Precision', type=str, default="ap_fixed<8,4>", help='computation precision, like: ap_fixed<8,4>')
	parser.add_argument('--ReuseFactor', type=str, default="1", help='computaiton resource reuse degree')
	parser.add_argument('--fpga_part', type=str, default="xcku115-flvb2104-2-i", help='fpga part name, like: xcku115-flvb2104-2-i ')
	parser.add_argument('--clock_period', type=int, default=5, help='clock period in ns')
	parser.add_argument('--io_type', type=str, default="io_stream", help='define the io_type, like: io_stream or io_parallel')
	
	return parser.parse_args()

if __name__ == "__main__":
	args = get_args()
	print('------------ Arguments -----------')
	for arg in vars(args):
		print (arg, getattr(args, arg))
	print('----------------------------------')

	# Parameters 
	do_compilation = args.do_compilation
	force_replace = args.force_replace

	Precision = args.Precision
	ReuseFactor = args.ReuseFactor
	fpga_part = args.fpga_part
	clock_period = args.clock_period
	io_type = args.io_type


	# Print full list of example models if you want to explore more
	hls4ml.utils.fetch_example_list()

	model_name = args.model_name

	# Fetch a keras model (download and return an example configuration file)
	#config = hls4ml.utils.fetch_example_model(model_name)
	config = fetch_example_model_flex(	model_name, 
										force_replace=force_replace,
										Precision=Precision,
										ReuseFactor=ReuseFactor,
										fpga_part=fpga_part,
										clock_period=clock_period,
										io_type=io_type
									)


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
		
		# Use Vivado HLS to synthesize the model
		hls_model.build(reset=False, csim=False, synth=True, cosim=False, validation=False, export=True, vsynth=True)

		# Print out the report if you want
		hls4ml.report.read_vivado_report('my-hls-test')
