-- Plugins --
require('plugins')

-- Remaps --
require('remaps')

-- Colorscheme
vim.cmd.colorscheme('tokyonight-night')

-- Options --

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- View
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'both'
vim.opt.signcolumn = 'yes'
vim.opt.conceallevel = 2

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Undo
vim.opt.undodir = os.getenv("HOME") .. '/.nvim/undodir'
vim.opt.undofile = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = 'a'

-- Remove EOF characters
vim.opt.fillchars = { eob = ' ' }
