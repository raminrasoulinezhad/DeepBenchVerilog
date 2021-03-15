from urllib.request import urlretrieve
from hls4ml.utils.config import create_vivado_config
import pprint
import json
import yaml

from os.path import exists

from hls4ml.utils.example_models import _data_is_available,_config_is_available,_create_default_config

def _create_default_config_flex(	model_name, 
									model_config, 
									Precision='ap_fixed<16,6>', 
									ReuseFactor='1',
									fpga_part='xcku115-flvb2104-2-i',
									clock_period=5,
									io_type='io_parallel'):

    #Initiate the configuration file
    config = create_vivado_config(	fpga_part=fpga_part, 
    								clock_period=clock_period, 
    								io_type=io_type)

    #Additional configuration parameters
    config[model_config] = model_name
    config['HLSConfig']['Model'] = {}
    config['HLSConfig']['Model']['Precision'] = Precision
    config['HLSConfig']['Model']['ReuseFactor'] = ReuseFactor

    return config

def fetch_example_model_flex(	model_name, 
								force_replace=False,
								Precision='ap_fixed<16,8>', 
								ReuseFactor='16',
								fpga_part='xcku115-flvb2104-2-i',
								clock_period=5,
								io_type='io_parallel'
							):
	"""
	This function is a copy version of "fetch_example_model" from 

		venv/lib/python3.7/site-packages/hls4ml/utils/example_models.py
	
	Args:
		- model_name:   string, name of the example model in the repo. Example: fetch_example_model('KERAS_3layer.json')
	Return:
		- Dictionary that stores the configuration to the model
	"""

	#Initilize the download link and model type
	download_link = 'https://raw.githubusercontent.com/hls-fpga-machine-learning/example-models/master/'
	model_type = None
	model_config = None

	#Check for model's type to update link
	if '.json' in model_name:
		model_type = 'keras'
		model_config = 'KerasJson'
	elif '.pt' in model_name:
		model_type = 'pytorch'
		model_config = 'PytorchModel'
	elif '.onnx' in model_name:
		model_type = 'onnx'
		model_config ='OnnxModel'
	elif '.pb' in model_name:
		model_type = 'tensorflow'
		model_config = 'TensorFlowModel'
	else:
		raise TypeError('Model type is not supported in hls4ml.')
	

	download_link_model = download_link + model_type + '/' + model_name
	
	#Download the example model
	if (not exists(model_name)) or force_replace: 
		print("Downloading example model files ...")
		urlretrieve(download_link_model, model_name)

	#Check if the example data and configuration for the model are available
	if _data_is_available(model_name):
		_load_example_data(model_name)

	if _config_is_available(model_name):
		config = _load_example_config(model_name)
	else:
		config = _create_default_config_flex(	model_name, 
												model_config, 
												Precision=Precision,
												ReuseFactor=ReuseFactor,
												fpga_part=fpga_part,
												clock_period=clock_period,
												io_type=io_type
											)

	#If the model is a keras model then have to download its weight file as well
	if model_type == 'keras':
		model_weight_name = model_name[:-5] + "_weights.h5"

		if (not exists(model_weight_name)) or force_replace: 
			download_link_weight = download_link + model_type + '/' + model_weight_name
			urlretrieve(download_link_weight, model_weight_name)

		config['KerasH5'] =  model_weight_name #Set configuration for the weight file
	
	return config
