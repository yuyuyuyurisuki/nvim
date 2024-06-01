-- leader
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"
-- 样式
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- 使用增强状态栏后不再需要 vim 的模式提示
vim.o.showmode = false
-- 高亮所在行
vim.wo.cursorline = true
-- 右侧参考线，超过表示代码太长了，考虑换行
-- vim.wo.colorcolumn = "80"
-- vim.o.expandtab = true
vim.o.shiftround = true
-- >> << 时移动长度
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
-- 边输入边搜索
vim.o.incsearch = true
-- 命令行高为4，提供足够的显示空间
vim.o.cmdheight = 4
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true
-- 禁止折行
vim.o.wrap = false
vim.wo.wrap = false
-- 行结尾可以跳到下一行
vim.o.whichwrap = 'b,s,<,>,[,],h,l'
-- 允许隐藏被修改过的buffer
vim.o.hidden = true
-- 鼠标支持
vim.o.mouse = "a"
-- smaller updatetime
vim.o.updatetime = 300
-- 等待mappings
vim.o.timeoutlen = 100
-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true

-- 不可见字符的显示，这里只把空格显示为一个点
vim.o.list = true
vim.o.listchars = "space:·"
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.pumheight = 10
-- always show tabline
vim.o.showtabline = 4
vim.opt.shell = "/bin/fish"
-- 搜索要高亮
vim.o.hlsearch = true

-- vim.g.mapleader = ';'
-- vim.g.maplocalleader = ';'
-- let neovim use system clipboard
vim.opt.clipboard = "unnamedplus"

vim.cmd([[
    augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
augroup END

]])

if not vim.g.vscode then
    -- 使用相对行号
    vim.wo.number = true
    vim.wo.relativenumber = true
    -- 缩进4个空格等于一个Tab
    vim.o.tabstop = 4
    vim.bo.tabstop = 4
    vim.o.softtabstop = 4
    vim.bo.softtabstop = 4
    -- 补全增强
    vim.o.wildmenu = true
    -- 自动补全不自动选中
    vim.g.completeopt = "menu,menuone,noselect,noinsert"
    -- 显示左侧图标指示列
    vim.wo.signcolumn = "yes"
end
