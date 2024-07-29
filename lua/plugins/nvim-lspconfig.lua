return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- opts.ui.windows.border = "single"
    require("lspconfig.ui.windows").default_options.border = "rounded"
    opts.diagnostics = {
      float = { border = "rounded" },
    }
  end,
}
