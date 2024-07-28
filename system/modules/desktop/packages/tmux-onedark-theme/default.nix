{fetchFromGitHub, pkgs}: {
    onedark-theme = pkgs.tmuxPlugins.mkTmuxPlugin {
        pluginName = "onedark-theme";
        rtpFilePath = "tmux-onedark-theme.tmux";
        version = "unstable-2020-06-07";
        
        src = fetchFromGitHub {
            owner = "Kappabyte";
            repo = "tmux-onedark-theme";
            rev = "d8f63084a4cac3a7b2fefdd17aa73e08491d254b";
            sha256 = "sha256-d8f63084a4cac3a7b2fefdd17aa73e08491d254b";
        };
    };
}
