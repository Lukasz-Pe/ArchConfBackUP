#LukaszPe
if test -f .tty
 then
 break
fi

export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland
#export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORMTHEME=gtk2
#export QT_QPA_PLATFORMTHEME=gnome
export XDG_CURRENT_DESKTOP=Unity
#export XDG_CURRENT_DESKTOP=Gnome
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
 config="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0/settings.ini"
 if [ ! -f "$config" ]; then exit 1; fi
 export GNOME_SCHEMA="org.gnome.desktop.interface"
 export GTK_THEME="$(grep 'gtk-theme-name' "$config" | sed 's/.*\s*=\s*//')"
 export ICON_THEME="$(grep 'gtk-icon-theme-name' "$config" | sed 's/.*\s*=\s*//')"
 export CURSOR_THEME="$(grep 'gtk-cursor-theme-name' "$config" | sed 's/.*\s*=\s*//')"
 export FONT_NAME="$(grep 'gtk-font-name' "$config" | sed 's/.*\s*=\s*//')"
 gsettings set "$GNOME_SCHEMA" gtk-theme "$GTK_THEME"
 gsettings set "$GNOME_SCHEMA" icon-theme "$ICON_THEME"
 gsettings set "$GNOME_SCHEMA" cursor-theme "$CURSOR_THEME"
 gsettings set "$GNOME_SCHEMA" font-name "$FONT_NAME"
 dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
 exec sway
fi

[[ -f ~/.zshrc ]] && . ~/.zshrc

# Created by `pipx` on 2024-03-06 18:35:54
export PATH="$PATH:/home/lukaszpe/.local/bin"

#echo "Start" | lolcat

#lol()
#{
#    if [ -t 1 ]; then
#        "$@" | lolcat
#    else
#        "$@"
#    fi
#}
#bind 'RETURN: "\e[1~lol \e[4~\n"'
#export -f lol
