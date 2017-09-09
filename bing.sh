#!/bin/bash
case $1 in
	"us")
		dates=`date +%Y-%m-%d`
		function getpic() {
			curl "https://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1&mkt=en-US" > /tmp/bing.xml
			cat /tmp/bing.xml | grep -oP "<url>\/[a-zA-z]+.+<\/url>" | grep -oP "\/az+.[a-zA-z]+.+.jpg" > /tmp/esm.txt
			links="https://bing.com"`cat /tmp/esm.txt`
			wget $links -O $HOME/Pictures/Wallpapers/bing/us/$dates.jpg
			gsettings set org.gnome.desktop.background picture-uri file://$HOME/Pictures/Wallpapers/bing/us/$dates.jpg
		}
		if [[ -f $HOME/Pictures/Wallpapers/bing/us/$dates.jpg ]]; then
			echo "This image currently exist."
			echo "Do you want remove this picture? (y,n) "
			echo "**if enter (n) change background to this picture"
			read removethis
			if [[ $removethis == "y" ]]; then
				rm $HOME/Pictures/Wallpapers/bing/us/$dates.jpg
				getpic
			elif [[ $removethis == "n" ]]; then
				gsettings set org.gnome.desktop.background picture-uri file://$HOME/Pictures/Wallpapers/bing/us/$dates.jpg
			fi
		else
			getpic
		fi
	;;
	"ir")
		dates=`date +%Y-%m-%d`
		function getpic() {
			curl "https://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1&mkt=fa-IR" > /tmp/bing.xml
			cat /tmp/bing.xml | grep -oP "<url>\/[a-zA-z]+.+<\/url>" | grep -oP "\/az+.[a-zA-z]+.+.jpg" > /tmp/esm.txt
			links="https://bing.com"`cat /tmp/esm.txt`
			wget $links -O $HOME/Pictures/Wallpapers/bing/ir/$dates.jpg
			gsettings set org.gnome.desktop.background picture-uri file://$HOME/Pictures/Wallpapers/bing/ir/$dates.jpg
		}
		if [[ -f $HOME/Pictures/Wallpapers/bing/ir/$dates.jpg ]]; then
			echo "This image currently exist."
			echo "Do you want remove this picture? (y,n) "
			echo "**if enter (n) change background to this picture"
			read removethis
			if [[ $removethis == "y" ]]; then
				rm $HOME/Pictures/Wallpapers/bing/ir/$dates.jpg
				getpic
			elif [[ $removethis == "n" ]]; then
				gsettings set org.gnome.desktop.background picture-uri file://$HOME/Pictures/Wallpapers/bing/ir/$dates.jpg
			fi
		else
			getpic
		fi
	;;
	"gb")
		dates=`date +%Y-%m-%d`
		function getpic() {
			curl "https://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1&mkt=en-GB" > /tmp/bing.xml
			cat /tmp/bing.xml | grep -oP "<url>\/[a-zA-z]+.+<\/url>" | grep -oP "\/az+.[a-zA-z]+.+.jpg" > /tmp/esm.txt
			links="https://bing.com"`cat /tmp/esm.txt`
			wget $links -O $HOME/Pictures/Wallpapers/bing/gb/$dates.jpg
			gsettings set org.gnome.desktop.background picture-uri file://$HOME/Pictures/Wallpapers/bing/gb/$dates.jpg
		}
		if [[ -f $HOME/Pictures/Wallpapers/bing/gb/$dates.jpg ]]; then
			echo "This image currently exist."
			echo "Do you want remove this picture? (y,n) "
			echo "**if enter (n) change background to this picture"
			read removethis
			if [[ $removethis == "y" ]]; then
				rm $HOME/Pictures/Wallpapers/bing/gb/$dates.jpg
				getpic
			elif [[ $removethis == "n" ]]; then
				gsettings set org.gnome.desktop.background picture-uri file://$HOME/Pictures/Wallpapers/bing/gb/$dates.jpg
			fi
		else
			getpic
		fi
	;;
	*)
	echo "Error! Invalid Location."
	;;
esac