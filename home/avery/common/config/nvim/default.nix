{ lib, inputs, pkgs, user, home-manager, ... }: {
    programs.neovim = {
        enable = true;
        vimAlias = true;
        vimdiffAlias = true;
        defaultEditor = true;

        plugins = with pkgs.vimPlugins; [
            telescope-nvim
            catppuccin-nvim
            nvim-treesitter.withAllGrammars
            undotree
            nvim-cmp
            luasnip
            nvim-gps
            winbar-nvim
            feline-nvim
            nvim-web-devicons
            nvim-tree-lua
            cmp-nvim-lsp
            nvim-lspconfig
            lsp-zero-nvim
        ];

        extraLuaConfig = ''
        require("avery")
        '';
    };

    xdg.configFile."nvim/lua/avery" = {
        source = ./config;
        recursive = true;
    };

    home.packages = with pkgs; [
        ripgrep
        nodePackages.typescript-language-server
        rnix-lsp
    ];
}