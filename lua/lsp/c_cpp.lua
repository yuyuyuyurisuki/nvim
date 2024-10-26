local utils = require('utils')
require("clangd_extensions").setup {
  server = {
    -- options to pass to nvim-lspconfig
    -- i.e. the arguments to require("lspconfig").clangd.setup({})
    require 'lspconfig'.clangd.setup {
      on_attach = utils.on_attach,
      root_dir = utils.root_dir,
      capabilities = utils.capabilities,
      flags = {
        -- default in neovim 0.7+
        debounce_text_changes = 150,
      },
      cmd = {
        "clangd",
        "--background-index",
        "--compile-commands-dir=build",
        "-j=12",
        "--all-scopes-completion",
        "--completion-style=detailed",
        "--pch-storage=memory",
        "--cross-file-rename",
        "--enable-config",
        "--fallback-style=WebKit",
        "--pretty",
        "--clang-tidy",
        "--clang-tidy-checks=performance-*,bugprone-",
        "--header-insertion=iwyu"
      },
      filetypes = { "c", "cpp" },
    }
  },
  extensions = {
    -- defaults:
    -- Automatically set inlay hints (type hints)
    autoSetHints = true,
    -- These apply to the default ClangdSetInlayHints command
    inlay_hints = {
      inline = vim.fn.has("nvim-0.10") == 1,
      -- Only show inlay hints for the current line
      only_current_line = false,
      -- Event which triggers a refersh of the inlay hints.
      -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
      -- not that this may cause  higher CPU usage.
      -- This option is only respected when only_current_line and
      -- autoSetHints both are true.
      only_current_line_autocmd = "CursorHold",
      -- whether to show parameter hints with the inlay hints or not
      show_parameter_hints = true,
      -- prefix for parameter hints
      parameter_hints_prefix = "<- ",
      -- prefix for all the other hints (type, chaining)
      other_hints_prefix = "=> ",
      -- whether to align to the length of the longest line in the file
      max_len_align = false,
      -- padding from the left if max_len_align is true
      max_len_align_padding = 1,
      -- whether to align to the extreme right or not
      right_align = false,
      -- padding from the right if right_align is true
      right_align_padding = 7,
      -- The color of the hints
      highlight = "Comment",
      -- The highlight group priority for extmark
      priority = 100,
    },
    ast = {
      role_icons = {
        type = "",
        declaration = "",
        expression = "",
        specifier = "",
        statement = "",
        ["template argument"] = "",
      },

      kind_icons = {
        Compound = "",
        Recovery = "",
        TranslationUnit = "",
        PackExpansion = "",
        TemplateTypeParm = "",
        TemplateTemplateParm = "",
        TemplateParamObject = "",
      },

      highlights = {
        detail = "Comment",
      },
      memory_usage = {
        border = "none",
      },
      symbol_info = {
        border = "none",
      },
    },
  }
}

require("clangd_extensions.inlay_hints").setup_autocmd()
require("clangd_extensions.inlay_hints").set_inlay_hints()

-- require("clangd_extensions.inlay_hints").toggle_inlay_hints()
