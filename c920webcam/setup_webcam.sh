#!/bin/bash

/usr/bin/v4l2-ctl -d /dev/video0 --set-ctrl=zoom_absolute=150
/usr/bin/v4l2-ctl -d /dev/video0 --set-ctrl=exposure_auto=3
