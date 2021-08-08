ffmpeg -f v4l2 -r 27 -s 640x480 -i /dev/video0 -filter:v "crop=445:415" -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video10
