all: clean   run_hls4ml  run_vivado_hls

clean:
	rm -rf .tar.gz build_prj.tcl firmware keras_1layer_test.cpp keras_1layer_prj  vivado_hls.log cnn_test.cpp cnn_prj cnn_sample_test.cpp cnn_sample_prj

run_hls4ml:
	python3 ../../../RFNoC-HLS-NeuralNet/rfnoc/hls4ml/keras-to-hls/keras-to-hls.py -c  ./config.yml 
	#subl ./firmware/cnn_sample.cpp

run_vivado_hls:
	vivado_hls -f build_prj.tcl
	