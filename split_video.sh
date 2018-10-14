#!/bin/bash


split_one(){
	

	filename=$1
	sourcedir=$2
	name=$(echo "$filename" | cut -f 1 -d '.')
	clear
	echo "___ $name ___"
	echo

	sourcefile="$sourcedir/${filename}"
	destination="tf_files/training_set/$name"
	mkdir $destination

	echo "Splitting $sourcefile into $destination directory"

	# ffmpeg -i $sourcefile -r 4 $destination/$name%05d.jpg
	echo
	count="ls $destination | wc -l"
	echo "$(eval $count) jpeg files added to $destination"
}


if [ -z "$1" ]
  then
  	RED=`tput setaf 1`
  	NC=`tput sgr0`
    echo "${RED} You need to supply the path to a directory. ${NC}Usage: ./split_video <directory>"
    exit
fi
dir=$1

for file in $(eval ls $dir/*.mp4)
do
	filename=$(basename $file)
	echo "$filename"
	split_one $filename $dir
done

echo
echo "$(eval ls -la tf_files/training_set | wc -l) directories in training_set"
echo
ls -la tf_files/training_set
echo
echo "___ done ___"
echo

