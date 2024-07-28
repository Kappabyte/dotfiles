{ config, ... }: {
    programs.matugen = {
        enable = true;
        variant = "dark";
        jsonFormat = "hex";
        palette = "default";

        templates = {
            gtk = {
                input_path = "./templates/gtk.css";
                output_path = "templates/gtk-4.0/gtk.css";
            };
        };
    };    

    home.configFile = {
        "gtk-4.0/gtk.css".source = "${config.programs.matugen.theme.files}/.config/gtk-4.0/gtk.css";
    };
}
