#!/bin/bash

# enironment
IMAGE_SIZE=224
ARCHITECTURE="mobilenet_0.50_${IMAGE_SIZE}"



clear
echo '_________________________________________________________'
echo 'tensorboard started. logdir = tf_files/training_summaries'

#start tensorboard, kill previous if existing
# pkill -f "tensorboard"
tensorboard --logdir tf_files/training_summaries &
python -m scripts.name_scope

echo 'Retraining: image_dir = training_set, 4000 training steps'
echo '...'

python -m scripts.retrain \
  --bottleneck_dir=tf_files/bottlenecks \
  --how_many_training_steps=4000 \
  --model_dir=tf_files/models/ \
  --summaries_dir=tf_files/training_summaries/"${ARCHITECTURE}" \
  --output_graph=tf_files/retrained_graph.pb \
  --output_labels=tf_files/retrained_labels.txt \
  --architecture="${ARCHITECTURE}" \
  --image_dir=tf_files/training_set

clear

echo 'Training complete'
echo
echo '_____Labels______'
cat tf_files/retrained_labels.txt
echo
echo '_____tf_files____'
ls -la tf_files

