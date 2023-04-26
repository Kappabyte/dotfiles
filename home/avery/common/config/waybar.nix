{ pkgs, system-settings, ... }: {
    programs.waybar = {
        enable = true;
        package = pkgs.waybar.overrideAttrs (oldAttrs: {
            mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
        });
        settings = {
            main = {
                name = "main";
                height = 30;
                spacing = 4;
                modules-left = system-settings.left;
                modules-center = system-settings.center;
                modules-right = system-settings.right;

                tray = {
                    spacing = 10;
                };
                clock = {
                    tooltip-format = "<big>{:%A, %B %e, %Y}</big>\n<tt><small>{calendar}</small></tt>";
                    format = "{:%I:%M %p}";
                    format-alt = "{:%m/%d/%Y}";
                };
                backlight = {
                    format = "{percent}% {icon}";
                    format-icons = ["" "" "" "" "" "" "" "" ""];
                };
                battery = {
                    states = {
                        warning = 30;
                        critical = 15;
                    };
                    format = "{capacity}% {icon}";
                    format-charging = "{capacity}% ";
                    format-plugged = "{capacity}% ";
                    format-alt = "{time} {icon}";
                    format-icons = ["" "" "" "" ""];
                };
                pulseaudio = {
                    format = "{volume}% {icon} {format_source}";
                    format-bluetooth = "{volume}% {icon} {format_source}";
                    format-bluetooth-muted = " {icon} {format_source}";
                    format-muted = " {format_source}";
                    format-source = "{volume}% ";
                    format-source-muted = "";
                    format-icons = {
                        headphone = "";
                        hands-free = "";
                        headset = "";
                        phone = "";
                        portable = "";
                        car = "";
                        default = ["" "" ""];
                    };
                    on-click = "pavucontrol";
                };
            };
            quote = {
                name = "quote";
                layer = "bottom";
                position = "bottom";
                exclusive = false;

                modules-left = [];
                modules-center = ["custom/splash"];
                modules-right = [];
                
                "custom/splash" = {
                    exec = "hyprctl splash";
                    interval = "once";
                    tooltip = false;
                };
            };
        };
        style = ''
        @define-color base   #1e1e2e;
        @define-color mantle #181825;
        @define-color crust  #11111b;

        @define-color text     #cdd6f4;
        @define-color subtext0 #a6adc8;
        @define-color subtext1 #bac2de;

        @define-color surface0 #313244;
        @define-color surface1 #45475a;
        @define-color surface2 #585b70;

        @define-color overlay0 #6c7086;
        @define-color overlay1 #7f849c;
        @define-color overlay2 #9399b2;

        @define-color blue      #89b4fa;
        @define-color lavender  #b4befe;
        @define-color sapphire  #74c7ec;
        @define-color sky       #89dceb;
        @define-color teal      #94e2d5;
        @define-color green     #a6e3a1;
        @define-color yellow    #f9e2af;
        @define-color peach     #fab387;
        @define-color maroon    #eba0ac;
        @define-color red       #f38ba8;
        @define-color mauve     #cba6f7;
        @define-color pink      #f5c2e7;
        @define-color flamingo  #f2cdcd;
        @define-color rosewater #f5e0dc;

        * {
            transition: none;
            box-shadow: none;
        }

        #waybar.main {
            color: @text;
            background: @base;
        }

        #waybar.quote {
            color: @text;
            background: transparent;
        }

        #workspaces {
            margin: 0 4px;
        }

        #workspaces button {
            margin: 4px 4px;
            padding: 0px 6px;
            color: @base;
            background: @teal;
        }

        #workspaces button.visible {
            border-radius: 4px;
            color: @base;
            background-color: @sapphire;
        }

        #workspaces button.active {
            border-radius: 4px;
            color: @base;
            background-color: @sapphire;
        }

        #workspaces button.urgent {
            color: rgba(238, 46, 36, 1);
        }

        #tray {
            margin: 4px 16px 4px 4px;
            border-radius: 4px;
            background-color: @mantle;
        }

        #tray * {
            padding: 0 6px;
            border-left: 1px solid @base;
        }

        #tray *:first-child {
            border-left: none;
        }

        #mode, #battery, #cpu, #memory, #network, #pulseaudio, #idle_inhibitor, #backlight, #custom-storage, #custom-spotify, #custom-weather, #custom-mail, #temperature {
            margin: 4px 2px;
            padding: 0 6px;
            background-color: @teal;
            color: @base;
            border-radius: 4px;
            min-width: 20px;
        }

        #clock {
            margin: 4px 2px;
            padding: 0 6px;
            color: @text;
            border-radius: 4px;
            min-width: 20px;
        }

        #pulseaudio.muted {
            color: @red;
        }

        #pulseaudio.bluetooth {
            color: @blue;
        }

        #clock {
            margin-left: 12px;
            margin-right: 4px;
            background-color: transparent;
        }
        '';
    };
}