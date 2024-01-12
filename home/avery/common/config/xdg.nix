{ config, lib, inputs, pkgs, user, home-manager, ... }: {
    xdg = {
        enable = true;
        userDirs = {
            enable = true;
            createDirectories = true;
            documents = "/home/avery/documents";
            download = "/home/avery/downloads";
            music = "/home/avery/music";
            pictures = "/home/avery/pictures";
            videos = "/home/avery/videos";
            desktop = "$HOME";
            publicShare = "/home/avery/games";
            templates = "/home/avery/code";
        };
        dataHome = "${config.home.homeDirectory}/.local/share";
        configHome = "${config.home.homeDirectory}/.config";
        stateHome = "${config.home.homeDirectory}/.local/state";
        cacheHome = "${config.home.homeDirectory}/.cache";
    };

    

    dconf.settings = {
        "org/cinnamon/desktop/applications/terminal" = {
            exec = "kitty";
        };
    };

    home.sessionVariables = {
        # android-studio
        ANDROID_HOME = "${config.xdg.dataHome}/android";
        # bash
        HISTFILE = "\"${config.xdg.stateHome}\"/bash/history";
        # npm
        NPM_CONFIG_USERCONFIG = "\"${config.xdg.configHome}\"/npm/npmrc";
        # cargo
        CARGO_HOME = "\"${config.xdg.dataHome}\"/cargo";
        # gnupg
        GNUPGHOME = "\"${config.xdg.dataHome}\"/gnupg";
        # gradle
        GRADLE_USER_HOME = "\"${config.xdg.dataHome}\"/gradle";
        # gtk-2
        GTK2_RC_FILES = lib.mkForce "\"${config.xdg.configHome}\"/gtk-2.0/gtkrc";
        # nodejs
        NODE_REPL_HISTORY = "\"${config.xdg.dataHome}\"/node_repl_history";
        # openjdk
        _JAVA_OPTIONS = "-Djava.util.prefs.userRoot=\"${config.xdg.configHome}\"/java";
        # rustup
        RUSTUP_HOME = "\"${config.xdg.dataHome}\"/rustup";
    };
}
