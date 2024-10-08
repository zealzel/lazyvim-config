local map = vim.keymap.set
local unmap = vim.keymap.del

unmap("n", "<S-h>", { desc = "Previous buffer" })
unmap("n", "<S-l>", { desc = "Next buffer" })
map("n", "<tab>", ":bnext<cr>", { desc = "Next buffer", silent = true })
map("n", "<s-tab>", ":bprevious<cr>", { desc = "Previous buffer", silent = true })

map("n", "<C-q>", ":q<cr>", { desc = "quit current window", silent = true })
map("v", "p", 'P:let @"=@0<CR>', { desc = "paste", remap = true, silent = true })

map("n", "Z", "za", { desc = "toggle fold" })
map("n", "<C-g>", ":Neogit <CR>", { desc = "Neogit status", silent = true })
map("n", "<C-n>", ":Neotree toggle<cr>", { desc = "Neotree toggle", silent = true })

-- unmap("n", "<C-/>", { desc = "Lazyterm" })

-- add thie mapping again even it exists in layzvim
map("n", "<leader>cl", "<cmd>LspInfo<cr>", { desc = "Lsp Info" })
map("n", "<leader>cE", "<cmd>LazyExtras<cr>", { desc = "LazyExtras" })
map("n", "<leader>cN", "<cmd>ConformInfo<cr>", { desc = "Conform Info" })
map("n", "<leader>cL", "<cmd>ListLinters<cr>", { desc = "List linters attached to this buffer" })

map("n", "<leader>bF", ":!open $(realpath $(dirname %))<cr>", { desc = "Open in Finder", silent = true })

map(
  "n",
  "<leader>fh",
  "<cmd>lua require'telescope.builtin'.find_files({hidden=true, no_ignore=true})<cr>",
  -- "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
  { desc = "Find Files (including hidden)" }
)

-- whichkeys
local wk = require("which-key")
local mappings = {
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
  -- if you want to move between terminal & buffer, use <esc> + <C-k>
  --
  -- vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  -- vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  -- vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  -- vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  -- vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- noerg
-- remappings, ref: https://github.com/nvim-neorg/neorg/wiki/User-Keybinds
-- vim.keymap.set("n", "\\f", "<Plug>(neorg.pivot.list.toggle)", {})
vim.keymap.set("n", "\\tt", ":Neorg toggle-concealer<cr>", {})
vim.keymap.set("n", "\\g", "<Plug>(neorg.looking-glass.magnify-code-block)", {})

local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

-- vim way: ; goes to the direction you were moving.
-- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
-- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })

-- ====================================================
-- nvim-ros2
-- ref: https://github.com/ErickKramer/nvim-ros2
-- ====================================================
vim.keymap.set("n", "<leader>ri", ":Telescope ros2 interfaces<CR>", { desc = "[ROS 2]: List interfaces" })
vim.keymap.set("n", "<leader>rn", ":Telescope ros2 nodes<CR>", { desc = "[ROS 2]: List nodes" })
vim.keymap.set("n", "<leader>ra", ":Telescope ros2 actions<CR>", { desc = "[ROS 2]: List actions" })
vim.keymap.set("n", "<leader>rt", ":Telescope ros2 topics_info<CR>", { desc = "[ROS 2]: List topics" })
vim.keymap.set("n", "<leader>rs", ":Telescope ros2 services<CR>", { desc = "[ROS 2]: List services" })

-- ====================================================
-- ROS 2 related commands
-- ref: https://github.com/ErickKramer/ros2-with-neovim/blob/humble/.config/nvim/init.lua
-- ====================================================
-- if you want compile_commands.json to work, you need to use clang/clang++ to replace gcc/g++
-- ref: https://www.reddit.com/r/ROS/comments/15yr1zm/ros_c_coding_setup/
vim.api.nvim_command([[
  command! ColconBuild :! CC=clang CXX=clang++ colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
]])
vim.api.nvim_command([[
  command! -nargs=1 ColconBuildSingle :! CC=clang CXX=clang++ colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=ON --packages-up-to <args>
]])
vim.api.nvim_command([[
  command! ColconBuildDebug :! CC=clang CXX=clang++ colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Debug
]])
vim.api.nvim_command([[
  command! -nargs=1 ColconBuildDebugSingle :! CC=clang CXX=clang++ colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Debug --packages-up-to <args>
]])

-- Test
vim.api.nvim_command([[
  command! ColconTest :! colcon test
]])
vim.api.nvim_command([[
  command! -nargs=1 ColconTestSingle :! colcon test --packages-select <args>
]])
vim.api.nvim_command([[
  command! ColconTestResult :! colcon test-result --all
]])
