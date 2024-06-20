{pkgs, lib, config}: {
    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
        extraCompatPackages = with pkgs; [
            proton-ge-bin
        ];
    };
    programs.gamescope = {
        enable = true;
    };
    environment.systemPackages = [
        (pkgs.callPackage ../packages/steam-gamescope {})
    ];
}
