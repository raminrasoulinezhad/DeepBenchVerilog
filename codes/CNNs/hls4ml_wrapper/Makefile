run_cnn:
	python3 main.py --model_name="KERAS_conv2d_model.json" \
					--do_compilation=1 \
					--force_replace False \
					--Precision='ap_fixed<8,4>' \
					--ReuseFactor='1' \
					--fpga_part='xcku115-flvb2104-2-i' \
					--clock_period=5 \
					--io_type='io_stream'
run_mm:
	python3 main.py --model_name="KERAS_conv2d_model.json" \
					--do_compilation=True \
					--force_replace=False \
					--Precision='ap_fixed<8,4>' \
					--ReuseFactor='1' \
					--fpga_part='xcku115-flvb2104-2-i' \
					--clock_period=5 \
					--io_type='io_parallel'

clean_all: clean_prj clean_benchmarks
	
clean_prj:
	rm -rf my-hls-test.tar.gz my-hls-test __pycache__  .pytest_cache/ 

clean_benchmarks:
	rm -rf ./*.json ./*.h5 ./*.onnx ./*.pt ./*.pb
	