FILE="$HOME/.config/kdeglobals"
ICON_THEME="We10X-black"

if [ ! -f /var/tmp/kdeglobals ]; then
  echo "/var/tmp/kdeglobals not found"
  cp $FILE /var/tmp/

  sed -i "/^\[Icons\]/,/^\[/ s/^Theme=.*/Theme=$ICON_THEME/" "$FILE"
else
  echo "/var/tmp/kdeglobals found"
  mv /var/tmp/kdeglobals $FILE
fi

kquitapp5 plasmashell && kstart5 plasmashell
