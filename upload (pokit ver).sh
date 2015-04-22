#!/bin/bash
url=""
function uploadImage {
  url="$(curl -s -F "file=@$1" http://pokit.org/up2.php?user=pokit&pass=pokit)"
}

scrot -s "shot.png" 
uploadImage "shot.png"
echo $url | awk -F ".png" '{print "http://pokit.org/get/img/" $1 ".png" }' | xclip -selection c
rm "shot.png"
notify-send "Done"
sleep 0.2
killall notify-osd
