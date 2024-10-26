-- -- basic settings
require('basic')

-- -- keybings
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

-- -- lazynvim plugins
require('plugins-config')

if not vim.g.vscode then
  -- utils
  require('utils')
  -- complment
  require('lsp')

--   -- coding
  require('coding-settings')
--   -- theme
  require('theme.gruvbox')
end

-- local map = vim.api.nvim_set_keymap
-- local opt = { noremap = true }
-- local sopt = { noremap = true, silent = true }
-- local sopte = { noremap = true, silent = true, expr = true }
-- local pluginKeys = {}

-- vim.api.nvim_set_keymap("n", "gb", "<cmd>lua require('vscode').call('workbench.action.navigateBack')<CR>", sopt)



-- vim.api.nvim_create_autocmd("User", {
--   pattern = "LazyVimKeymapsDefaults",
--   callback = function()
--     -- vim.keymap.set("n", "<leader><space>", "<cmd>Find<cr>")
--     -- vim.keymap.set("n", "<leader>/", [[<cmd>lua require('vscode').action('workbench.action.findInFiles')<cr>]])
--     -- vim.keymap.set("n", "<leader>ss", [[<cmd>lua require('vscode').action('workbench.action.gotoSymbol')<cr>]])

--     vim.keymap.set("n", "gb", [[<cmd>lua require('vscode').action('workbench.action.navigateBack')<cr>]])
--   end,
-- })