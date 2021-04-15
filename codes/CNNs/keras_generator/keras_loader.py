import tensorflow as tf
import json
import argparse

from keras.models import Sequential
from keras.layers import Dense
from keras.models import model_from_json

if __name__ == "__main__":

	# load json and create model
	json_file = open('../hls4ml_wrapper/KERAS_conv2d_model.json', 'r')
	loaded_model_json = json_file.read()
	json_file.close()
	model = model_from_json(loaded_model_json)
	
	# load weights into new model
	#model.load_weights("../hls4ml_wrapper/KERAS_conv2d_model_weights.h5")
	#print("Loaded model from disk")

	print('-------------------------------')
	for k, v in model.__dict__.items():
		print(k, v)
		if k == '_layers':
			for i in v:
				print('##################')
				print('###', i)
				print('##################')
				for j, k in i.__dict__.items():
					#if j == '_batch_input_shape':
					print ('    --> ', j, k)

	print('-------------------------------')


	#for k, v in model.__dict__.items():
	#	if "function" in str(v):
	#		print(k)
		

	batch_size = 1
	input_image_x = 8
	input_image_y = 8
	input_image_c = 1

	input_shape = (batch_size, input_image_x, input_image_y, input_image_c)	
	print ("input shape: ", input_shape)

	x = tf.random.normal(input_shape)
	y = model(x)
	print(y.shape)
