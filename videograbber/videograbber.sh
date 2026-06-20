#!/usr/bin/bash

ytdl_binary="/usr/local/bin/yt-dlp"
ytdl_fifo="/Lenny/videoLibrary/ytdl_queue"
outdir="/Lenny/videoLibrary/Showings"

if [ ! -p "$ytdl_fifo" ]; then
  rm -rf $ytdl_fifo
  mkfifo --mode=0777 $ytdl_fifo
fi

while read line; do
  echo "Processing: ${line}" >> /tmp/ytdl.log

  if [[ "${line}" =~ .*\?list.* ]]; then
  #if [[ "${line}" =~ .* ]]; then
    echo "Warning: downloading lists is prohibited; stripping list member" >> /tmp/ytdl.log
    line=$(echo "${line}" | sed 's/\?list=.*//')
  fi
  ${ytdl_binary}                                  \
  --embed-metadata                                \
  --ffmpeg-location /usr/bin/ffmpeg               \
  -f bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4    \
  --paths ${outdir}                               \
  "${line}" >> /tmp/ytdl.log 2>&1
done <"$ytdl_fifo"
