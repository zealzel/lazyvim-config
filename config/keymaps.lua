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
map("v", "p", 'P:let @"=@0<CR>', { desc = "paste", remap = true, silent = true })

map("n", "Z", "za", { desc = "toggle fold" })

-- map("n", "<C-g>", ":vertical :Git <CR>", { desc = "fugitive Git", silent = true })
map("n", "<C-g>", ":Neogit <CR>", { desc = "Neogit status", silent = true })

map("n", "<C-n>", ":Neotree toggle<cr>", { desc = "Neotree toggle", silent = true })

-- unmap("n", "<C-/>", { desc = "Lazyterm" })
-- map("n", "<C-\\>", ":ToggleTerm<cr>", { desc = "toggleterm", silent = true })
map("n", "<C-t>", ":ToggleTerm<cr>", { desc = "toggleterm", silent = true })
map("n", "<leader>ts", ":ToggleTermSendCurrentLine<cr>", { desc = "ToggleTermSendCurrentLine" })
map("v", "<leader>ts", ":ToggleTermSendVisualLines<cr>", { desc = ":ToggleTermSendVisualLines<cr>" })
-- map("v", "<leader>ts", ":ToggleTermSendVisualSelection<cr>", { desc = ":ToggleTermSendVisualSelection<cr>" })

map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- press ctrl+c to exit oil mode

map("n", "<leader>D", ":DiffviewOpen <CR>", { desc = "DiffviewOpen" })
map("n", "<leader>C", "<cmd>set hidden<cr><cmd>DiffviewClose<cr><cmd>set nohidden<cr>", { desc = "DiffviewClose" })

-- map("n", "<leader>F", ":DiffviewFileHistory <CR>", { desc = "DiffviewFileHistory" }) -- <tab> next commit, <s-tab> previous commit
-- conflict-with-noice issue: fixed keymaps as below. Ref:https://github.com/sindrets/diffview.nvim/issues/302
map("n", "<leader>F", ":DiffviewFileHistory %<CR>", { desc = "DiffviewFileHistory" }) -- <tab> next commit, <s-tab> previous commit

-- add thie mapping again even it exists in layzvim
map("n", "<leader>cl", "<cmd>LspInfo<cr>", { desc = "Lsp Info" })

map("n", "<leader>cN", "<cmd>ConformInfo<cr>", { desc = "Conform Info" })

map("n", "<leader>LE", "<cmd>LazyExtras<cr>", { desc = "Conform Info" })

-- whichkeys
local wk = require("which-key")
local mappings = {
  -- Fugitive
  -- { "<leader>gl", ":Git blame<cr>", desc = "Blame" },
  -- { "<leader>gca", ":Git commit --amend<cr>", desc = "Commit amend" },
  -- { "<leader>gP", ":Git push<cr>", desc = "Push" },
  -- { "<leader>gp", ":Git pull<cr>", desc = "pull" },
  --
  { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
  { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk" },
  { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk" },
  { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
  { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
  { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
  { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },
  { "<leader>gn", ":!git checkout -b ", desc = "Checkout New Branch" },
  -- { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
  -- { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
  -- { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
  -- { "<leader>gf", "<cmd>Telescope git_bcommits<cr>", desc = "Checkout buffer commit" },
  --
  { "<leader>cn", ":NullLsInfo<cr>", desc = "NullLs Info" },
  { "<leader>cj", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next Dianostic" },
  { "<leader>ck", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Previous Dianostic" },
}

local opts = { prefix = "<leader>" }
-- wk.register(mappings, opts)
wk.add(mappings, opts)

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-t>", [[<C-\><C-n><Cmd>ToggleTermToggleAll<CR>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
