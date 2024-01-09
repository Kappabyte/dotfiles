{ config, lib, inputs, pkgs, user, home-manager, ... }: {
    xdg.userDirs = {
        enable = true;
        createDirectories = true;
        documents = "/home/avery/documents";
        download = "/home/avery/downloads";
        music = "/home/avery/music";
        pictures = "/home/avery/pictures";
        videos = "/home/avery/videos";
        desktop = "$HOME";
        publicShare = null;
        templates = null;
    };

    

    dconf.settings = {
        "org/cinnamon/desktop/applications/terminal" = {
            exec = "kitty";
        };
    };

    home.sessionVariables = {
        XDG_DATA_HOME = "$HOME/.local/share";
        XDG_CONFIG_HOME = "$HOME/.config";
        XDG_STATE_HOME = "$HOME/.local/state";
        XDG_CACHE_HOME = "$HOME/.cache";

        # android-studio
        ANDROID_HOME = "${config.home.sessionVariables.XDG_DATA_HOME}/android";
        # bash
        HISTFILE = "\"${config.home.sessionVariables.XDG_STATE_HOME}\"/bash/history";
        # cargo
        CARGO_HOME = "\"${config.home.sessionVariables.XDG_DATA_HOME}\"/cargo";
        # gnupg
        GNUPGHOME = "\"${config.home.sessionVariables.XDG_DATA_HOME}\"/gnupg";
        # gradle
        GRADLE_USER_HOME = "\"${config.home.sessionVariables.XDG_DATA_HOME}\"/gradle";
        # gtk-2
        GTK2_RC_FILES = lib.mkForce "\"${config.home.sessionVariables.XDG_CONFIG_HOME}\"/gtk-2.0/gtkrc";
        # nodejs
        NODE_REPL_HISTORY = "\"${config.home.sessionVariables.XDG_DATA_HOME}\"/node_repl_history";
        # openjdk
        _JAVA_OPTIONS = "-Djava.util.prefs.userRoot=\"${config.home.sessionVariables.XDG_CONFIG_HOME}\"/java";
        # rustup
        RUSTUP_HOME = "\"${config.home.sessionVariables.XDG_DATA_HOME}\"/rustup";
    };
}
