#!/bin/bash

# enironment


evaluate_one(){

	filename=$1

	echo '_______________'
	echo "___ $filename ___"

	echo
	echo 'retrained_graph.pb'
	python -m scripts.label_image \
	  --graph=tf_files/retrained_graph.pb  \
	  --image="test_images/$filename"

	echo
	echo 'optimized_graph.pb'
	python -m scripts.label_image \
	  --graph=tf_files/optimized_graph.pb  \
	  --image="test_images/$filename"

	echo
	echo 'rounded_graph.pb'
	python -m scripts.label_image \
	  --graph=tf_files/rounded_graph.pb  \
	  --image="test_images/$filename"
}


clear

for file in $(eval ls test_images)
do
	evaluate_one $file
done



