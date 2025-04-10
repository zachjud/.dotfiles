local wk = require('which-key')

vim.g.mapleader = " "

wk.add({
  {"jj", "<esc>", desc = "Escape Insert Mode", mode = "i"},
  {"<leader><Tab>", "<cmd>lua Snacks.explorer()<cr>", desc = "Toggle File Tree"},
  {"gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = 'Go to Declaration'},
  {"gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = 'Go to Definition'},
  {"gr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = 'Go to References'},
  {"gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = 'Go to Implementation'},
  { "<leader>f", group = "Find with picker" },
  { "<leader>fb", "<cmd>lua Snacks.picker.buffers()<cr>", desc = "Find Buffer" },
  { "<leader>fc", "<cmd>lua Snacks.picker.commands()<cr>", desc = "Find & Run Commands" },
  { "<leader>fd", "<cmd>lua Snacks.picker.diagnostics()<cr>", desc = "Find LSP diagnostics" },
  { "<leader>ff", "<cmd>lua Snacks.picker.files()<cr>", desc = "Find File" },
  { "<leader>fg", "<cmd>lua Snacks.picker.git_files()<cr>", desc = "Find Git Project Files" },
  { "<leader>fh", "<cmd>lua Snacks.picker.help_tags()<cr>", desc = "Find Help Tags" },
  { "<leader>fm", "<cmd>Telescope man()<cr>", desc = "Find Man Pages" },
  { "<leader>fp", "<cmd>lua Snacks.picker()<cr>", desc = "Find Picker" },
  { "<leader>fq", "<cmd>lua Snacks.picker.qflist()<cr>", desc = "Find Quickfixes" },
  { "<leader>fr", "<cmd>lua Snacks.picker.registers()<cr>", desc = "Find and Paste Vim Registers" },
  { "<leader>fs", "<cmd>lua Snacks.picker.grep()<cr>", desc = "Find File by String" },
  { "<leader>fx", "<cmd>lua Snacks.picker.marks()<cr>", desc = "Find Marks" },
  { "<leader>t", group = "Tab Operations" },
  { "<leader>ta", "<cmd>tabnew <cr>", desc = "Create New Tab" },
  { "<leader>tc", "<cmd>tabclose <cr>", desc = "Close Current Tab" },
  { "<leader>tm", group = "Move Operations" },
  { "<leader>tmn", "<cmd>+tabmove<cr>", desc = "Move Tab to Next Position" },
  { "<leader>tmp", "<cmd>-tabmove<cr>", desc = "Move Tab to Previous Position" },
  { "<leader>tn", "<cmd>tabn <cr>", desc = "Switch to Next Tab" },
  { "<leader>tp", "<cmd>tabp <cr>", desc = "Switch to Previous Tab" },
})
