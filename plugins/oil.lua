return {
  "stevearc/oil.nvim",
  config = function()
    require("oil").setup({})
  end,
  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
  -- press ctrl+c to exit oil mode
  opts = {},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
