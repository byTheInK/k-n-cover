FILE="$HOME/.config/kdeglobals"
ICON_THEME="Win11-dark"
REGULAR_WALLPAPER="/usr/share/wallpapers/ScarletTree/contents/images_dark/5120x2880.png"
UNDERCOVER_WALLPAPER="$HOME/windows11wallpaper.jpg"
REGULAR_GTK_THEME="Breeze"
UNDERCOVER_GTK_THEME="Windows-10-3.2.1"

if [ ! -f /var/tmp/kdeglobals ]; then
  echo "/var/tmp/kdeglobals not found"
  cp $FILE /var/tmp/

  sed -i "/^\[Icons\]/,/^\[/ s/^Theme=.*/Theme=$ICON_THEME/" "$FILE"
  plasma-apply-wallpaperimage $UNDERCOVER_WALLPAPER
  dbus-send --session --dest=org.kde.GtkConfig --type=method_call /GtkConfig org.kde.GtkConfig.setGtkTheme "string:$UNDERCOVER_GTK_THEME"
else
  echo "/var/tmp/kdeglobals found"
  mv /var/tmp/kdeglobals $FILE
  plasma-apply-wallpaperimage $REGULAR_WALLPAPER
  dbus-send --session --dest=org.kde.GtkConfig --type=method_call /GtkConfig org.kde.GtkConfig.setGtkTheme "string:$REGULAR_GTK_THEME"
fi

kquitapp5 plasmashell && kstart5 plasmashell
