sudo modprobe v4l2loopback devices=2 video_nr=10,6 card_label="Skool,Camera" exclusive_caps=1

echo options v4l2loopback devices=2 video_nr=10,6 card_label="Skool,Camera" exclusive_caps=1 > /etc.modprobe.d/v4l2loopback.conf


#Install on Arch Linux

# sudo pacman -S dkms linux-headers
# yay v4l2loopback-dkms obs-v4l2sink-git


#sudo modprobe v4l2loopback card_label='V4L2 Loopback' video_nr=7 exclusive_caps=1
