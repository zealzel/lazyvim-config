return {
  "sindrets/diffview.nvim",
  enabled = true,
  vim.keymap.set("n", "<leader>D", ":DiffviewOpen <CR>", { desc = "DiffviewOpen" }),
  vim.keymap.set(
    "n",
    "<leader>C",
    "<cmd>set hidden<cr><cmd>DiffviewClose<cr><cmd>set nohidden<cr>",
    { desc = "DiffviewClose" }
  ),
  vim.keymap.set("n", "<leader>F", ":DiffviewFileHistory %<CR>", { desc = "DiffviewFileHistory" }),
}
