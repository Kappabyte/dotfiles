{ config, pkgs, ... }: {
    # System packages common to all machines
    environment.systemPackages = with pkgs; [
        
    ];
}
