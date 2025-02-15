local wk = require('which-key')

vim.g.mapleader = " "

wk.add({
  {"jj", "<esc>", desc = "Escape Insert Mode", mode = "i"},
  {"<leader><Tab>", "<cmd>Neotree toggle<cr>", desc = "Toggle File Tree"},
  {"gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = 'Go to Declaration'},
  {"gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = 'Go to Definition'},
  {"gr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = 'Go to References'},
  {"gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = 'Go to Implementation'},
  { "<leader>f", group = "Telescope Find" },
  { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffer" },
  { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Find & Run Commands" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
  { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find Git Project Files" },
  { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find Help Tags" },
  { "<leader>fm", "<cmd>Telescope man_pages<cr>", desc = "Find Man Pages" },
  { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Find Previously Open Files" },
  { "<leader>fp", "<cmd>Telescope search_history<cr>", desc = "Find & Re-run Previous Search" },
  { "<leader>fq", "<cmd>Telescope quick_fix<cr>", desc = "Find Quickfixes" },
  { "<leader>fr", "<cmd>Telescope registers<cr>", desc = "Find and Paste Vim Registers" },
  { "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find File by String" },
  { "<leader>fv", "<cmd>Telescope vim_options<cr>", desc = "Find and Set Vim Options" },
  { "<leader>fx", "<cmd>Telescope marks<cr>", desc = "Find Marks" },
  { "<leader>t", group = "Tab Operations" },
  { "<leader>ta", "<cmd>tabnew <cr>", desc = "Create New Tab" },
  { "<leader>tc", "<cmd>tabclose <cr>", desc = "Close Current Tab" },
  { "<leader>tm", group = "Move Operations" },
  { "<leader>tmn", "<cmd>+tabmove<cr>", desc = "Move Tab to Next Position" },
  { "<leader>tmp", "<cmd>-tabmove<cr>", desc = "Move Tab to Previous Position" },
  { "<leader>tn", "<cmd>tabn <cr>", desc = "Switch to Next Tab" },
  { "<leader>tp", "<cmd>tabp <cr>", desc = "Switch to Previous Tab" },
})
