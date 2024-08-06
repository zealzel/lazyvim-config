return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = true,
  vim.keymap.set("n", "<C-t>", ":ToggleTerm<cr>", { desc = "toggleterm", silent = true }),
  vim.keymap.set("n", "<leader>ts", ":ToggleTermSendCurrentLine<cr>", { desc = "ToggleTermSendCurrentLine" }),
  vim.keymap.set("v", "<leader>ts", ":ToggleTermSendVisualLines<cr>", { desc = ":ToggleTermSendVisualLines<cr>" }),
  -- vim.keymap.set("v", "<leader>ts", ":ToggleTermSendVisualSelection<cr>", { desc = ":ToggleTermSendVisualSelection<cr>" }),
}
