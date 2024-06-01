-- basic settings
require('basic')

-- keybings
require('keybindings')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

-- lazynvim plugins
require('plugins-config')

if not vim.g.vscode then
  -- utils
  require('utils')
  -- complment
  require('lsp')

  -- coding
  require('coding-settings')
  -- theme
  require('theme.gruvbox')
end
