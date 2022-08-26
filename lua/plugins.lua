-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Configurations for Nvim LSP
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use { "glepnir/lspsaga.nvim", branch = "main" }


  -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-emoji'
  use 'hrsh7th/cmp-calc'
  use 'rcarriga/cmp-dap'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-nvim-lsp-document-symbol'
  use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
  use { 'jalvesaq/Nvim-R', branch = 'stable' }

  -- build and run
  use {
    'Arjun31415/BuildTask.nvim',
    requires = "rcarriga/nvim-notify"
  }
  use { 'CRAG666/code_runner.nvim', requires = 'nvim-lua/plenary.nvim' }


  -- basic
  use 'nvim-lua/popup.nvim'


  -- Snippets source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'

  --To enable more of the features of lsp
  use 'simrat39/rust-tools.nvim'
  use 'p00f/clangd_extensions.nvim'
  use {
    event = { "BufRead Cargo.toml" },
    'saecki/crates.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }
  use 'onsails/lspkind.nvim'

  -- file-explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons', -- optional, for file icons

  }

  -- highlight and treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'p00f/nvim-ts-rainbow'
  use {
    'm-demare/hlargs.nvim',
    requires = 'nvim-treesitter/nvim-treesitter'
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'


  -- tools
  use 'lukas-reineke/indent-blankline.nvim'
  use {
    "jiaoshijie/undotree",
    requires = "nvim-lua/plenary.nvim",
  }
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  }
  use 'folke/trouble.nvim'
  use 'RRethy/vim-illuminate'
  use 'norcalli/nvim-colorizer.lua'




  -- function zone
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons', opt = true,
    }
  }
  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
  }
  use 'simrat39/symbols-outline.nvim' -- A tree like view for symbols


  -- comments
  -- use 'b3nj5m1n/kommentary'
  -- use "terrortylor/nvim-comment"
  use 'numToStr/Comment.nvim'

  -- background
  use { "ellisonleao/gruvbox.nvim" }

  -- auto pairs
  use 'windwp/nvim-autopairs'

  -- debug
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  use 'theHamsta/nvim-dap-virtual-text'



  -- find and jump
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim'
  } -- fuzzy finder
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'nvim-telescope/telescope-ui-select.nvim' }
  use 'windwp/nvim-spectre' -- replace
  use { 'kevinhwang91/nvim-hlslens' } -- better glance at matched information
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
  }


  -- git
  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }
  use {
    'lewis6991/gitsigns.nvim',
  }




  -- which-key
  use 'folke/which-key.nvim'


end)
