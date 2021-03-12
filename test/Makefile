run_main:
	python3 main.py

clean_all: clean_prj clean_benchmarks
	
clean_prj:
	rm -rf my-hls-test.tar.gz my-hls-test __pycache__  .pytest_cache/ 

clean_benchmarks:
	rm -rf ./*.json ./*.h5 ./*.onnx ./*.pt ./*.pb
	