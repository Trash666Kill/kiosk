# Screen settings
#xrandr -s 1440x900 &
#xrandr --output DP-2 --rotate left &
#xrandr --output HDMI-2 --same-as HDMI-1 &
# Wallpaper
feh --bg-fill /usr/share/wallpapers/default.jpg &
# Always on
xset -dpms &
xset s off &
#
#
sleep 30
/usr/bin/google-chrome --kiosk --start-maximized "https://google.com" --no-default-browser-check --noerrdialogs --no-message-box --disable-desktop-notifications --allow-running-insecure-content --disk-cache-size=0 &
#
