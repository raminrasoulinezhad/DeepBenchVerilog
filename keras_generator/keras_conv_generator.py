import tensorflow as tf
import json
import onnx
import keras2onnx
import argparse

def get_args():
	parser = argparse.ArgumentParser(description='')

	parser.add_argument('--batch', type=int, default=1)
	parser.add_argument('--in_x', type=int, default=8)
	parser.add_argument('--in_y', type=int, default=8)
	parser.add_argument('--in_c', type=int, default=1)
	parser.add_argument('--filters', type=int, default=2)
	parser.add_argument('--kernel_x', type=int, default=3)
	parser.add_argument('--kernel_y', type=int, default=3)
	parser.add_argument('--strides', type=int, default=1)
	parser.add_argument('--padding', type=str, default="same", help='same or valid?')
	parser.add_argument('--dilation_rate', type=int, default=1)
	parser.add_argument('--groups', type=int, default=1)

	return parser.parse_args()


def get_conv_model(	input_shape=(32, 32, 3),
					filters=16, 
					kernel_size=3, 
					strides=(1, 1), 
					padding="valid", # "valid"/"same"
					dilation_rate=(1, 1),
					groups=1,
					activation=None,
					use_bias=True
				):

	inputs = tf.keras.Input(shape=input_shape)
	conv1 = tf.keras.layers.Conv2D(
					filters,
					kernel_size,
					strides=strides,
					padding=padding,
					dilation_rate=dilation_rate,
					groups=groups,
					activation=activation,
					use_bias=use_bias
				)(
					inputs
				)
	dense1 = tf.keras.layers.Dense(10, activation=tf.nn.relu)(conv1)

	model = tf.keras.Model(inputs, dense1)
	model.compile(	optimizer="adam", 
					loss="mean_squared_error")
	return model


if __name__ == "__main__":

	args = get_args()
	print('------------ Arguments -----------')
	for arg in vars(args):
		print (arg, getattr(args, arg))
	print('----------------------------------')

	output_json = True
	output_h5 = True
	output_onnx = False

	MODEL_TYPE = "Sequential"  		# "Sequential" / "Functional"

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

	if MODEL_TYPE == "Sequential":
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
		#model.add(tf.keras.layers.Dropout(.2))
		#model.add(tf.keras.layers.Flatten())
		#model.add(tf.keras.layers.Dense(10, activation=tf.nn.relu))

	elif MODEL_TYPE == "Functional":
		model = get_conv_model(
					input_shape=(input_image_x, input_image_y, input_image_c),
					filters=filters, 
					kernel_size=kernel_size, 
					strides=strides, 
					padding=padding,
					dilation_rate=dilation_rate,
					groups=groups,
					activation=activation,
					use_bias=use_bias)
	else:
		raise Exception ("MODEL_TYPE is wrong !!!!! ")


	x = tf.random.normal(input_shape)
	y = model(x)
	print(y.shape)


	## Save model as JSON file
	if output_json:
		# source: https://machinelearningmastery.com/save-load-keras-deep-learning-models/
		model_json = model.to_json(indent=4, sort_keys=True)	
		with open("model.json", "w") as json_file:
			json_file.write(model_json)

	## save model and its weights as h5 files
	if output_h5:	
		# save model to h5
		model.save("model.h5")
		# save model weights 
		model.save_weights("model_weights.h5")

	## save model as onnex file
	if output_onnx:
		onnx_model = keras2onnx.convert_keras(model)
		keras2onnx.save_model(onnx_model, 'model.onnx')
		#onnx.save_model(onnx_model, 'model.onnx')
	