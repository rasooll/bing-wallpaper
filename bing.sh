#!/bin/bash
curl "https://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1&mkt=en-US" > /tmp/bing.xml
cat /tmp/bing.xml | grep -oP "<url>\/[a-zA-z]+.+<\/url>" | grep -oP "\/az+.[a-zA-z]+.+.jpg" > /tmp/esm.txt
links="https://bing.com"`cat /tmp/esm.txt`
dates=`date +%Y-%m-%d`
wget $links -O $HOME/Pictures/Wallpapers/bing/$dates.jpg
target=$HOME/Pictures/Wallpapers/bing/$dates.jpg
gsettings set org.gnome.desktop.background picture-uri file://$target
