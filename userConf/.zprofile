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
 gnome_schema="org.gnome.desktop.interface"
 gtk_theme="$(grep 'gtk-theme-name' "$config" | sed 's/.*\s*=\s*//')"
 icon_theme="$(grep 'gtk-icon-theme-name' "$config" | sed 's/.*\s*=\s*//')"
 cursor_theme="$(grep 'gtk-cursor-theme-name' "$config" | sed 's/.*\s*=\s*//')"
 font_name="$(grep 'gtk-font-name' "$config" | sed 's/.*\s*=\s*//')"
 gsettings set "$gnome_schema" gtk-theme "$gtk_theme"
 gsettings set "$gnome_schema" icon-theme "$icon_theme"
 gsettings set "$gnome_schema" cursor-theme "$cursor_theme"
 gsettings set "$gnome_schema" font-name "$font_name"
 dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
 exec sway
fi

[[ -f ~/.zshrc ]] && . ~/.zshrc
