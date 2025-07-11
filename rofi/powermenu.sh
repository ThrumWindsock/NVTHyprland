#!/usr/bin/env sh
#
# A rofi powered menu to execute power related action.
# Uses: amixer mpc poweroff reboot rofi rofi-prompt

power_off=''
reboot=''
lock=''
suspend=''
log_out=''

chosen=$(printf '%s;%s;%s;%s;%s\n' "$power_off" "$reboot" "$lock" "$suspend" \
                                   "$log_out" \
    | rofi -theme-str '@import "power.rasi"' \
           -dmenu \
           -sep ';' \
           -selected-row 2)

case "$chosen" in
    "$power_off")
        shutdown now
        ;;

    "$reboot")
        reboot
        ;;

    "$lock")
        hyprlock
        ;;

    "$suspend")
        systemctl suspend
        ;;

    "$log_out")
        pkill -u $USER
        ;;

    *) exit 1 ;;
esac
