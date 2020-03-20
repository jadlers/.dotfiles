# Bitday wallpaper

The script, `changebg`, changes the wallpaper of your desktop based on the time
of the day giving a wallpaper matching the time of day. It works on sway and
_should_ work on Xorg based display managers as well **if** `feh` is installed.

## Instructions

To get it working you need to download the set of images matching the resolution
of your display from [bitday](https://www.bitday.me/download/index.html).  Store
these images in a directory inside
_$HOME/.config/bitday-wallpaper/<WIDTHxHEIGHT>_. To update the background simply
run the program with the resolution of your choice.  For example: `./changebg
2560x1440`. `1920x1080` is the default value if no size is specified. Should the
directory with images not be found the program will exit with an error code and
message that the specified directory wasn't found.


## Systemd

You can use the included _bitday-wallpaper.service_ & _bitday-wallpaper.timer_
files for systemd in order to automatically run the script every hour. This
keeps the wallpaper in sync with the time of day. Update the size you want in
the _bitday-wallpaper.service_ file.
