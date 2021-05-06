import tensorflow as tf
import json

def save_model(model, model_name, output_dir):

	dir_plus_name = output_dir + '/' + model_name 
	## Save model as JSON file
	# source: https://machinelearningmastery.com/save-load-keras-deep-learning-models/
	model_json = model.to_json(indent=4, sort_keys=True)	
	with open(dir_plus_name + ".json", "w") as json_file:
		json_file.write(model_json)

	### save model and its weights as h5 files	
	## save model to h5
	#model.save(dir_plus_name + ".h5")
	
	# save model weights 
	model.save_weights(dir_plus_name + "_weights.h5")
