
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
# in_x / 2 , in_y / 2
python3 keras_conv_generator.py --batch=16 --in_x=112 --in_y=112 --in_c=3   --filters=64  --kernel_x=3 --kernel_y=3  --strides=1 --padding=same  --dilation_rate=1 --groups=1

#python3 keras_conv_generator.py --batch=16 --in_x=7   --in_y=7   --in_c=512 --filters=512 --kernel_x=3 --kernel_y=3  --strides=1 --padding=same  --dilation_rate=1 --groups=1
#filters / 8 , in_c / 8
python3 keras_conv_generator.py --batch=16 --in_x=7   --in_y=7   --in_c=64 --filters=64 --kernel_x=3 --kernel_y=3  --strides=1 --padding=same  --dilation_rate=1 --groups=1

#python3 keras_conv_generator.py --batch=16 --in_x=28  --in_y=28  --in_c=192 --filters=32  --kernel_x=5 --kernel_y=5  --strides=1 --padding=same  --dilation_rate=1 --groups=1
# c_in / 2 , filters / 2
python3 keras_conv_generator.py --batch=16 --in_x=28  --in_y=28  --in_c=192 --filters=16  --kernel_x=5 --kernel_y=5  --strides=1 --padding=same  --dilation_rate=1 --groups=1

###################
#### Inferecen ####
###################

#python3 keras_conv_generator.py --batch=4 --in_x=341 --in_y=79  --in_c=32  --filters=32   --kernel_x=5 --kernel_y=10 --strides=2 --padding=valid --dilation_rate=1 --groups=1
# in_x / 2 , in_y / 2 , in_c / 4 
python3 keras_conv_generator.py --batch=4 --in_x=171 --in_y=40  --in_c=8  --filters=32   --kernel_x=5 --kernel_y=10 --strides=2 --padding=valid --dilation_rate=1 --groups=1

#python3 keras_conv_generator.py --batch=1 --in_x=224 --in_y=224 --in_c=3   --filters=64   --kernel_x=7 --kernel_y=7  --strides=2 --padding=same  --dilation_rate=1 --groups=1
# in_x / 2 , in_y / 2
python3 keras_conv_generator.py --batch=1 --in_x=112 --in_y=112 --in_c=3   --filters=64   --kernel_x=7 --kernel_y=7  --strides=2 --padding=same  --dilation_rate=1 --groups=1

#python3 keras_conv_generator.py --batch=1 --in_x=56  --in_y=56  --in_c=256 --filters=128  --kernel_x=1 --kernel_y=1  --strides=2 --padding=valid --dilation_rate=1 --groups=1
# in_c / 16 
python3 keras_conv_generator.py --batch=1 --in_x=56  --in_y=56  --in_c=16 --filters=128  --kernel_x=1 --kernel_y=1  --strides=2 --padding=valid --dilation_rate=1 --groups=1

#python3 keras_conv_generator.py --batch=2 --in_x=7   --in_y=7   --in_c=512 --filters=2048 --kernel_x=1 --kernel_y=1  --strides=1 --padding=valid --dilation_rate=1 --groups=1
# filters / 2
python3 keras_conv_generator.py --batch=2 --in_x=7   --in_y=7   --in_c=512 --filters=1024 --kernel_x=1 --kernel_y=1  --strides=1 --padding=valid --dilation_rate=1 --groups=1
