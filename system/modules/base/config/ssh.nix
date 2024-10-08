{ ... }: {
    programs.ssh.startAgent = true;
    services.openssh.enable = true;
    services.openssh.settings.PermitRootLogin = "yes";
}
