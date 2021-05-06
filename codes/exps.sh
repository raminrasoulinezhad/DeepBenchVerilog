
keras_models_dir=./hls4ml_rnn_repo_chaitanyaPaikara/example-models/keras/
generator_dir=CNNs/keras_generator/
generator_venv_dir=../venv_2_1_3/

virtualenv -p /usr/bin/python3.6 $generator_venv_dir
source $generator_venv_dir/bin/activate
pip install keras==2.1.3 tensorflow-gpu==1.15

python3 $generator_dir/keras_rnn_generator.py --batch=4 --timesteps=50   --hidden=1536 --rnn_model='LSTM' --keras_2_1_3  --model_name=DB_0_inference_model  --output_dir=$keras_models_dir
python3 $generator_dir/keras_rnn_generator.py --batch=4 --timesteps=150  --hidden=256  --rnn_model='LSTM' --keras_2_1_3  --model_name=DB_1_inference_model  --output_dir=$keras_models_dir
python3 $generator_dir/keras_rnn_generator.py --batch=1 --timesteps=1500 --hidden=2816 --rnn_model='GRU'  --keras_2_1_3  --model_name=DB_2_inference_model  --output_dir=$keras_models_dir
python3 $generator_dir/keras_rnn_generator.py --batch=2 --timesteps=375  --hidden=2560 --rnn_model='GRU'  --keras_2_1_3  --model_name=DB_3_inference_model  --output_dir=$keras_models_dir

deactivate 


cd ./hls4ml_rnn_repo_chaitanyaPaikara/test/

source ../venv/bin/activate

./keras-to-hls.sh -x 'xcvu13p-fsga2577-2-i' -c 5 -s  -r  256 -d ./projects  -t 'ap_fixed<8,4>' -g Resource  DB_0_inference_model
./keras-to-hls.sh -x 'xcvu13p-fsga2577-2-i' -c 5 -s  -r  256 -d ./projects  -t 'ap_fixed<8,4>' -g Resource  DB_1_inference_model
./keras-to-hls.sh -x 'xcvu13p-fsga2577-2-i' -c 5 -s  -r  256 -d ./projects  -t 'ap_fixed<8,4>' -g Resource  DB_2_inference_model
./keras-to-hls.sh -x 'xcvu13p-fsga2577-2-i' -c 5 -s  -r  256 -d ./projects  -t 'ap_fixed<8,4>' -g Resource  DB_3_inference_model

deactivate

tar -zxvf projects/DB_0_inference_model*.tar.gz
tar -zxvf projects/DB_1_inference_model*.tar.gz
tar -zxvf projects/DB_2_inference_model*.tar.gz
tar -zxvf projects/DB_3_inference_model*.tar.gz

source /opt/Xilinx/Vivado/2019.2/settings64.sh

cd ./projects/DB_0_inference_model*/  &&  vivado_hls -f build_prj.tcl & 
cd ./projects/DB_1_inference_model*/  &&  vivado_hls -f build_prj.tcl & 
cd ./projects/DB_2_inference_model*/  &&  vivado_hls -f build_prj.tcl & 
cd ./projects/DB_3_inference_model*/  &&  vivado_hls -f build_prj.tcl & 

wait

mkdir verilogs
cp -r ./projects/DB_0_inference_model*/myproject_prj/solution1/syn/verilog/  verilogs/DB_0_inference_model
cp -r ./projects/DB_1_inference_model*/myproject_prj/solution1/syn/verilog/  verilogs/DB_1_inference_model
cp -r ./projects/DB_2_inference_model*/myproject_prj/solution1/syn/verilog/  verilogs/DB_2_inference_model
cp -r ./projects/DB_3_inference_model*/myproject_prj/solution1/syn/verilog/  verilogs/DB_3_inference_model

# training
#python3 keras_rnn_generator.py --batch=16  --timesteps=50   --hidden=1760 --keras_model='SimpleRNN'
#python3 keras_rnn_generator.py --batch=32  --timesteps=50   --hidden=2560 --keras_model='SimpleRNN'
#python3 keras_rnn_generator.py --batch=128 --timesteps=25   --hidden=1024 --keras_model='LSTM'
#python3 keras_rnn_generator.py --batch=32  --timesteps=1500 --hidden=2816 --keras_model='GRU'
# inference
#python3 keras_rnn_generator.py --batch=4 --timesteps=50   --hidden=1536 --keras_model='LSTM'
#python3 keras_rnn_generator.py --batch=4 --timesteps=150  --hidden=256  --keras_model='LSTM' 
#python3 keras_rnn_generator.py --batch=1 --timesteps=1500 --hidden=2816 --keras_model='GRU'
#python3 keras_rnn_generator.py --batch=2 --timesteps=375  --hidden=2560 --keras_model='GRU'
