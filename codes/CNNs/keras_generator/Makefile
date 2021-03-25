clean_all: clean_temps clean_model

clean_temps: 
	rm -fr __pycache__

clean_model: 
	rm -fr model.h5 model.json model_weights.h5 

run_conv_generator:
	python3 keras_conv_generator.py

run_mm_generator:
	python3 keras_mm_generator.py  --batch=2 --in_m=16 --in_k=16 --in_n=16
	make clean_temps
	make copy_keras_to_hls4ml_prj
	#python3 keras_mm_generator.py  --batch=12 --in_m=16 --in_k=32 --in_n=64

run_lstm_generator:
	python3 keras_rnn_generator.py --batch=128 --timesteps=25 --hidden=1024 --keras_model='LSTM'
	make clean_temps
	make copy_keras_to_hls4ml_prj

run_gru_generator:
	python3 keras_rnn_generator.py --batch=32 --timesteps=1500 --hidden=2816 --keras_model='GRU'
	make clean_temps
	make copy_keras_to_hls4ml_prj

run_rnns_generator:	
	python3 keras_rnn_generator.py --batch=16 --timesteps=50 --hidden=1760 --keras_model='SimpleRNN'
	make clean_temps
	make copy_keras_to_hls4ml_prj
	#python3 keras_rnn_generator.py --batch=32 --timesteps=50 --hidden=2560 --keras_model='SimpleRNN'

run_exp_real:
	python3 keras_conv_generator.py --batch=2 --in_x=32 --in_y=32 --in_c=3 --filters=32 --kernel_x=3 --kernel_y=3 --strides=1 --padding=same --dilation_rate=1 --groups=1

copy_keras_to_hls4ml_prj:
	cp model.json ../hls4ml_wrapper/KERAS_conv2d_model.json
	cp model_weights.h5 ../hls4ml_wrapper/KERAS_conv2d_model_weights.h5
