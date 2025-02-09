FILE="$HOME/.config/kdeglobals"
ICON_THEME="Win11-dark" // Set this to Win11-dark or We10X-black
REGULAR_WALLPAPER="/usr/share/wallpapers/ScarletTree/contents/images_dark/5120x2880.png"
// Change the regular wallpaper variable to the path of your image
UNDERCOVER_WALLPAPER="$HOME/windows11wallpaper.jpg"
// Windows 11 wallpaper image

if [ ! -f /var/tmp/kdeglobals ]; then
  echo "/var/tmp/kdeglobals not found"
  cp $FILE /var/tmp/

  sed -i "/^\[Icons\]/,/^\[/ s/^Theme=.*/Theme=$ICON_THEME/" "$FILE"
  plasma-apply-wallpaperimage $UNDERCOVER_WALLPAPER
else
  echo "/var/tmp/kdeglobals found"
  mv /var/tmp/kdeglobals $FILE
  plasma-apply-wallpaperimage $REGULAR_WALLPAPER
fi

kquitapp5 plasmashell && kstart5 plasmashell
