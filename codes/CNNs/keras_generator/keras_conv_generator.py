import tensorflow as tf
import json
import onnx
import keras2onnx
import argparse
from utils import save_model


def get_args():
	parser = argparse.ArgumentParser(description='')

	parser.add_argument('--batch', type=int, default=1, help='please enter the batch size')
	parser.add_argument('--in_x', type=int, default=8, help='please enter the input x dimention size')
	parser.add_argument('--in_y', type=int, default=8, help='please enter the input y dimention size')
	parser.add_argument('--in_c', type=int, default=1, help='please enter the input channel size')
	parser.add_argument('--filters', type=int, default=2, help='please enter the number of filters')
	parser.add_argument('--kernel_x', type=int, default=3, help='please enter the filter kernel size (x dim)')
	parser.add_argument('--kernel_y', type=int, default=3, help='please enter the filter kernel size (y dim)')
	parser.add_argument('--strides', type=int, default=1, help='please enter the kernel strides')
	parser.add_argument('--padding', type=str, default="same", help='please enter the kernel padding. same or valid?')
	parser.add_argument('--dilation_rate', type=int, default=1)
	parser.add_argument('--groups', type=int, default=1)

	return parser.parse_args()


if __name__ == "__main__":

	args = get_args()
	print('------------ Arguments -----------')
	for arg in vars(args):
		print (arg, getattr(args, arg))
	print('----------------------------------')

	output_json = True
	output_h5 = True
	output_onnx = False

	batch_size = args.batch
	input_image_x = args.in_x
	input_image_y = args.in_y
	input_image_c = args.in_c

	filters = args.filters
	kernel_size = (args.kernel_x, args.kernel_y)
	strides = (args.strides, args.strides) 
	padding = args.padding
	dilation_rate = (args.dilation_rate, args.dilation_rate)
	groups = args.groups
	activation = 'relu'
	use_bias = True

	input_shape = (batch_size, input_image_x, input_image_y, input_image_c)	
	print ("input shape: ", input_shape)

	model = tf.keras.Sequential()
	model.add(  tf.keras.layers.InputLayer(input_shape=(input_image_x, input_image_y, input_image_c)))
	model.add(	tf.keras.layers.Conv2D(
					filters,
					kernel_size,
					strides=strides,
					padding=padding,
					dilation_rate=dilation_rate,
					groups=groups,
					activation=activation,
					use_bias=use_bias))

	x = tf.random.normal(input_shape)
	y = model(x)
	print(y.shape)

	# To check the VIVADO HLS tool constraints 
	mat_in_size = input_image_x * input_image_y * input_image_c
	mat_weight_size = filters * kernel_size[0] * kernel_size[1] * input_image_c
	mat_out_size = y.shape[1] * y.shape[2] * y.shape[3]
	if (mat_in_size >= 2**16):
		print('#--> Warning: This may not fit hls4ml constraints (large input).')
	if (mat_weight_size >= 2**16):
		print('#--> Warning: This may not fit hls4ml constraints (large weight).')
	if (mat_out_size >= 2**16):
		print('#--> Warning: This may not fit hls4ml constraints (large output).')

	print('MAXMUL: ', mat_weight_size)
	
	save_model(model, output_json, output_h5)	
