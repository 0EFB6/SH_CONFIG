feh --bg-scale .wallpapers/1.png &
dwmblocks &
xrdb -merge ~/.Xresources &
fcitx-autostart &
virt &
imwheel &
#polybar linux &

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

exec dwm
#exec startkde
