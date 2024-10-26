-- Add additional capabilities supported by nvim-cmp
-- vim.opt.completeopt = { "menu", "menuone", "noselect" }
local lspconfig = require('lspconfig')
local utils = require('utils')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'rust_analyzer', 'pyright', 'denols', 'bashls', 'cmake', 'jsonls', 'sqlls', 'vimls', 'gopls', 'clangd' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    on_attach = utils.on_attach,
    root_dir = utils.root_dir,
    capabilities = utils.capabilities,
    flags = {
      -- default in neovim 0.7+
      debounce_text_changes = 150,
    },
    inlay_hints = {
      enabled = true
    }
  }
end
