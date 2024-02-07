{pkgs, ...}: {
    environment.systemPackages = with pkgs; [
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
