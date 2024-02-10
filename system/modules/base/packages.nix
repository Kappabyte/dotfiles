{pkgs, ...}: {
    environment.systemPackages = with pkgs; [
        acpi
        xdg-user-dirs
    ];
}
