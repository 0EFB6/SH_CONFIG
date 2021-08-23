feh --bg-scale .wallpapers/1.png &
dwmblocks &
xrdb -merge ~/.Xresources &
fcitx-autostart &
virt &
imwheel &
nightshift -l 3.1412:101.68653 &
#nightshift &
#polybar linux &

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

exec dwm
