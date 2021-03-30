#python3 keras_rnn_generator.py --batch=16  --timesteps=50   --hidden=1760 --keras_model='SimpleRNN'
#python3 keras_rnn_generator.py --batch=32  --timesteps=50   --hidden=2560 --keras_model='SimpleRNN'
#python3 keras_rnn_generator.py --batch=128 --timesteps=25   --hidden=1024 --keras_model='LSTM'
#python3 keras_rnn_generator.py --batch=32  --timesteps=1500 --hidden=2816 --keras_model='GRU'
#
#python3 keras_rnn_generator.py --batch=4 --timesteps=50   --hidden=1536 --keras_model='LSTM'
#python3 keras_rnn_generator.py --batch=4 --timesteps=150  --hidden=256  --keras_model='LSTM' 
#python3 keras_rnn_generator.py --batch=1 --timesteps=1500 --hidden=2816 --keras_model='GRU'
#python3 keras_rnn_generator.py --batch=2 --timesteps=375  --hidden=2560 --keras_model='GRU'

source ~/anaconda3/etc/profile.d/conda.sh



source ../venv_new/bin/activate

cd CNNs/keras_generator/

python3 keras_rnn_generator.py --batch=1 --timesteps=25   --hidden=64 --keras_model='GRU'
deactivate 

cp model.json			../../hls4ml_rnn_repo/example-models/keras/rnn_model.json
cp model_weights.h5		../../hls4ml_rnn_repo/example-models/keras/rnn_model_weights.h5
cd ../../hls4ml_rnn_repo/test/

conda activate hls4ml-env
./keras-to-hls.sh -d ./projects -t 'ap_fixed<8,4>' -io io_serial -m 25 rnn_model 
conda deactivate

cd ./projects/rnn_model*/

vivado_hls -f build_prj.tcl
