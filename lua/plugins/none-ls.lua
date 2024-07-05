return {
  "nvimtools/none-ls.nvim",
  optional = true,
  config = function()
    local nls = require("null-ls")
    nls.setup({
      sources = {
        nls.builtins.formatting.black,
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.shfmt,
        nls.builtins.diagnostics.mypy,
        -- nls.builtins.completion.spell,
      },
    })
  end,
  opts = { border = "rounded" },
}
