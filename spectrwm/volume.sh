#!/bin/bash

volumecontrol() {
	case $1 in
		raise)
			pulsemixer --change-volume +10 && bash /home/tomi/.config/spectrwm/refresh_bar.sh
			;;
		lower)
			pulsemixer --change-volume -10 && bash /home/tomi/.config/spectrwm/refresh_bar.sh
			;;
		togglemute)
			pulsemixer --toggle-mute && bash /home/tomi/.config/spectrwm/refresh_bar.sh
			;;
		*)
			;;
	esac;
}

volumecontrol $1

