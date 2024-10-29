import subprocess

queuefile = '/home/mike/compile/linux-automation/videograbber/videoqueue.txt'
outdir = '/Lenny/videoLibrary/Showings'

def popline():
    try:
        with open(queuefile, 'r') as f:
            videolinks = f.readlines()
        if len(videolinks) > 0:
            with open(queuefile, 'w') as f:
                f.writelines(videolinks[1:])
            return videolinks[0]
        else:
           return None
    except:
        return None

if __name__ == "__main__":
    videourl = popline()
    if videourl != None:
        cmd = f'cd {outdir} && /usr/bin/yt-dlp --embed-metadata --ffmpeg-location /home/mike/bin/ffmpeg --remux-video mp4 -S acodec:aac {videourl}'
        subprocess.run(cmd, shell=True)
