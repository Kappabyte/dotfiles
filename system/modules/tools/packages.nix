{pkgs, ...}: {
    environment.systemPackages = with pkgs; [
        xdg-ninja
        (pkgs.callPackage ./packages/khinsider {}) 
        btop
        keepassxc
        unzip
        yt-dlp
        ffmpeg
    ];
}
