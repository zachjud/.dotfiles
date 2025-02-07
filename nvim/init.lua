-- Plugins --
require('plugins')

-- Remaps --
require('remaps')

-- Filetype Detection --
require('ftdetect')

-- Colorscheme --
vim.cmd.colorscheme('tokyonight-night')
vim.g.terminal_color_0 = vim.g.terminal_color_8 -- Fix too dark black

-- Options --

-- Clipboard --
vim.opt.clipboard = "unnamedplus"

-- View --
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'both'
vim.opt.signcolumn = 'yes'
vim.opt.conceallevel = 2

-- Indentation --
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Undo --
vim.opt.undodir = os.getenv("HOME") .. '/.nvim/undodir'
vim.opt.undofile = true

-- Search --
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = 'a'

vim.opt.fillchars = { eob = ' ' } -- Remove EOF characters
