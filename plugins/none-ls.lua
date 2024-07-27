return {
  -- "nvimtools/none-ls.nvim",
  -- optional = true,
  -- config = function()
  --   local nls = require("null-ls")
  --   nls.setup({
  --     sources = {
  --       nls.builtins.formatting.black,
  --       nls.builtins.formatting.stylua,
  --       nls.builtins.formatting.shfmt,
  --       -- nls.builtins.diagnostics.mypy,
  --       -- nls.builtins.completion.spell,
  --     },
  --   })
  -- end,
  -- opts = { border = "rounded" },
  --
  "nvimtools/none-ls.nvim",
  optional = true,
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.sources = opts.sources or {}
    -- table.insert(opts.sources, nls.builtins.formatting.prettier) -- prettier extra plugin
    -- table.insert(opts.sources, nls.builtins.formatting.black) -- black extra plugin
    -- table.insert(opts.sources, nls.builtins.formatting.cmake_format)

    opts.sources = vim.list_extend(opts.sources, {
      -- nls.builtins.formatting.prettier,
      nls.builtins.formatting.cmake_format.with({
        extra_args = { "--line-width", "80", "--tab-size", "2", "--dangle-parens", "true", "--min-prefix-chars", "12" },
      }),
    })
  end,
}
