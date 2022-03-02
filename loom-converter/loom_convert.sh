#!/bin/bash

ffmpeg -i "$1" -af loudnorm=I=-16:LRA=11:TP=-1.5 -vc copy "${1%%.*}.mp4"
