require('nvim_comment').setup(
{
  -- Linters prefer comment and line to have a space in between markers
  marker_padding = true,
  -- should comment out empty or whitespace only lines
  comment_empty = true,
  -- trim empty comment whitespace
  comment_empty_trim_whitespace = true,
  -- Should key mappings be created
  create_mappings = true,
  -- Normal mode mapping left hand side
  line_mapping = "gcc",
  -- Visual/Operator mapping left hand side
  operator_mapping = "gc",
  -- text object mapping, comment chunk,,
  comment_chunk_text_object = "ic",
  -- Hook function to call before commenting takes place
  hook = nil
}
)
vim.api.nvim_set_keymap('n', '<C-_>', ':CommentToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('v', '<C-_>', ':CommentToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-_>', '<Esc>:CommentToggle<CR>', {noremap = true})
