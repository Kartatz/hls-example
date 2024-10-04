#!/bin/bash

ffmpeg -y -f lavfi -i anullsrc -t 600 -q:a 9 audio.aac
ffmpeg -i audio.aac -c aac -start_number 0 -hls_time 10 -hls_list_size 0 -f hls audio.m3u8

ffmpeg -y -f lavfi -i color=c=white:s=880x480:d=600 -pix_fmt yuv420p video.mp4
ffmpeg -i video.mp4 -c copy -start_number 0 -hls_time 10 -hls_list_size 0 -f hls video.m3u8

unlink audio.aac
unlink video.mp4
