#!/bin/bash
if [[ $(sudo sv status bluetoothd | awk '{printf $1}' | wc -c) -eq 5 ]]
then
	sudo sv up bluetoothd && bash ~/.config/spectrwm/refresh_bar.sh
else
	sudo sv down bluetoothd
	bash ~/.config/spectrwm/refresh_bar.sh
fi
