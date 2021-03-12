run:
	python3 main.py
	cp model.json ../test/KERAS_conv2d_model.json
	cp model_weights.h5 ../test/KERAS_conv2d_model_weights.h5
	cp model.onnx ../test/conv2d_small_mp_keras.onnx

clean: 
	rm -f model.h5 model.json model_weights.h5 model.onnx
