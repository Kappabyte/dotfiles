{pkgs, ...}: {
    programs.kdeconnect.enable = true;
    environment.systemPackages = with pkgs; [
        libsForQt5.kpeoplevcard
    ];
}
