local map = vim.api.nvim_set_keymap
local opt = { noremap = true }
local sopt = { noremap = true, silent = true }
local sopte = { noremap = true, silent = true, expr = true }
local pluginKeys = {}

if vim.g.vscode then
  -- map("n", "gd", "<cmd>call VSCodeNotify('editor.action.revealDefinitionAside')<CR>", sopt)
  -- map("n", "K", "<cmd>call VSCodeNotify('editor.action.peekDefinition')<CR>", sopt)
  -- map("n", "gn", "<cmd>require('vscode').call('editor.action.marker.next')<CR>", sopt)
  -- map("n", "gp", "<cmd>require('vscode).call('editor.action.marker.prev')<CR>", sopt)

  -- map("n", "gs", "<cmd>require('vscode').call('editor.action.quickFix')<CR>", sopt)
  -- map("n", "gD", "<cmd>require('vscode').call('editor.action.goToImplementation')<CR>", sopt)
  -- map("n", "gb", "<cmd>require('vscode).action('workbench.action.navigateBack')<CR>", sopt)
  -- map("n", "gf", "<cmd>require('vscode).call('workbench.action.navigateForward')<CR>", sopt)
  -- map("n", "gs", "<cmd>call VSCodeNotify('problems.action.showQuickFixes')<CR>", sopt)
  --
  map("n", "gb", "<cmd>lua require('vscode').call('workbench.action.navigateBack')<CR>", sopt)
  map("n", "gf", "<cmd>lua require('vscode').call('workbench.action.navigateForward')<CR>", sopt)
  map("n", "gD", "<cmd>lua require('vscode').call('editor.action.goToImplementation')<CR>", sopt)
  map("n", "gs", "<cmd>lua require('vscode').call('editor.action.quickFix')<CR>", sopt)
else
  -- format
  map('n', '<S-A-f>', '<Cmd>lua vim.lsp.buf.format { async = true }<CR>', opt)
  -- map('n', '<S-A-f>', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opt)
  map('i', '<S-A-f>', '<Cmd>lua vim.lsp.buf.format { async = true }<CR>', opt)
  -- map('i', '<S-A-f>', '<Esc><Cmd>lua vim.lsp.buf.formatting()<CR>', opt)
  -- map('n', '<S-A-f>', ':py3f /home/sirius/clang-format.py<CR>', sopt)
  -- map('i', '<S-A-f>', '<Esc><cmd>py3f /home/sirius/clang-format.py<CR>', sopt)

  -- others
  -- map('i', '<C-l>', '<Esc>lcl', opt)
  map('i', '<C-l>', '<Del>', opt)

  -- bufferline
  map("n", "[b", ":BufferLineCycleNext<CR>", sopt)
  map("n", "]b", ":BufferLineCyclePrev<CR>", sopt)
  map("n", "<leader>bc", ":bdelete %<CR>", sopt)
  map("n", "<leader>bp", ":BufferLinePickClose<CR>", sopt)
  map("n", "<leader>bo", ":BufferLineCloseLeft<CR>:BufferLineCloseRight<CR>", sopt)

  -- terminal
  map("t", "<C-w>", "<C-\\><C-n>:q<CR>", sopt)


  -- debug
  map("n", "<F9>",
    "<cmd>lua require'dap'.toggle_breakpoint(); require'coding-settings.dap-util'.store_breakpoints(true)<cr>", opt)
  -- map("n", "<F9>", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", opt)
  map("n", "<S-F5>", "<cmd>lua require'coding-settings'.run_last()<cr>", opt)
  map('n', '<C-F5>', '<cmd>lua require"coding-settings.dap-util".reload_continue()<CR>', opt)
  map("n", "<F6>", "<cmd>lua require'dap'.terminate()<cr>", opt)
  map("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opt)
  map("n", "<F10>", "<cmd>lua require'dap'.step_over()<cr>", opt)
  map("n", "<F11>", "<cmd>lua require'dap'.step_into()<cr>", opt)
  map("n", "<C-F11>", "<cmd>lua require'dap'.step_out()<cr>", opt)
  -- map("n", "K", "<cmd>lua require'dapui'.eval()<cr>", opt)
  map("n", "<leader>dc", "<cmd>lua require'dapui'.toggle()<cr>", opt)

  -- build and run
  map("n", "<F7>", "<cmd>BtBuildDefault<cr><cr>", opt)
  map('n', '<leader>rr', ':RunCode<CR>', sopt)
  map('n', '<leader>rf', ':RunFile<CR>', sopt)
  map('n', '<leader>rp', ':RunProject<CR>', sopt)
  map('n', '<leader>rc', ':RunClose<CR>', sopt)
  -- map("n", "<F7>", "<cmd>BtBuildDefault<CR><CR><cmd>q<CR><CR><cmd>RunCode<CR>", opt)

  -- snip and cmp
  -- press <Tab> to expand or jump in a snippet. These can also be mapped separately
  -- via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
  map('i', "<Tab>", "luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'", sopte)
  -- -1 for jumping backwards.
  map('i', "<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<Cr>", sopt)

  map('s', " <Tab>", "<cmd>lua require('luasnip').jump(1)<Cr>", sopt)
  map('s', " <S-Tab>", "<cmd>lua require('luasnip').jump(-1)<Cr>", sopt)
  -- For changing choices in choiceNodes (not strictly necessary for a basic setup).
  map('i', "<C-E>", "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'", sopte)
  map('s', "<C-E>", "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'", sopte)

  -- float terminal =
  map("n", "<C-A-t>", "<cmd>Lspsaga term_toggle<CR>", sopt)
  map("t", "<C-A-t>", "<C-\\><C-n><cmd>Lspsaga term_toggle<CR>", sopt)

  -- outline
  map("n", "<leader>ol", "<cmd>LSoutlineToggle<CR>", sopt)

  -- lsp 回调函数快捷键设置
  -- rename
  -- map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
  map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", sopt)
  map("n", "<F2>", "<cmd>Lspsaga rename<CR>", sopt)
  -- signature_help
  map("n", "gs", "<Cmd>Lspsaga signature_help<CR>", sopt)
  -- code action
  -- map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
  map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", sopt)
  map("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", sopt)
  -- jump and show diagnostic
  map("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", sopt)
  map("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", sopt)
  map("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", sopt)
  map("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", sopt)
  -- lsp finder
  -- or use command LspSagaFinder
  map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", sopt)
  -- go xx
  -- map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
  -- or use command
  map("n", "gd", "<cmd>Lspsaga peek_definition<CR>", sopt)
  -- hover doc
  map("n", "K", "<cmd>Lspsaga hover_doc<CR>", sopt)

  -- map('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
  map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
  map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
  -- diagnostic
  map('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
  map('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
  map('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
  -- map('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
  -- map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)

  -- nvim-cmp 自动补全
  -- pluginKeys.cmp = function(cmp)
  --   return {
  --     -- 上一个
  --     ['<S-tab>'] = cmp.mapping.select_prev_item(),
  --     -- 下一个
  --     ['<tab>'] = cmp.mapping.select_next_item(),
  --     -- 出现补全
  --     ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
  --     -- 取消
  --     ['<A-,>'] = cmp.mapping({
  --       i = cmp.mapping.abort(),
  --       c = cmp.mapping.close(),
  --     }),
  --     -- 确认
  --     -- Accept currently selected item. If none selected, `select` first item.
  --     -- Set `select` to `false` to only confirm explicitly selected items.
  --     ['<CR>'] = cmp.mapping.confirm({
  --       select = true ,
  --       behavior = cmp.ConfirmBehavior.Replace
  --     }),
  --     -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
  --     ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
  --     ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  --   }
  -- end
end
