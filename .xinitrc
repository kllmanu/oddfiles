xinput --set-prop "AlpsPS/2 ALPS DualPoint Stick" "libinput Accel Speed" 1.0
# xautolock -locker "i3lock -c 333333" -killer "systemctl suspend" &
# xss-lock --transfer-sleep-lock -- i3lock -c 333333 --nofork &
setxkbmap -option ctrl:nocaps
xcape -e 'Control_L=Escape'
xsetroot -solid "#333333"
xrdb -merge .Xresources
xmodmap .Xmodmap
xset s 300

while true; do
	date=$(date +"%F %R")
	battery=$(cat /sys/class/power_supply/BAT0/capacity)
	xsetroot -name "BAT0 ${battery}% — $date"
	sleep 30s
done &

exec dwm
