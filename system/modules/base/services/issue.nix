{ config, lib, pkgs, ... }: {
    ##### interface. here we define the options that users of our service can specify
    options = {
        # the options for our service will be located under services.foo
        services.issue = { 
            enable = lib.mkOption {
                type = lib.types.bool;
                default = false;
                description = ''
                Whether to enable the random /etc/issue generator
                '';
            };
            items = lib.mkOption {
                type = lib.types.listOf lib.types.str;
                default = ["default issue message"];
                description = ''
                The possible issue messages
                '';
            };
        };
    };

    ##### implementation
    config = lib.mkIf config.services.issue.enable { # only apply the following settings if enabled
        systemd.services.issue = {
            wantedBy = ["multi-user.target"];
            serviceConfig.WorkingDirectory = "";
            preStart= ''
                ${pkgs.coreutils}/bin/shuf -n 1 /etc/issues > /etc/issue
            '';
            serviceConfig.ExecStart = "${pkgs.coreutils}/bin/true";
        };
        environment.etc.issue.enable = false;
        environment.etc.issues.text = lib.concatStringsSep "\n" config.services.issue.items;
    };
}
