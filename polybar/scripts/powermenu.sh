#!/bin/sh

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

cd "$(dirname "$0")" || exit
SDIR="$(./sdir.sh)"
dir="$SDIR/rofi"
uptime="$(uptime -p | sed -e 's/up //g')"

rofi_command="rofi -theme $dir/powermenu.rasi"

# Options
shutdown="  Apagar"
reboot="  Reiniciar"
lock="  Bloquear"
suspend="  Hibernar"
logout="  Salir"
# Confirmation
confirm_choice() {
    ANSWER=$(rofi -dmenu\
        -i\
        -no-fixed-num-lines\
        -p "Estas seguro? : "\
        -theme "$dir/confirm.rasi" | tr '[:upper:]' '[:lower:]')
    if [ "$ANSWER" = "si" ] || [ "$ANSWER" = "s" ]; then
        return 0
    elif [ "$ANSWER" = "no" ] || [ "$ANSWER" = "n" ]; then
        return 1
    else
        msg
        confirm_choice
    fi
}

# Message
msg() {
    rofi -theme "$dir/message.rasi" -e "Opções disponíveis - si | s | no |n"
}

options() {
    cat << EOF
$lock
$suspend
$logout
$reboot
$shutdown
EOF
}

chosen="$(options | $rofi_command -p \
    "Uptime: $uptime" -dmenu -selected-row 0)"
case $chosen in
    "$shutdown")
        confirm_choice && {
            loginctl -i poweroff
        }
        ;;
    "$reboot")
        confirm_choice && {
            loginctl -i reboot
        }
        ;;
    "$lock")
        if command -v i3lock-fancy; then
            i3lock-fancy -p
        elif command -v slock; then
            slock
        elif command -v betterlockscreen; then
            betterlockscreen -l
        elif command -v i3lock; then
            i3lock
        fi
        ;;
    "$suspend")
        confirm_choice && {
                    mpc -q pause
                    amixer set Master mute
                    systemctl suspend
                }
            ;;
        "$logout")
            confirm_choice && {
                if [ "$DESKTOP_SESSION" = "Openbox" ]; then
                    openbox --exit
                elif [ "$DESKTOP_SESSION" = "bspwm" ]; then
                    bspc quit
                elif [ "$DESKTOP_SESSION" = "i3" ]; then
                    i3-msg exit
                fi
            }
        ;;
esac
