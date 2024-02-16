{pkgs, ...}: {
    environment.systemPackages = with pkgs; [
        godot_4
        blender
        krita
        lmms

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

        texstudio
        texlive.combined.scheme-full
        obsidian
    ];
}
