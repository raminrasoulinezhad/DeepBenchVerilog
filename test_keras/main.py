import tensorflow as tf
import json
import onnx
import keras2onnx

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
	print(" ----------------- Convolution layer info ----------------- ")
	print("filters:", filters)
	print("kernel_size: ", kernel_size)
	print("strides: ", strides)
	print("padding: ", padding)
	print("dilation_rate: ", dilation_rate)
	print("groups: ", groups)
	print("activation: ", activation)
	print("use_bias: ", use_bias)
	print(" ---------------------------------- ")

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

	MODEL_TYPE = "Sequential"  		# "Sequential" / "Functional"

	batch_size = 1
	input_image_x = 8
	input_image_y = 8
	input_image_c = 1
	filters = 2
	kernel_size = 3
	strides = (1, 1) 
	padding = "same" 				# "valid"/"same"
	dilation_rate = (1, 1)
	groups = 1
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
		model.add(tf.keras.layers.Dropout(.2))
		model.add(tf.keras.layers.Flatten())
		model.add(tf.keras.layers.Dense(10, activation=tf.nn.relu))

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

	# save model to h5
	model.save("model.h5")
	# save model weights 
	model.save_weights("model_weights.h5")

	## save onnex version
	#onnx_model = keras2onnx.convert_keras(model)
	#keras2onnx.save_model(onnx_model, 'model.onnx')
	#onnx.save_model(onnx_model, 'model.onnx')


	# serialize model to JSON
	# source: https://machinelearningmastery.com/save-load-keras-deep-learning-models/
	model_json = model.to_json(indent=4, sort_keys=True)	
	with open("model.json", "w") as json_file:
		json_file.write(model_json)
	