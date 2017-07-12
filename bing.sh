#!/bin/bash
dates=`date +%Y-%m-%d`
if [[ -f $HOME/Pictures/Wallpapers/bing/$dates.jpg ]]; then
	echo "This image currently exist."
else
	curl "https://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1&mkt=en-US" > /tmp/bing.xml
	cat /tmp/bing.xml | grep -oP "<url>\/[a-zA-z]+.+<\/url>" | grep -oP "\/az+.[a-zA-z]+.+.jpg" > /tmp/esm.txt
	links="https://bing.com"`cat /tmp/esm.txt`
	wget $links -O $HOME/Pictures/Wallpapers/bing/$dates.jpg
	gsettings set org.gnome.desktop.background picture-uri file://$HOME/Pictures/Wallpapers/bing/$dates.jpg
fi