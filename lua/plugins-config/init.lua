require('plugins-config.nvim-hlslens')
require('plugins-config.hop')
if not vim.g.vscode then
    -- explorer
    require('plugins-config.nvim-tree')
    require('plugins-config.nvim-tree-on-attach')

    -- highlight and nvim-treesitter
    require('plugins-config.nvim-treesitter')
    require('plugins-config.nvim-treesitter-context')
    require('plugins-config.hlargs')
    require('plugins-config.nvim-treesitter-textobjects')


    -- tools
    require('plugins-config.indent-blankline')
    require('plugins-config.undotree')
    require('plugins-config.todo-comments')
    require('plugins-config.trouble')
    require('plugins-config.vim-illuminate')
    require('plugins-config.nvim-colorizer')
    require('plugins-config.notify')

    -- function zone
    require('plugins-config.bufferline') -- bufferline
    require('plugins-config.lualine')    -- lualine
    -- require('plugin-config.symbols.outline') -- symbols



    -- comment
    -- require('plugin-config.nvim-comment')
    require('plugins-config.comment')


    -- find and replace
    require('plugins-config.nvim-telescope')
    require('plugins-config.nvim-sepctre')


    -- which-keys
    require('plugins-config.which-key')

    -- pairs
    require('plugins-config.nvim-autopairs')

    -- git
    -- require('plugin-config.diffview')
    require('plugins-config.gitsigns')
end
