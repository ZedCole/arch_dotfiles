#!/bin/bash

options="  Exit\n Suspend\n勒 Reboot\n  Shutdown"
sway_options=" Yes\n No"

selected=$(echo -e $options | wofi --location=3 --lines 4 --width 150 --xoffset 20 --show=dmenu --cache-file /dev/null | awk '{print tolower($2)}')

sway_function () {
        sway_close=$(echo -e $sway_options | wofi --location=3 --lines 2 --width 100 --xoffset 20 --show=dmenu --cache-file /dev/null | awk '{print tolower($2)}')

        case $sway_close in
                "yes")
                        exec swaymsg exit;;
                "no")
                        ;;
        esac
}

case $selected in
        "exit")
                sway_function;;
        "suspend")
                exec systemctl suspend;;
        "reboot")
                exec systemctl reboot;;
        "shutdown")
                exec systemctl poweroff -i;;
esac
