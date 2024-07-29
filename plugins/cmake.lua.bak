return {
  -- {
  --   "stevearc/conform.nvim",
  --   opts = function(_, opts)
  --     opts.formatters_by_ft["cmake"] = { "cmake_format" }
  --   end,
  -- },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      -- opts.sources = opts.sources or {}
      table.insert(opts.sources, nls.builtins.formatting.cmake_format)
      opts.sources = vim.list_extend(opts.sources, {
        nls.builtins.formatting.cmake_format.with({
          extra_args = {
            "--line-width",
            "80",
            "--tab-size",
            "2",
            "--dangle-parens",
            "true",
            "--min-prefix-chars",
            "12",
          },
        }),
      })
    end,
  },
}
