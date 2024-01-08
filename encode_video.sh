#!/bin/bash

ffmpeg -i "$1" -threads 0 -c:v libx264 -preset slow -crf 22 -c:a "encoded_$(basename $1)"
