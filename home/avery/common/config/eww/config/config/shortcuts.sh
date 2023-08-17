shortcuts=("firefox", "nemo", "thunderbird", "steam", "env -u WAYLAND_DISPLAY cemu", "prismlauncher", "libreoffice", "webcord", "kitty")

bash -c "$(echo "${shortcuts[$1]}" | cut -d',' -f-1)"&
