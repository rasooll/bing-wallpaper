#!/bin/bash

dates=`date +%Y-%m-%d`
function getpic() {
	mkdir -p $HOME/Pictures/Wallpapers/bing
	picture_path=$(wget -qO- "https://www.bing.com/HPImageArchive.aspx?n=1" | grep -oP "<url>\/[a-zA-z]+.+<\/url>" | sed 's/<url>//g' | sed 's/<\/url>//g')
	wget -q "https://bing.com$picture_path" -O $HOME/Pictures/Wallpapers/bing/$dates.jpg
	gsettings set org.gnome.desktop.background picture-uri file://$HOME/Pictures/Wallpapers/bing/$dates.jpg
	echo Done
}
if [[ -f $HOME/Pictures/Wallpapers/bing/$dates.jpg ]]; then
	echo "This image currently exist."
	echo "Do you want remove this picture? (y,n) "
	read removethis
	if [[ $removethis == "y" ]]; then
		rm $HOME/Pictures/Wallpapers/bing/$dates.jpg
		getpic
	fi
else
	getpic
fi