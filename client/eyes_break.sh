work_time=1800
warn_time=15
break_time=300

while sleep $work_time; do
    notify-send -t 2000 "break in $warn_time"; sleep $warn_time
    for i in `seq 1 $break_time`; do notify-send -t 1000 -u critical "$i/$break_time"; sleep 1; done
done
