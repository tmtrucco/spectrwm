#!/bin/bash

volicon() {
	VOLONOFF="$(pulsemixer --get-mute)"

	VOLON="󰕾"
	VOLOFF="󰝟"
	if [ "$VOLONOFF" = "0" ]; then
		echo "$VOLON"
	else
		echo "$VOLOFF"
	fi
}

vol() {
	VOL="$(pulsemixer --get-volume | awk '{printf $1}')"

	echo "$VOL%"
}

networkicon() {
	wire="$(ip a | grep enp2s0 | grep inet | wc -l)"
	wifi="$(ip a | grep wlp1s0 | grep inet | wc -l)"

	if [ $wire = 1 ]; then
		echo "󰈀"
	elif [ $wifi = 1 ]; then
		echo "󰖩"
	else
		echo "󰖪"
	fi

}

# BATTERY
bat() {
	batstat="$(cat /sys/class/power_supply/BAT1/status)"
	battery="$(cat /sys/class/power_supply/BAT1/capacity)"
	if [ $batstat = 'Charging' ]; then
		batstat=""
	elif [[ $battery -ge 5 ]] && [[ $battery -le 19 ]]; then
		batstat=""
	elif [[ $battery -ge 20 ]] && [[ $battery -le 39 ]]; then
		batstat=""
	elif [[ $battery -ge 40 ]] && [[ $battery -le 59 ]]; then
		batstat=""
	elif [[ $battery -ge 60 ]] && [[ $battery -le 79 ]]; then
		batstat=""
	elif [[ $battery -ge 80 ]] && [[ $battery -le 95 ]]; then
		batstat=""
	elif [[ $battery -ge 96 ]] && [[ $battery -le 100 ]]; then
		batstat=""
	fi

	echo "$batstat  $battery%"
}

clockicon() {
	CLOCK=$(date '+%I')

	case "$CLOCK" in
		"00") icon="" ;;
		"01") icon="" ;;
		"02") icon="" ;;
		"03") icon="" ;;
		"04") icon="" ;;
		"05") icon="" ;;
		"06") icon="" ;;
		"07") icon="" ;;
		"08") icon="" ;;
		"09") icon="" ;;
		"10") icon="" ;;
		"11") icon="" ;;
		"12") icon="" ;;
	esac

	echo "$(date "+$icon")"
}

dateinfo() {
	echo "$(date "+%b %d %Y (%a)")"
}

clockinfo() {
	echo $(date "+%I:%M %p")
}

bluetooth() {
	if [ $(sudo sv status bluetoothd | awk '{printf $1}' | wc -c) -eq 5 ]; then
		echo "󰂲"
	else
		echo ""
	fi
}


SLEEP_SEC=60
while :; do
	echo "$(bluetooth) | $(networkicon) | $(bat) | $(volicon) $(vol) | $(clockinfo)"
	sleep $SLEEP_SEC
done
