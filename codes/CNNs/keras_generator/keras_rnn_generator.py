import tensorflow as tf
import keras
import json
import argparse
from utils import save_model
import logging
logging.getLogger('tensorflow').disabled = True

def get_args():
	parser = argparse.ArgumentParser(description='')
	parser.add_argument('--batch', type=int, default=16, help='please enter the batch size')
	parser.add_argument('--timesteps', type=int, default=50, help='please enter the input timesteps')
	parser.add_argument('--hidden', type=int, default=1760, help='please enter the Hidden Units')
	parser.add_argument('--rnn_model', type=str, default='LSTM', help='please enter the rnn_model: (GRU, LSTM, SimpleRNN)')
	parser.add_argument('--keras_2_1_3', default=False, action='store_true', help='use it if you want to generate models suing keras 2.1.3')
	parser.add_argument('--model_name', type=str, default='model', help='Enter a name for the model.')
	parser.add_argument('--output_dir', type=str, default='./', help='Enter directory address for the output files.')
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
	is_simple_rnn = True if args.rnn_model == 'SimpleRNN' else False
	rnn_model = "keras.layers." + args.rnn_model
	rnn_model = eval(rnn_model)
	
	input_shape = (batch_size, timesteps, hidden)

	if args.keras_2_1_3:
		inputs = keras.layers.Input(shape=input_shape[1:])
		
		if is_simple_rnn:
			outputs = rnn_model(hidden,	
								return_sequences=False,
								activation='relu',
								kernel_regularizer=keras.regularizers.l1_l2(l1=1e-4, l2=0.0),
								name="gru_selu",
								recurrent_regularizer=keras.regularizers.l1_l2(l1=0.0010000000474974513, l2=0.0))(inputs)
		else:
			outputs = rnn_model(hidden,	
								return_sequences=False,
								activation='relu',
								kernel_regularizer=keras.regularizers.l1_l2(l1=1e-4, l2=0.0),
								name="gru_selu",
								recurrent_activation="sigmoid",
								recurrent_regularizer=keras.regularizers.l1_l2(l1=0.0010000000474974513, l2=0.0))(inputs)
			
		model = keras.Model(inputs=inputs, outputs=outputs)
		x = tf.random_normal(input_shape)
	else:
		model = keras.Sequential()
		model.add(  keras.layers.InputLayer(input_shape=input_shape[1:]) )
		model.add(	rnn_model(	hidden,	return_sequences=False))
		x = tf.random.normal(input_shape)


	print('input_shape', x.shape)
	y = model(x)
	print('output_shape', y.shape)

	save_model(model, args.model_name, args.output_dir)	
