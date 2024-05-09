{pkgs, ...}: {
    environment.systemPackages = with pkgs; [
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

        # Game Development
        godot_4
        blender

        mysql-workbench

        # Notes and Math
        texstudio
        texlive.combined.scheme-full
        obsidian
    ];
}
