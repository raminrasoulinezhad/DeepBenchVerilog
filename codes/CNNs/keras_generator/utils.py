import tensorflow as tf
import json
import onnx
import keras2onnx

def save_model(model, output_json, output_h5):

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
