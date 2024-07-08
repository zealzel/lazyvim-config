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
-- map("v", "p", '""p:let @"=@0<CR>', { desc = "paste", remap = true, silent = true })

map("n", "Z", "za", { desc = "toggle fold" })

map("n", "<C-g>", ":vertical :Git <CR>", { desc = "fugitive Git", silent = true })

map("n", "<C-n>", ":Neotree toggle<cr>", { desc = "Neotree toggle", silent = true })

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
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
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
