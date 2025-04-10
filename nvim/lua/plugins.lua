-- Lazy.nvim Plugin Manager Bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin List
require("lazy").setup({
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  -- LSP
  {
    "neovim/nvim-lspconfig"
  },
  -- Mason
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  },
 -- Completion
  {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp"
  },
  -- Tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
  },
  -- Snippets
  {
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip'
  },
  -- Which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  -- Dropbar
  {
    'Bekaboo/dropbar.nvim',
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim'
    }
  },
  -- Autopairs
  {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      config = true
  },
  -- Lualine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  -- Tabby
  {
    'nanozuki/tabby.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  -- Noice
  {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    }
  },
  -- Trouble
  {
    "folke/trouble.nvim",
  cmd = "Trouble",
  },
  -- Snacks
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    rename = { enabled = true },
    },
  },
  -- Gitsigns
  {
    'lewis6991/gitsigns.nvim'
  },
})

-- Configuration Lspconfig
require("plugins.lspconfig")

-- Treesitter
require("plugins.treesitter")

-- Completion
require("plugins.cmp")

-- Noice
require("plugins.noice")

-- Tabby
require("plugins.tabby")

-- Trouble
require("trouble").setup()

-- Gitsigns
require("gitsigns").setup()

-- Lualine
require("plugins.lualine")
