#!/bin/bash
url=""
fileToWrite="urls"
function uploadImage {
  url="$(curl -s -F "file=@$1" http://pokit.org/up2.php?user=pokit&pass=pokit)"
}
uploadImage $1
echo $url | awk -F ".jpg" '{ print "http://pokit.org/get/img/" $1 ".jpg" }' | cat >> urls
