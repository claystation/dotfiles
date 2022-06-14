#!/usr/bin/env bash

# Options
shutdown=" Shutdown"
reboot=" Reboot"
lock=" Lock"
suspend=" Suspend"
logout=" Logout"

# Message
msg() {
	rofi -e "Available Options  -  yes / y / no / n"
}

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | rofi -dmenu -selected-row 2 -theme $HOME/.config/rofi/scripts/powermenu/theme.rasi -p "Action: ")"
case $chosen in
    $shutdown)
		systemctl poweroff
        ;;
    $reboot)
		systemctl reboot
        ;;
    $lock)
	    	betterlockscreen -l --display 1 -w
        ;;
    $suspend)
		mpc -q pause
	    amixer set Master mute
		systemctl suspend
        ;;
    $logout)
		i3-msg exit
        ;;
esac

