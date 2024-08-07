return {
  "mfussenegger/nvim-lint",
  -- https://github.com/mfussenegger/nvim-lint
  -- event = {
  --   "BufReadPre",
  --   "BufNewFile",
  -- },
  opts = function(_, opts)
    local linting = require("lint")
    opts.linters_by_ft = opts.linters_by_ft or {}
    -- opts.linters_by_ft = {
    -- json = { "jsonlint" },
    -- }
    -- local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    -- vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    --   group = lint_augroup,
    --   callback = function()
    --     lint.try_lint()
    --   end,
    -- })
    --
    vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
      callback = function()
        linting.try_lint()
      end,
    })
    vim.api.nvim_create_user_command("ListLinters", function()
      linting.try_lint()
      local linters = linting.get_running()
      if #linters == 0 then
        print("no linters")
      else
        print(table.concat(linters, ", "))
      end
    end, {})
    -- vim.keymap.set("n", "<leader>ll", "<cmd>ListLinters<cr>", { desc = "List linters attached to this buffer" })
  end,
}
