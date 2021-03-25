import tensorflow as tf
import json
import onnx
import keras2onnx
import argparse
from utils import save_model

def get_args():
	parser = argparse.ArgumentParser(description='')
	parser.add_argument('--batch', type=int, default=12, help='please enter the batch size')
	parser.add_argument('--in_m', type=int, default=16, help='please enter the input rows')
	parser.add_argument('--in_k', type=int, default=32, help='please enter the input cols')
	parser.add_argument('--in_n', type=int, default=64, help='please enter the output cols')
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
	input_image_m = args.in_m
	input_image_k = args.in_k
	input_image_n = args.in_n

	print ("Computation: [ %d x %d x %d ] x [ %d x %d ]" % (batch_size, input_image_m, input_image_k, input_image_k, input_image_n))

	model = tf.keras.Sequential()
	model.add(  tf.keras.layers.InputLayer(input_shape=(batch_size, input_image_m, input_image_k)) )
	model.add(	tf.keras.layers.Dense(
					input_image_n,
					activation=None,
					use_bias=False))

	input_shape=(batch_size, input_image_m, input_image_k)
	print ("input_shape: ", input_shape)

	x = tf.random.normal(input_shape)
	y = model(x)
	print(y.shape)

	save_model(model, output_json, output_h5)	
