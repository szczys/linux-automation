#!/bin/bash

echo $(basename "$1")
ffmpeg -i "$1" -threads 0 -c:v libx264 -preset slow -crf 22 -c:a copy "output_$(basename $1)"
