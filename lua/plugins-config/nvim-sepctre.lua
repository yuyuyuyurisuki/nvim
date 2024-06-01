
local map = vim.api.nvim_set_keymap
local opt = {noremap = true}
require('spectre').setup()

map("n", "<leader>S", "<cmd>lua require('spectre').open()<CR>", opt)

-- search current word
map("n", "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", opt)
map("v", "<leader>s","<esc>:lua require('spectre').open_visual()<CR>", opt)
--  search in current file
map("n", "<leader>sp", "viw:lua require('spectre').open_file_search()<cr>", opt)
-- run command :Spectre
