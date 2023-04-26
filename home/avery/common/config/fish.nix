{ lib, inputs, pkgs, user, home-manager, ... }: {
    programs.fish = {
        enable = true;
        interactiveShellInit = ''
        function fish_greeting
            neofetch
        end
        function __fish_command_not_found_handler --on-event="fish_command_not_found"
            echo $argv[1]: command not found
        end
        '';
        plugins = [
            { name = "pure"; src = pkgs.fishPlugins.pure.src; }
            { name = "grc"; src = pkgs.fishPlugins.grc.src; }
        ];
    };
}