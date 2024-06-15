{pkgs, config, ...}: {
    home.sessionVariables = {
        EDITOR = "nvim";
    };

    programs.nixvim = {
	    enable = true;
	    globals = {
	        mapleader = " ";
	    };
	    options = {
	        number = true;
            nu = true;
            relativenumber = true;
            tabstop = 4;
            softtabstop = 4;
            shiftwidth = 4;
            expandtab = true;
            smartindent = true;
            wrap = false;
            swapfile = false;
            backup = false;
            undodir = "${config.home.homeDirectory}/.local/data/vim/undo";
            undofile = true;
            termguicolors = true;
            hlsearch = false;
            incsearch = true;
            scrolloff = 8;
            updatetime = 50;
	    };
        plugins = {
            lualine = {
                enable = true;
                globalstatus = true;
                componentSeparators = {
                    left = "";
                    right = "";
                };
                sectionSeparators = {
                    left = "";
                    right = "";
                };
                sections = {
                    lualine_a = ["mode"];
                    lualine_b = ["branch" "diff"];
                    lualine_c = ["filename"];
                    lualine_x = ["require(\"noice\").api.statusline.mode.get()"];
                    lualine_y = ["filetype"];
                    lualine_z = ["location"];
                };
                winbar = {
                    lualine_a = [];
                    lualine_b = [];
                    lualine_c = ["filename"];
                    lualine_x = [];
                    lualine_y = [];
                    lualine_z = [];
                };
                inactiveWinbar = {
                    lualine_a = [];
                    lualine_b = [];
                    lualine_c = ["filename"];
                    lualine_x = [];
                    lualine_y = [];
                    lualine_z = [];
                };
            };
            telescope = {
                enable = true;
                keymaps = {
                    "<leader>pf" = "find_files";
                    "<leader>gf" = "git_files";
                    "<leader>ps" = "live_grep";
                };
            };
            neo-tree = {
                enable = true;
            };
            treesitter = {
                enable = true;
            };
            lsp = {
                enable = true;
                servers = {
                    java-language-server.enable = true;
                    html.enable = true;
                    jsonls.enable = true;
                    nixd.enable = true;
                    bashls.enable = false;
                    cssls.enable = true;
                    rust-analyzer = {
                        enable = true;
                        installRustc = true;
                        installCargo = true;
                    };
                    tsserver.enable = true;
                    ccls.enable = true;
                };
            };
            cmp = {
                enable = true;
                settings = {
                    snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
                    completion.completeopt = "noselect";
                    preselect = "None";
                    mapping = {
                        "<C-d>" = "cmp.mapping.scroll_docs(-4)";
                        "<C-f>" = "cmp.mapping.scroll_docs(4)";
                        "<C-Space>" = "cmp.mapping.complete()";
                        "<C-e>" = "cmp.mapping.abort()";
                        "<CR>" = "cmp.mapping.confirm({ select = true })";
                        "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
                        "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
                    };
                    sources = [
                        {name = "nvim_lsp";}
                        {name = "path";}
                        {name = "buffer";}
                    ];
                };
            };
            neogit = {
                enable = true;
                kind = "floating";
            };
            noice = {
                enable = true;
            };
        };
        extraPlugins = with pkgs.vimPlugins; [
            octo-nvim
            onedark-nvim
        ];
        extraConfigLua = ''
            require"octo".setup()
            require('onedark').setup {
                transparent = true,
                lualine = {
                    transparent = true;
                }
            }

            require('onedark').load()
        '';
        keymaps = [
            {
                key = "<C-b>";
                action = ":Neotree filesystem reveal toggle left<CR>";
            }
        ];
    };

    home.packages = with pkgs; [
        ripgrep
    ];
    
    #programs.nixvim = {
    #    extraConfigLua = ''
    #        -- Print a little welcome message when nvim is opened!
    #        print("Hello world!")
    #    '';
    #};
}
