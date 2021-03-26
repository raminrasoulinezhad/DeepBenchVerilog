
###################################################################################
#################################### Training #####################################
###################################################################################

###########################
#### MatMul ###############
###########################
python3 keras_mm_generator.py  --in_m=1760 --in_n=128   --in_k=1760
python3 keras_mm_generator.py  --in_m=7860 --in_n=64    --in_k=2560
python3 keras_mm_generator.py  --in_m=2560 --in_n=64    --in_k=2560
python3 keras_mm_generator.py  --in_m=5124 --in_n=9124  --in_k=2560
python3 keras_mm_generator.py  --in_m=3072 --in_n=128   --in_k=1024

###########################
#### RNNs #################
###########################
python3 keras_rnn_generator.py --batch=16  --timesteps=50   --hidden=1760 --keras_model='SimpleRNN'
python3 keras_rnn_generator.py --batch=32  --timesteps=50   --hidden=2560 --keras_model='SimpleRNN'
python3 keras_rnn_generator.py --batch=128 --timesteps=25   --hidden=1024 --keras_model='LSTM'
python3 keras_rnn_generator.py --batch=32  --timesteps=1500 --hidden=2816 --keras_model='GRU'

###########################
#### Conv #################
###########################
#python3 keras_conv_generator.py --batch=32 --in_x=161 --in_y=700 --in_c=1   --filters=32  --kernel_x=5 --kernel_y=20 --strides=2 --padding=valid --dilation_rate=1 --groups=1 
# in_y / 2
python3 keras_conv_generator.py --batch=32 --in_x=161 --in_y=350 --in_c=1   --filters=32  --kernel_x=5 --kernel_y=20 --strides=2 --padding=valid --dilation_rate=1 --groups=1 

# Done
#python3 keras_conv_generator.py --batch=8  --in_x=54  --in_y=54  --in_c=64  --filters=64  --kernel_x=3 --kernel_y=3  --strides=1 --padding=same  --dilation_rate=1 --groups=1 
# in_x / 2 , in_y / 2 , c_in / 4 , filters / 4
python3 keras_conv_generator.py --batch=8  --in_x=28  --in_y=28  --in_c=16  --filters=16  --kernel_x=3 --kernel_y=3  --strides=1 --padding=same  --dilation_rate=1 --groups=1 

# Done
# python3 keras_conv_generator.py --batch=16 --in_x=224 --in_y=224 --in_c=3   --filters=64  --kernel_x=3 --kernel_y=3  --strides=1 --padding=same  --dilation_rate=1 --groups=1
# in_x / 4 , in_y / 4 , filters / 4
python3 keras_conv_generator.py --batch=16 --in_x=56 --in_y=56 --in_c=3   --filters=16  --kernel_x=3 --kernel_y=3  --strides=1 --padding=same  --dilation_rate=1 --groups=1

# Done
#python3 keras_conv_generator.py --batch=16 --in_x=7   --in_y=7   --in_c=512 --filters=512 --kernel_x=3 --kernel_y=3  --strides=1 --padding=same  --dilation_rate=1 --groups=1
#filters / 32 , in_c / 32
python3 keras_conv_generator.py --batch=16 --in_x=7   --in_y=7   --in_c=16 --filters=16 --kernel_x=3 --kernel_y=3  --strides=1 --padding=same  --dilation_rate=1 --groups=1

# Done
#python3 keras_conv_generator.py --batch=16 --in_x=28  --in_y=28  --in_c=192 --filters=32  --kernel_x=5 --kernel_y=5  --strides=1 --padding=same  --dilation_rate=1 --groups=1
# c_in / 12 , filters / 4
python3 keras_conv_generator.py --batch=16 --in_x=28  --in_y=28  --in_c=16 --filters=8  --kernel_x=5 --kernel_y=5  --strides=1 --padding=same  --dilation_rate=1 --groups=1

###################################################################################
#################################### Inferecen ####################################
###################################################################################

###########################
#### MatMul ###############
###########################
python3 keras_mm_generator.py  --in_m=5124 --in_n=700   --in_k=2048
python3 keras_mm_generator.py  --in_m=35   --in_n=700   --in_k=2048
python3 keras_mm_generator.py  --in_m=3072 --in_n=3000  --in_k=1024
python3 keras_mm_generator.py  --in_m=512  --in_n=6000  --in_k=2816

###########################
#### RNNs #################
###########################
python3 keras_rnn_generator.py --batch=4 --timesteps=50   --hidden=1536 --keras_model='LSTM'
python3 keras_rnn_generator.py --batch=4 --timesteps=150  --hidden=256  --keras_model='LSTM'
python3 keras_rnn_generator.py --batch=1 --timesteps=1500 --hidden=2816 --keras_model='GRU'
python3 keras_rnn_generator.py --batch=2 --timesteps=375  --hidden=2560 --keras_model='GRU'

###########################
#### Conv #################
###########################
### Notworking at all !!!!! guess? the kernel is not symetric
#python3 keras_conv_generator.py --batch=4 --in_x=341 --in_y=79  --in_c=32  --filters=32   --kernel_x=5 --kernel_y=10 --strides=2 --padding=valid --dilation_rate=1 --groups=1
# in_x / 2 , in_y / 2 , in_c / 4 	
python3 keras_conv_generator.py --batch=4 --in_x=171 --in_y=40  --in_c=8  --filters=32   --kernel_x=5 --kernel_y=10 --strides=2 --padding=valid --dilation_rate=1 --groups=1

### Done 
#python3 keras_conv_generator.py --batch=1 --in_x=224 --in_y=224 --in_c=3   --filters=64   --kernel_x=7 --kernel_y=7  --strides=2 --padding=same  --dilation_rate=1 --groups=1
# in_x / 2 , in_y / 2 , filters / 4  --> Reuse = 1
python3 keras_conv_generator.py --batch=1 --in_x=112 --in_y=112 --in_c=3   --filters=16   --kernel_x=7 --kernel_y=7  --strides=2 --padding=same  --dilation_rate=1 --groups=1

### Done 
#python3 keras_conv_generator.py --batch=1 --in_x=56  --in_y=56  --in_c=256 --filters=128  --kernel_x=1 --kernel_y=1  --strides=2 --padding=valid --dilation_rate=1 --groups=1
# in_c / 16 , filters / 2  --> Reuse = 1
python3 keras_conv_generator.py --batch=1 --in_x=56  --in_y=56  --in_c=16 --filters=64  --kernel_x=1 --kernel_y=1  --strides=2 --padding=valid --dilation_rate=1 --groups=1

### Done
#python3 keras_conv_generator.py --batch=2 --in_x=7   --in_y=7   --in_c=512 --filters=2048 --kernel_x=1 --kernel_y=1  --strides=1 --padding=valid --dilation_rate=1 --groups=1
# in_c / 16 , filters / 16
python3 keras_conv_generator.py --batch=2 --in_x=7   --in_y=7   --in_c=32 --filters=128 --kernel_x=1 --kernel_y=1  --strides=1 --padding=valid --dilation_rate=1 --groups=1
