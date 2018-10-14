#!/bin/bash

# enironment
IMAGE_SIZE=224
ARCHITECTURE="mobilenet_0.50_${IMAGE_SIZE}"

clear
echo 'Optimizing for inference'
python -m tensorflow.python.tools.optimize_for_inference \
  --input=tf_files/retrained_graph.pb \
  --output=tf_files/optimized_graph.pb \
  --input_names="input" \
  --output_names="final_result"

du -h tf_files/optimized_graph.pb


echo
echo 'quantize_graph'
python -m scripts.quantize_graph \
  --input=tf_files/optimized_graph.pb \
  --output=tf_files/rounded_graph.pb \
  --output_node_names=final_result \
  --mode=weights_rounded

echo
echo 'compressing'
gzip -c tf_files/rounded_graph.pb > tf_files/rounded_graph.pb.gz

gzip -l tf_files/rounded_graph.pb.gz

echo
echo 'pb files are:'
ls -la tf_files/*.pb*

echo
echo 'copying graph'
cp tf_files/rounded_graph.pb android/tfmobile/assets/graph.pb
echo 'copying labels'
cp tf_files/retrained_labels.txt android/tfmobile/assets/labels.txt 
ls -la android/tfmobile/assets/

echo 
echo 'testing the copied file with shoe.jpg'
python -m scripts.label_image \
  --graph=android/tfmobile/assets/graph.pb  \
  --image=test_images/shoe.jpg

echo
echo 'rebuild the android project'
