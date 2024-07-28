{pkgs, ...}: {
    environment.systemPackages = with pkgs; [
        xdg-ninja
        (callPackage ./packages/khinsider {}) 
        btop
        keepassxc
        unzip
        yt-dlp
        ffmpeg
    ];
}
