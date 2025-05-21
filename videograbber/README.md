# Video Grabber

This program provides a simple webpage on the internal network. Any URL for video will be automatically downloaded to 

## Prerequisites

- Setup LAMP (assume /srv/http/ for served files)
- Install `yt-dlp`
- Set the location of the binary, and chose the output directory in `videograbber.sh`
- The linux fifo used must match in `videograbber.sh` and `serverfiles/confirmurl.php`

## Installation

```
sudo ln -s $(pwd)/videograbber.sh /usr/bin/.
sudo cp videograbber.service /etc/systemd/system/.
sudo systemctl enable videograbber
sudo systemctl start videograbber
sudo systemctl status videograbber
sudo ln -s $(pwd)/ytdl.html /srv/http/.
sudo ln -s $(pwd)/confirmurl.php /srv/http/.
sudo ln -s $(pwd)/icons8-krusty-the-clown-doodle-120.png /srv/http/.
```

## Usage

1. Load `http:/servername/ytdl.html`
2. Paste link to desired video
