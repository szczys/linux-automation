import subprocess

queuefile = '/home/mike/compile/videograbber/videoqueue.txt'
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
        cmd = "cd " + outdir + " && /home/mike/.local/bin/youtube-dl " + videourl
        subprocess.run(cmd, shell=True)
