

1- Creat a python3 virtual environment. Then install hls4ml and it's dependancies. Note `venv_addr` is the location of your virtual environment.

	virtualenv -p /usr/bin/python3 venv_addr
	source venv_addr/bin/activate
	pip install hls4ml
	pip install hls4ml[profiling]

There is an issue in the hls4ml library. To solve that we need to modify a file. Opne the following file:

	venv_addr/lib/python3.7/site-packages/hls4ml/converters/keras_to_hls.py

modify this:

	def __del__(self):
        if self.h5file:
            self.h5file.close()

to this:

	def __del__(self):
        if self.h5file:
            try:
                self.h5file.close()
            except ImportError:
                pass


2- To prevent re-downlowding the json and h5 files (which we will modify for different NN models): 

we replace using the `fetch_example_model` function from `venv_addr/lib/python3.7/site-packages/hls4ml/utils/example_models.py` by `fetch_example_model_flex` located at `my_utils.py`. 


