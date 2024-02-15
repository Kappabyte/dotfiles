{lib, pkgs, config}: {
    programs.fish.enable = true;
    
    users.defaultUserShell = pkgs.fish;

    environment.systemPackages = with pkgs; [
        grc
    ];
}
