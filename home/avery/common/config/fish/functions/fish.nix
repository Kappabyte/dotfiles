{ ... }: {
    programs.fish.functions = {
        "fish_greeting" = {
            body = ''
                set result (onefetch &| grep "Error: Could not find any source code in this repository") &>/dev/null

                command clear

                if test -z "$result"; and git rev-parse --git-dir > /dev/null 2>&1;
                    onefetch
                else
                    neofetch
                end
            '';
        };

        "fish_prompt" = {
            body = ''
                set -U COLOR_RESET "\033[0m"

                set -U COLOR_K "\033[0;30m"    # black
                set -U COLOR_R "\033[0;31m"    # red
                set -U COLOR_G "\033[0;32m"    # green
                set -U COLOR_Y "\033[0;33m"    # yellow
                set -U COLOR_B "\033[0;34m"    # blue
                set -U COLOR_M "\033[0;35m"    # magenta
                set -U COLOR_C "\033[0;36m"    # cyan
                set -U COLOR_W "\033[0;37m"    # white

                set -U EM_K "\033[1;30m"
                set -U EM_R "\033[1;31m"
                set -U EM_G "\033[1;32m"
                set -U EM_Y "\033[1;33m"
                set -U EM_B "\033[1;34m"
                set -U EM_M "\033[1;35m"
                set -U EM_C "\033[1;36m"
                set -U EM_W "\033[1;37m"

                if git rev-parse --git-dir > /dev/null 2>&1
                    set relpath (realpath --relative-to="$(git rev-parse --git-dir)/.." .)
                    set relfolder (basename $relpath)
                    set sep "/"
                    set sep2 " "
                    if [ "$relpath" = "." ]
                        set relpath ""
                        set sep2 ""
                        set sep ""
                    end

                    set relpath (dirname $relpath)

                    if [ "$relpath" = "." ]
                        set relpath ""
                        set sep ""
                    end

                    if [ "$relfolder" = "." ]
                        set relfolder ""
                    end

                    set prompt_path " $EM_B$(basename (git rev-parse --show-toplevel))$sep2$COLOR_RESET$relpath$sep$COLOR_Y$relfolder $COLOR_W($(git rev-parse --abbrev-ref HEAD))"
                else
                    set relpath (prompt_pwd --dir-length=0)
                    set sep ""
                    set relfolder ""
                    if [ "$relpath" != "~" ]
                        set relfolder (basename $relpath)
                        set relpath (dirname $relpath)
                        set sep "/"
                    end

                    if [ "$relpath" = "/" ]
                        if [ "$relfolder" = "/" ]
                            set relfolder ""
                        end
                        set sep ""
                    end

                    set prompt_path "$relpath$sep$COLOR_Y$relfolder$COLOR_RESET"
                end

                if test -z $TMUX_SHLVL
                    set nixShell ""
                else if test $SHLVL -gt $TMUX_SHLVL
                    set nixShell "$(echo $EM_G)󱄅 $COLOR_RESET"
                else
                    set nixShell ""
                end
                    

                printf "\n$nixShell$prompt_path\n"

                printf "$COLOR_W$(whoami)> "
            '';
        };

        "__fish_command_not_found_handler" = {
            body = ''
                echo $argv[1]: command not found
            '';
            onEvent = "fish_command_not_found";
        };
    };
}
