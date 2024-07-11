-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local unmap = vim.keymap.del

unmap("n", "<S-h>", { desc = "Previous buffer" })
unmap("n", "<S-l>", { desc = "Next buffer" })
map("n", "<tab>", ":bnext<cr>", { desc = "Next buffer", silent = true })
map("n", "<s-tab>", ":bprevious<cr>", { desc = "Previous buffer", silent = true })
-- map("n", "<leader>c", "<leader>bd", { desc = "Delete Buffer", remap = true, silent = true })

map("n", "<C-q>", ":q<cr>", { desc = "quit current window", silent = true })

-- Replace a word with yanked text without changing the default register
map("v", "p", 'p:let @"=@0<CR>', { desc = "paste", remap = true, silent = true })

map("n", "Z", "za", { desc = "toggle fold" })

map("n", "<C-g>", ":vertical :Git <CR>", { desc = "fugitive Git", silent = true })

map("n", "<C-n>", ":Neotree toggle<cr>", { desc = "Neotree toggle", silent = true })

map("n", "<C-\\>", ":ToggleTerm<cr>", { desc = "toggleterm", silent = true })
map("n", "<leader>ts", ":ToggleTermSendCurrentLine<cr>", { desc = "ToggleTermSendCurrentLine" })
map("v", "<leader>ts", ":ToggleTermSendVisualLines<cr>", { desc = ":ToggleTermSendVisualLines<cr>" })

-- whichkeys
local wk = require("which-key")
local mappings = {
  S = { ":SessionSave<cr>:lua print('session saved')<cr>", "Save Session" },
  g = {
    name = "Git",
    -- g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle(12000)<cr>", "Lazygit" },
    -- Fugitive
    l = { ":Git blame<cr>", "Blame" },
    -- c = { ":Git commit<cr>", "Commit" },
    ca = { ":Git commit --amend<cr>", "Commit amend" },
    -- p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    P = { ":Git push<cr>", "Push" },
    p = { ":Git pull<cr>", "pull" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
    d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
    n = { ":!git checkout -b ", "Checkout New Branch" },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    f = { "<cmd>Telescope git_bcommits<cr>", "Checkout buffer commit" },
  },
  c = {
    n = { ":NullLsInfo<cr>", "NullLs Info" },
    j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Dianostic" },
    k = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Previous Dianostic" },
  },
}
local opts = { prefix = "<leader>" }
wk.register(mappings, opts)

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  -- vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
