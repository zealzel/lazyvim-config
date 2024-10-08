return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    require("lspconfig.ui.windows").default_options.border = "rounded"
    opts.diagnostics = {
      float = { border = "rounded" },
    }
  end,
}
