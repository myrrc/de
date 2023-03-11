while sleep 300; do
    cap=$(cat /sys/class/power_supply/BAT0/capacity)
    if [ $cap -le 10 ]; then notify-send "$cap < 11%" -t critical;
    elif [ $cap -le 25 ]; then notify-send "$cap < 26%"; fi
done
