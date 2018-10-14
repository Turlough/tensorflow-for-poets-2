#!/bin/bash


split_one(){
	

	filename=$1
	name=$(echo "$filename" | cut -f 1 -d '.')
	clear
	echo "___ $name ___"
	echo

	sourcefile="video/${filename}"
	destination="tf_files/training_set/$name"
	mkdir $destination

	echo "Splitting $sourcefile into $destination directory"

	ffmpeg -i $sourcefile -r 4 $destination/$name%05d.jpg
	echo
	count="ls $destination | wc -l"
	echo "$(eval $count) jpeg files added to $destination"
}

for file in $(eval ls video)
do
	split_one $file
done

echo
echo "$(eval ls -la tf_files/training_set | wc -l) directories in training_set"
echo
ls -la tf_files/training_set
echo
echo "___ done ___"
echo

