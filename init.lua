-- complment
-- require('lsp')

-- coding
-- require('coding-settings')

-- keybings
require('keybindings')

-- utils
-- require('utils')

-- basic settings
require('basic')

-- packer plugins

require('plugins')

-- plugin-config
require('plugin-config')
if vim.g.vscode then

else
    -- theme
    require('theme.gruvbox')
end
