run_conv_generator:
	python3 keras_conv_generator.py

run_mm_generator:
	python3 keras_mm_generator.py

run_exp_real:
	python3 keras_conv_generator.py --batch=2 --in_x=32 --in_y=32 --in_c=3 --filters=32 --kernel_x=3 --kernel_y=3 --strides=1 --padding=same --dilation_rate=1 --groups=1

copy_keras_to_hls4ml_prj:
	cp model.json ../hls4ml_wrapper/KERAS_conv2d_model.json
	cp model_weights.h5 ../hls4ml_wrapper/KERAS_conv2d_model_weights.h5

clean: 
	rm -fr model.h5 model.json model_weights.h5 __pycache__
