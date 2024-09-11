local wk = require('which-key')

vim.g.mapleader = " "

wk.register({['jj'] = {'<esc>', 'Escape Insert Mode'}}, {mode='i'})

wk.register({
  g = {
    name = "LSP Go to",
    D = {vim.lsp.buf.declaration(), 'Go to Declaration'},
    d = {vim.lsp.buf.definition(), 'Go to Definition'},
    r = {vim.lsp.buf.references(), 'Go to References'},
    i = {vim.lsp.buf.implementation(), 'Go to Implementation'},
    t = {vim.lsp.buf.implementation(), 'Go to Type Definition'},
  }
})

wk.register({['<leader><Tab>'] = {'<cmd>Neotree toggle<cr>', 'Open File Tree'}})

wk.register({
  f = {
    name = "Telescope Find",
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    s = { "<cmd>Telescope live_grep<cr>", "Find File by String" },
    b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help Tags"},
    g = { "<cmd>Telescope git_files<cr>", "Find Git Project Files"},
    o = { "<cmd>Telescope oldfiles<cr>", "Find Previously Open Files"},
    c = { "<cmd>Telescope commands<cr>", "Find & Run Commands"},
    m = { "<cmd>Telescope man_pages<cr>", "Find Man Pages"},
    p = { "<cmd>Telescope search_history<cr>", "Find & Re-run Previous Search"},
    x = { "<cmd>Telescope marks<cr>", "Find Marks"},
    q = { "<cmd>Telescope quick_fix<cr>", "Find Quickfixes"},
    v = { "<cmd>Telescope vim_options<cr>", "Find and Set Vim Options"},
    r = { "<cmd>Telescope registers<cr>", "Find and Paste Vim Registers"},
  },
}, { prefix = "<leader>" })

wk.register({
  t = {
    name = "Tab Operations",
    a = {"<cmd>tabnew <cr>", "Create New Tab"},
    c = {"<cmd>tabclose <cr>", "Close Current Tab"},
    n = {"<cmd>tabn <cr>", "Switch to Next Tab"},
    p = {"<cmd>tabp <cr>", "Switch to Previous Tab"},
    m = {
      name = "Move Operations",
      p = {"<cmd>-tabmove<cr>", "Move Tab to Previous Position"},
      n = {"<cmd>+tabmove<cr>", "Move Tab to Next Position"},
    }
  },
}, { prefix = "<leader>" })
