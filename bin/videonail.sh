#!/usr/bin/bash

VideoInfo=`ffprobe -v quiet -select_streams v -show_entries stream=duration xjqxzqz_x1.mov`
duration=`echo $VideoInfo | awk -F'[= .]' '{print $3}'`
echo $duration

NUM=6
NUM2=$((NUM+1))
timescape=$((duration / NUM2))
echo $timescape
time=0
for ((i = 0; i < NUM; i++))
do
	time=$((time + timescape))
	ffmpeg -v quiet -i $1 -ss $time -vframes 1 -y $i.gif
done

convert \( 0.gif 1.gif +append \) \
		\( 2.gif 3.gif +append \) \
		\( 4.gif 5.gif +append \) \
		-background none -append append_array.gif
