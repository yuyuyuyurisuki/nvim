local not_vscode = not vim.g.vscode
return {
    -- {"folke/lazy.nvim"},
    {
        'phaazon/hop.nvim',
        branch = 'v2'
    },

    -- Configurations for Nvim LSP
    {
        'neovim/nvim-lspconfig',
        cond = not_vscode
    },
    {
        'jose-elias-alvarez/null-ls.nvim', -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
        cond = not_vscode
    },
    {
        "nvimdev/lspsaga.nvim",
        cond = not_vscode
    },
    -- Autocompletion plugin
    {
        'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
        cond = not_vscode
    },
    {
        'hrsh7th/nvim-cmp',
        cond = not_vscode
    },
    {
        'hrsh7th/cmp-nvim-lua',
        cond = not_vscode
    },
    {
        'hrsh7th/cmp-buffer',
        cond = not_vscode
    },
    {
        'hrsh7th/cmp-cmdline',
        cond = not_vscode
    },
    {
        'hrsh7th/cmp-path',
        cond = not_vscode
    },
    {
        'hrsh7th/cmp-emoji',
        cond = not_vscode
    },
    {
        'hrsh7th/cmp-calc',
        cond = not_vscode
    },
    {
        'rcarriga/cmp-dap',
        cond = not_vscode
    },
    {
        'hrsh7th/cmp-nvim-lsp-signature-help',
        cond = not_vscode
    },
    {
        'hrsh7th/cmp-nvim-lsp-document-symbol',
        cond = not_vscode
    },
    --  { 'tzachar/cmp-tabnine', run = './install.sh', dependeces = 'hrsh7th/nvim-cmp' },
    --  { 'jalvesaq/Nvim-R', branch = 'stable' },

    -- build and run
    {
        'Arjun31415/BuildTask.nvim',
        dependencies = "rcarriga/nvim-notify",
        cond = not_vscode
    },
    {
        'CRAG666/code_runner.nvim',
        dependeces = 'nvim-lua/plenary.nvim',
        cond = not_vscode
    },


    -- basic
    {
        'nvim-lua/popup.nvim',
        cond = not_vscode
    },


    -- Snippets source for nvim-cmp
    {
        'saadparwaiz1/cmp_luasnip',
        cond = not_vscode
    },
    {
        'L3MON4D3/LuaSnip',
        version = "v2.*",
        cond = not_vscode
    },

    --To enable more of the features of lsp
    {
        'simrat39/rust-tools.nvim',
        cond = not_vscode
    },
    {
        'p00f/clangd_extensions.nvim',
        cond = not_vscode
    },
    {
        event = "BufRead Cargo.toml",
        'saecki/crates.nvim',
        tag = 'stable',
        dependeces = 'nvim-lua/plenary.nvim',
        cond = not_vscode
    },
    {
        'onsails/lspkind.nvim',
        cond = not_vscode
    },

    -- file-explorer
    {
        'kyazdani42/nvim-tree.lua',
        dependeces = 'kyazdani42/nvim-web-devicons', -- optional, for file icons
        cond = not_vscode

    },

    -- highlight and treesitter


    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })()
        end,
        cond = not_vscode
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        cond = not_vscode
    },
    {
        'p00f/nvim-ts-rainbow',
        cond = not_vscode
    },
    {
        'm-demare/hlargs.nvim',
        dependeces = 'nvim-treesitter/nvim-treesitter',
        cond = not_vscode
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        cond = not_vscode
    },


    -- tools
    {
        'lukas-reineke/indent-blankline.nvim',
        main = "ibl",
        cond = not_vscode
    },
    {
        "jiaoshijie/undotree",
        dependeces = "nvim-lua/plenary.nvim",
        cond = not_vscode
    },
    {
        "folke/todo-comments.nvim",
        dependeces = "nvim-lua/plenary.nvim",
        cond = not_vscode
    },
    {
        'folke/trouble.nvim',
        cond = not_vscode
    },
    {
        'RRethy/vim-illuminate',
        cond = not_vscode
    },
    {
        'norcalli/nvim-colorizer.lua',
        cond = not_vscode
    },




    -- function zone
    {
        'nvim-lualine/lualine.nvim',
        dependeces = {
            'kyazdani42/nvim-web-devicons', opt = true,
        },

        cond = not_vscode
    },
    {
        'akinsho/bufferline.nvim',
        verison = "*",
        dependeces = 'kyazdani42/nvim-web-devicons',
        cond = not_vscode
    },
    {
        'simrat39/symbols-outline.nvim', -- A tree like view for symbols,
        cond = not_vscode
    },


    -- comments
    --  'b3nj5m1n/kommentary'
    --  "terrortylor/nvim-comment"
    {
        'numToStr/Comment.nvim',
        cond = not_vscode
    },

    -- background
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = true,
        opts = ...,
        cond = not_vscode
    },

    -- auto pairs
    {
        'windwp/nvim-autopairs',
        cond = not_vscode
    },

    -- debug
    {
        'mfussenegger/nvim-dap',
        cond = not_vscode
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        cond = not_vscode
    },
    {
        'theHamsta/nvim-dap-virtual-text',
        cond = not_vscode
    },



    -- find and jump
    {
        'nvim-telescope/telescope.nvim',
        dependeces = 'nvim-lua/plenary.nvim',
        cond = not_vscode
    }, -- fuzzy finder
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        cond = not_vscode
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        cond = not_vscode
    },
    {
        'windwp/nvim-spectre', -- replace,
        cond = not_vscode
    },
    {
        'kevinhwang91/nvim-hlslens',
        -- cond = not_vscode
    }, -- better glance at matched information


    -- git
    --  {
    -- 'sindrets/diffview.nvim',
    -- dependeces = 'nvim-lua/plenary.nvim'
    -- },
    {
        'lewis6991/gitsigns.nvim',
        cond = not_vscode
    },
    -- which-key
    {
        'folke/which-key.nvim',
        cond = not_vscode
    },
    {
        'nvim-lua/plenary.nvim',
        lazy = true
    },
    {
       'lewis6991/hover.nvim',
       lazy = true
    }
}
