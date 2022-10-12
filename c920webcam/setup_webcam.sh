#!/bin/bash

/usr/bin/v4l2-ctl -d /dev/v4l/by-id/usb-046d_HD_Pro_Webcam_C920_83F655AF-video-index0 --set-ctrl=zoom_absolute=150
/usr/bin/v4l2-ctl -d /dev/v4l/by-id/usb-046d_HD_Pro_Webcam_C920_83F655AF-video-index0 --set-ctrl=exposure_auto=3
