{pkgs, ...}: {
    environment.systemPackages = with pkgs; [
        godot_4
        blender
        krita
        lmms

        # Generic Programming
        vscode
        jetbrains.idea-community
        eclipses.eclipse-java
        logisim
        cmake
        fastfetch
        onefetch
        neovim
        tmux
        tmux-sessionizer
        wget
        git
        gh

        mysql-workbench

        # Notes and Math
        texstudio
        texlive.combined.scheme-full
        obsidian
    ];
}
