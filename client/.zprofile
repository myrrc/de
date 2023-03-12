if [[ -z $DISPLAY && $TTY = /dev/tty1 ]]; then
    export QT_QPA_PLATFORM=wayland MOZ_ENABLE_WAYLAND=1 MOZ_WEBRENDER=1 XDG_SESSION_TYPE=wayland
    export XDG_CURRENT_DESKTOP=sway
    exec sway
fi


