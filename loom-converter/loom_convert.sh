#!/bin/bash

ffmpeg -i "$1" -af loudnorm=I=-16:LRA=11:TP=-1.5 -c:v copy "${1%%.*}.mp4"
