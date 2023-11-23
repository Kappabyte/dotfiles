{ lib, inputs, pkgs, user, home-manager, ... }: {
    programs.neovim = {
        enable = true;
        vimAlias = true;
        vimdiffAlias = true;
        defaultEditor = true;

        plugins = with pkgs.vimPlugins; [
            telescope-nvim
            onedark-nvim
            nvim-treesitter.withAllGrammars
            undotree
            nvim-cmp
            luasnip
            nvim-gps
            lualine-nvim
            nvim-web-devicons
            nvim-tree-lua
            cmp-nvim-lsp
            nvim-lspconfig
            lsp-zero-nvim
            vim-be-good
            nvim-jdtls
        ];

        extraLuaConfig = ''
        require("avery")
        '';
    };

    xdg.configFile."nvim/lua/avery" = {
        source = ./config;
        recursive = true;
    };

    xdg.configFile."nvim/lua/avery/plugins/jdtls.lua".text = ''
    local config = {
        cmd = {
            'jdt-language-server',
            '-data', os.getenv("HOME") .. '/.cache/jdtls' .. os.getenv("PWD"),
            '-configuration', '${pkgs.jdt-language-server}/share/config'
        },
        root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
        settings = {
            java = {}
        },
        init_options = {
            bundles = {}
        },
    }
    
    require('jdtls').start_or_attach(config)
    '';

    home.packages = with pkgs; [
        ripgrep
        nodePackages.typescript-language-server
        rust-analyzer
        rnix-lsp
        jdt-language-server
    ];
}
