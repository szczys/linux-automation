# Video Grabber

This program provides a simple webpage on the internal network. Any URL for video will be automatically downloaded to 

**Important**

* The location of videoqueue.txt must be specified in serverfiles/confirmurl.php so that webpage can write to file
* Location of python3 and of videograbber.py must be set in the crontab string
* Location of youtube-dl and destination of downloaded files must be set in videograbber.py

## Crontab entry example:
* * * * * /usr/bin/python3 /home/mike/compile/linux-automation/videograbber/videograbber.py > /tmp/ytdl.log 2>&1

