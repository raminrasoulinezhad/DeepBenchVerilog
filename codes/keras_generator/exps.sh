
###################
#### Training #####
###################

#python3 keras_conv_generator.py --batch=32 --in_x=161 --in_y=700 --in_c=1   --filters=32  --kernel_x=5 --kernel_y=20 --strides=2 --padding=valid --dilation_rate=1 --groups=1 
# in_y / 2
python3 keras_conv_generator.py --batch=32 --in_x=161 --in_y=350 --in_c=1   --filters=32  --kernel_x=5 --kernel_y=20 --strides=2 --padding=valid --dilation_rate=1 --groups=1 

#python3 keras_conv_generator.py --batch=8  --in_x=54  --in_y=54  --in_c=64  --filters=64  --kernel_x=3 --kernel_y=3  --strides=1 --padding=same  --dilation_rate=1 --groups=1 
# in_x / 2 , in_y / 2
python3 keras_conv_generator.py --batch=8  --in_x=28  --in_y=28  --in_c=64  --filters=64  --kernel_x=3 --kernel_y=3  --strides=1 --padding=same  --dilation_rate=1 --groups=1 

# python3 keras_conv_generator.py --batch=16 --in_x=224 --in_y=224 --in_c=3   --filters=64  --kernel_x=3 --kernel_y=3  --strides=1 --padding=same  --dilation_rate=1 --groups=1
# in_x / 4 , in_y / 4 , filters / 4
python3 keras_conv_generator.py --batch=16 --in_x=56 --in_y=56 --in_c=3   --filters=16  --kernel_x=3 --kernel_y=3  --strides=1 --padding=same  --dilation_rate=1 --groups=1

#python3 keras_conv_generator.py --batch=16 --in_x=7   --in_y=7   --in_c=512 --filters=512 --kernel_x=3 --kernel_y=3  --strides=1 --padding=same  --dilation_rate=1 --groups=1
#filters / 32 , in_c / 32
python3 keras_conv_generator.py --batch=16 --in_x=7   --in_y=7   --in_c=16 --filters=16 --kernel_x=3 --kernel_y=3  --strides=1 --padding=same  --dilation_rate=1 --groups=1

# Wait
#python3 keras_conv_generator.py --batch=16 --in_x=28  --in_y=28  --in_c=192 --filters=32  --kernel_x=5 --kernel_y=5  --strides=1 --padding=same  --dilation_rate=1 --groups=1
# c_in / 12 , filters / 4
python3 keras_conv_generator.py --batch=16 --in_x=28  --in_y=28  --in_c=16 --filters=8  --kernel_x=5 --kernel_y=5  --strides=1 --padding=same  --dilation_rate=1 --groups=1

###################
#### Inferecen ####
###################

### Notworking at all !!!!! guess? the kernel is not symetric
#python3 keras_conv_generator.py --batch=4 --in_x=341 --in_y=79  --in_c=32  --filters=32   --kernel_x=5 --kernel_y=10 --strides=2 --padding=valid --dilation_rate=1 --groups=1
# in_x / 2 , in_y / 2 , in_c / 4 	
python3 keras_conv_generator.py --batch=4 --in_x=171 --in_y=40  --in_c=8  --filters=32   --kernel_x=5 --kernel_y=10 --strides=2 --padding=valid --dilation_rate=1 --groups=1
# in_x / 2 , in_y / 2 , in_c / 4, zero expand the kernel to become symetric: 5,10 --> 10,10
python3 keras_conv_generator.py --batch=4 --in_x=171 --in_y=40  --in_c=8  --filters=32   --kernel_x=10 --kernel_y=10 --strides=2 --padding=valid --dilation_rate=1 --groups=1

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


# Inference 
# 	conv_b4_in_171_40_8_f_5_5_32_s_2_p_valid --> conv_b4_in_171_40_8_f_5_5_32_s_2_p_valid

# 	conv_b1_in_224_224_3_f_7_7_64_s_2_p_same --> conv_b1_in_112_112_3_f_7_7_16_s_2_p_same  
# 	conv_b1_in_56_56_256_f_1_1_128_s_2_p_valid --> conv_b1_in_56_56_16_f_1_1_64_s_2_p_valid  
# 	conv_b2_in_7_7_512_f_1_1_2048_s_1_p_valid  --> conv_b2_in_7_7_32_f_1_1_128_s_1_p_valid
