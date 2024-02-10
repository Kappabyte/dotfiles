url=$(playerctl metadata mpris:artUrl | cut -c 8-)

if [[ -f $url ]]; then
    convert $url -filter Gaussian -blur 0x16 /tmp/art.jpg
    echo good
else
    echo bad
fi
