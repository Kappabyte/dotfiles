{ lib, ... }: {
    options = {
        properties.wayland-sessions = { 
            session-list = lib.mkOption {
                type = lib.types.listOf lib.types.package;
                default = [];
                description = ''
                    List of packages providing wayland sessions
                '';
            };
        };
    };
}
