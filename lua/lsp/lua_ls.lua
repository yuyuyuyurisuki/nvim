local utils = require('utils')
require 'lspconfig'.lua_ls.setup {

  -- on_attach = my_custom_on_attach,
  on_attach = utils.on_attach,
  root_dir = utils.root_dir,
  capabilities = utils.capabilities,
  flags = {
    -- default in neovim 0.7+
    debounce_text_changes = 150,
  },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- library = {
        -- [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        -- [vim.fn.stdpath("config") .. "/lua"] = true,
        -- },
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
