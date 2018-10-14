#!/bin/bash

# enironment


clear
echo '_______________'
echo '___ bag.jpg ___'

echo
echo 'retrained_graph.pb'
python -m scripts.label_image \
  --graph=tf_files/retrained_graph.pb  \
  --image=test_images/bag.jpg

echo
echo 'optimized_graph.pb'
python -m scripts.label_image \
  --graph=tf_files/optimized_graph.pb  \
  --image=test_images/bag.jpg

echo
echo 'rounded_graph.pb'
python -m scripts.label_image \
  --graph=tf_files/rounded_graph.pb  \
  --image=test_images/bag.jpg



echo '________________'
echo '___ shoe.jpg ___'

echo
echo 'retrained_graph.pb'
python -m scripts.label_image \
  --graph=tf_files/retrained_graph.pb  \
  --image=test_images/shoe.jpg

echo
echo 'optimized_graph.pb'
python -m scripts.label_image \
  --graph=tf_files/optimized_graph.pb  \
  --image=test_images/shoe.jpg

echo
echo 'rounded_graph.pb'
python -m scripts.label_image \
  --graph=tf_files/rounded_graph.pb  \
  --image=test_images/shoe.jpg

# echo
# echo 'evaluating'
# echo
# python -m scripts.evaluate  tf_files/retrained_graph.pb
# echo
# python -m scripts.evaluate  tf_files/optimized_graph.pb
# echo
# python -m scripts.evaluate  tf_files/rounded_graph.pb
