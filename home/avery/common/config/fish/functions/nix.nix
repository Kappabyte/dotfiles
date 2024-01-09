{ ... }: {
    programs.fish.functions = {
        "shell" = {
            body = ''
                set command "nix shell"
                for program in $argv
                    set command "$command nixpkgs#$program"
                end
                eval $command
            '';
        };
    };
}
