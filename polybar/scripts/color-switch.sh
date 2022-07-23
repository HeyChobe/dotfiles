#!/bin/sh
cd "$(dirname "$0")" || exit
SDIR="$(./sdir.sh)"

listOptions(){
cat << EOF
 ♥ amber|
 ♥ blue|
 ♥ blue-gray|
 ♥ brown|
 ♥ cyan|
 ♥ deep-orange|
 ♥ deep-purple|
 ♥ green|
 ♥ gray|
 ♥ indigo|
 ♥ blue-light|
 ♥ green-light|
 ♥ lime|
 ♥ orange|
 ♥ pink|
 ♥ purple|
 ♥ red|
 ♥ teal|
 ♥ yellow|
 ♥ amber-dark|
 ♥ blue-dark|
 ♥ blue-gray-dark|
 ♥ brown-dark|
 ♥ cyan-dark|
 ♥ deep-orange-dark|
 ♥ deep-purple-dark|
 ♥ green-dark|
 ♥ gray-dark|
 ♥ indigo-dark|
 ♥ blue-light-dark|
 ♥ green-light-dark|
 ♥ lime-dark|
 ♥ orange-dark|
 ♥ pink-dark|
 ♥ purple-dark|
 ♥ red-dark|
 ♥ teal-dark|
 ♥ yellow-dark|
EOF
}
OPTIONS="$(listOptions | tr -d '\n')"
MENU="$(printf '%s' "$OPTIONS" | \
    rofi -no-config -no-lazy-grab -sep "|" \
    -dmenu -i -p '' -theme "$SDIR/rofi/styles.rasi")"
    case "$MENU" in
        ## Light Colors
        *amber) "./colors-light.sh" --amber ;;
        *blue) "./colors-light.sh" --blue ;;
        *blue-gray) "./colors-light.sh" --blue-gray ;;
        *brown) "./colors-light.sh" --brown ;;
        *cyan) "./colors-light.sh" --cyan ;;
        *deep-orange) "./colors-light.sh" --deep-orange ;;
        *deep-purple) "./colors-light.sh" --deep-purple ;;
        *green) "./colors-light.sh" --green ;;
        *gray) "./colors-light.sh" --gray ;;
        *indigo) "./colors-light.sh" --indigo ;;
        *blue-light) "./colors-light.sh" --light-blue ;;
        *green-light) "./colors-light.sh" --light-green ;;
        *lime) "./colors-light.sh" --lime ;;
        *orange) "./colors-light.sh" --orange ;;
        *pink) "./colors-light.sh" --pink ;;
        *purple) "./colors-light.sh" --purple ;;
        *red) "./colors-light.sh" --red ;;
        *teal) "./colors-light.sh" --teal ;;
        *yellow) "./colors-light.sh" --yellow ;;
        ## Dark Colors
        *amber-dark) "./colors-dark.sh" --amber ;;
        *blue-dark) "./colors-dark.sh" --blue ;;
        *blue-gray-dark) "./colors-dark.sh" --blue-gray ;;
        *brown-dark) "./colors-dark.sh" --brown ;;
        *cyan-dark) "./colors-dark.sh" --cyan ;;
        *deep-orange-dark) "./colors-dark.sh" --deep-orange ;;
        *deep-purple-dark) "./colors-dark.sh" --deep-purple ;;
        *green-dark) "./colors-dark.sh" --green ;;
        *gray-dark) "./colors-dark.sh" --gray ;;
        *indigo-dark) "./colors-dark.sh" --indigo ;;
        *blue-light-dark) "./colors-dark.sh" --light-blue ;;
        *green-light-dark) "./colors-dark.sh" --light-green ;;
        *lime-dark) "./colors-dark.sh" --lime ;;
        *orange-dark) "./colors-dark.sh" --orange ;;
        *pink-dark) "./colors-dark.sh" --pink ;;
        *purple-dark) "./colors-dark.sh" --purple ;;
        *red-dark) "./colors-dark.sh" --red ;;
        *teal-dark) "./colors-dark.sh" --teal ;;
        *yellow-dark) "./colors-dark.sh" --yellow
    esac
