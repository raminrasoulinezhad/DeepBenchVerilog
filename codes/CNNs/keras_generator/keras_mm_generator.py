import tensorflow as tf
import json
import argparse
from utils import save_model

def get_args():
	parser = argparse.ArgumentParser(description='')
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

	input_image_m = args.in_m
	input_image_k = args.in_k
	input_image_n = args.in_n

	print ("Computation: [ %d x %d ] x [ %d x %d ]" % (input_image_m, input_image_k, input_image_k, input_image_n))

	input_shape=(input_image_m, input_image_k)
	print ("input_shape: ", input_shape)

	model = tf.keras.Sequential()
	model.add(  tf.keras.layers.InputLayer(input_shape=input_shape) )
	model.add(	tf.keras.layers.Dense(
					input_image_n,
					activation=None,
					use_bias=True))

	x = tf.random.normal(input_shape)
	print('input_shape', x.shape)
	y = model(x)
	print('output_shape', y.shape)

	save_model(model)	
