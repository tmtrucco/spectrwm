#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -theme ~/.config/rofi/powermenu.rasi"
# Options
shutdown=" Shutdown"
reboot=" Restart"
logout=" Logout"

# Confirmation
confirm_exit() {
	rofi -dmenu\
		-no-config\
		-i\
		-no-fixed-num-lines\
		-p "Are You Sure? : "\
		-theme $dir/confirm.rasi
	}

# Message
msg() {
	rofi -no-config -theme "$dir/message.rasi" -e "Available Options  -  yes / y / no / n"
}

# Variable passed to rofi
options="$shutdown\n$reboot\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 0)"
case $chosen in
	$shutdown)
		sudo poweroff
		;;
	$reboot)
		sudo reboot
		;;
	$logout)
		bspc quit
		;;
esac
