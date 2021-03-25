import tensorflow as tf
import json
import onnx
import keras2onnx
import argparse
from utils import save_model

def get_args():
	parser = argparse.ArgumentParser(description='')
	parser.add_argument('--batch', type=int, default=16, help='please enter the batch size')
	parser.add_argument('--timesteps', type=int, default=50, help='please enter the input timesteps')
	parser.add_argument('--hidden', type=int, default=1760, help='please enter the Hidden Units')
	parser.add_argument('--keras_model', type=str, default='LSTM', help='please enter the keras_model: (GRU, LSTM, SimpleRNN)')
	
	return parser.parse_args()

if __name__ == "__main__":

	args = get_args()
	print('------------ Arguments -----------')
	for arg in vars(args):
		print (arg, getattr(args, arg))
	print('----------------------------------')

	batch_size = args.batch
	timesteps = args.timesteps
	hidden = args.hidden
	keras_model = "tf.keras.layers." + args.keras_model
	keras_model = eval(keras_model)
	
	input_shape = (batch_size, timesteps, hidden)

	model = tf.keras.Sequential()
	model.add(  tf.keras.layers.InputLayer(input_shape=input_shape[1:]) )
	model.add(	keras_model(	hidden,
							 	return_sequences=False))

	x = tf.random.normal(input_shape)
	print('input_shape', x.shape)
	y = model(x)
	print('output_shape', y.shape)

	save_model(model)	
