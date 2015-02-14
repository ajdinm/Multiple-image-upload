#!/bin/bash

url=""
extension=""
fileToWrite="urls"

function setExtension {
        extension="$(echo $1 | awk -F '.' '{print "." $2}')"
}

function uploadImage {
  url="$(curl -s -F "file=@$1" http://pokit.org/up2.php?user=pokit&pass=pokit)"
  setExtension $1
}
uploadImage $1
imgUrl="$(echo $url | awk -F $extension '{ print "http://pokit.org/get/img/" $1 }')"
echo $imgUrl$extension | cat >> urls
