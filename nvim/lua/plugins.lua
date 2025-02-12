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
  -- Neo Tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  },
  -- Telescope
  {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'debugloop/telescope-undo.nvim'
    }
  },
  -- Telescope fzf
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
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
  -- -- Obsidian
  -- {
  --   "epwalsh/obsidian.nvim",
  --   version = "*",  -- recommended, use latest release instead of latest commit
  --   lazy = true,
  --   event = {
  --     'BufReadPre ' .. vim.fn.expand('~/Documents/Obsidian/**.md'),
  --     'BufNewFile ' .. vim.fn.expand('~/Documents/Obsidian/**.md'),
  --   },
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  -- },
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
  -- Gitsigns
  {
    'lewis6991/gitsigns.nvim'
  },
  -- Kitty-Scrollback
  {
    'mikesmithgh/kitty-scrollback.nvim',
    enabled = true,
    lazy = true,
    cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
    event = { 'User KittyScrollbackLaunch' },
  },
})

-- Configuration Lspconfig
require("mason").setup()
require("mason-lspconfig").setup()
require("plugins.lspconfig")

-- Neo Tree
require("neo-tree").setup()

-- Treesitter
require("plugins.treesitter")

-- Completion
require("plugins.cmp")

-- Obsidian
-- require('obsidian').setup({
--   note_id_func = function(title)
--     return title
--   end,
--   dir = "~/Documents/Obsidian"
-- })

-- Noice
require("plugins.noice")

-- Tabby
require("plugins.tabby")

-- Trouble
require("trouble").setup()

-- Gitsigns
require("gitsigns").setup()

-- Kitty-Scrollback
require('kitty-scrollback').setup()

-- Lualine
require("plugins.lualine")

-- Telescope
require('plugins.telescope')
