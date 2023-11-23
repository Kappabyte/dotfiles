{nixvim, ...}: {
    imports = [
        nixvim.homeManagerModules.nixvim
    ];
    
    programs.nixvim = {
        extraConfigLua = ''
            -- Print a little welcome message when nvim is opened!
            print("Hello world!")
        '';
    };
}
