#!/bin/bash
rm -f paths

FILE=`zenity	--file-selection --multiple --title="Select a Images to upload"`

case $? in
         0)
                echo $FILE | awk 'BEGIN { RS = "|" } ; { system("bash uploadSingleImageAndWrite.sh " $0) }';;# | cat >> paths;;
         1)
                echo "No file selected.";;
        -1)
                echo "An unexpected error has occurred.";;
esac