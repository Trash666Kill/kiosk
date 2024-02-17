# Screen settings
#xrandr -s 1440x900 &
#xrandr --output HDMI-1 --mode 1400x900
#xrandr --output DP-2 --rotate left &
#xrandr --output HDMI-1 --same-as HDMI-2 &
# Wallpaper
feh --bg-fill /usr/share/wallpapers/default.jpg &
unclutter &
# Always on
xset -dpms &
xset s off &
#
#
#sleep 30
#/usr/bin/google-chrome --kiosk --start-maximized "https://google.com" --no-default-browser-check --noerrdialogs --no-message-box --disable-desktop-notifications --allow-running-insecure-content --disk-cache-size=0 &
#
