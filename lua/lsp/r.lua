require 'lspconfig'.r_language_server.setup {}

vim.cmd([[
let R_app = 'radian'
let R_cmd = 'R'
let R_args = ['--no-save', '--no-restore']
let R_editing_mode = "vi"
let R_objbr_place = 'RIGHT'
]])

-- local R_app = "radian"
-- local R_cmd = "R"
-- local R_hl_term = 0
-- local R_args = []
-- local R_brecketed_paste = 1
