-- local extension_path = vim.env.HOME .. '/.vscode-server/extensions/vadimcn.vscode-lldb-1.7.0/'
local extension_path =  '/home/sirius/vadimcn.vscode-lldb-1.6.10/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'
local opts = {
  tools = {
    executor = require("rust-tools/executors").termopen,
    on_initialized = nil,
    reload_workspace_from_cargo_toml = true,
    inlay_hints = {
      only_current_line = false,
      only_current_line_autocmd = "CursorHold",
      show_parameter_hints = true,
      show_variable_name = false,
      parameter_hints_prefix = "<- ",
      other_hints_prefix = "=> ",
      max_len_align = false,
      max_len_align_padding = 1,
      right_align = false,
      right_align_padding = 7,
      highlight = "Comment",
    },
    hover_actions = {
      border = {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
      },
      auto_focus = false,
    },
    crate_graph = {
      backend = "x11",
      output = nil,
      full = true,
      enabled_graphviz_backends = {
        "bmp",
        "cgimage",
        "canon",
        "dot",
        "gv",
        "xdot",
        "xdot1.2",
        "xdot1.4",
        "eps",
        "exr",
        "fig",
        "gd",
        "gd2",
        "gif",
        "gtk",
        "ico",
        "cmap",
        "ismap",
        "imap",
        "cmapx",
        "imap_np",
        "cmapx_np",
        "jpg",
        "jpeg",
        "jpe",
        "jp2",
        "json",
        "json0",
        "dot_json",
        "xdot_json",
        "pdf",
        "pic",
        "pct",
        "pict",
        "plain",
        "plain-ext",
        "png",
        "pov",
        "ps",
        "ps2",
        "psd",
        "sgi",
        "svg",
        "svgz",
        "tga",
        "tiff",
        "tif",
        "tk",
        "vml",
        "vmlz",
        "wbmp",
        "webp",
        "xlib",
        "x11",
      },
    },
  },

  server = {
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy"
        },
      },
    },
    -- standalone = true,
  },

  -- debugging stuff
  dap = {
    adapter = require('rust-tools.dap').get_codelldb_adapter(
    codelldb_path, liblldb_path)
  },
}

require('rust-tools').setup(opts)

-- Commands:
-- RustEnableInlayHints
-- RustDisableInlayHints
-- RustSetInlayHints
-- RustUnsetInlayHints

-- Enable inlay hints auto update and set them for all the buffers
require('rust-tools').inlay_hints.enable()

-- Command:
-- RustRunnables
require('rust-tools').runnables.runnables()

-- Command:
-- RustExpandMacro  
require'rust-tools'.expand_macro.expand_macro()

-- Command:
-- RustMoveItemUp    
-- RustMoveItemDown    
require'rust-tools'.move_item.move_item(true)

-- Command:
-- RustHoverActions 
require'rust-tools'.hover_actions.hover_actions()

-- Command:
-- RustHoverRange 
require'rust-tools'.hover_range.hover_range()

-- Command:
-- RustOpenCargo
require'rust-tools'.open_cargo_toml.open_cargo_toml()

-- Command:
-- RustParentModule 
require'rust-tools'.parent_module.parent_module()

-- Command:
-- RustJoinLines  
require'rust-tools'.join_lines.join_lines()
