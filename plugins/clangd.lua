return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.setup.clangd = function(_, opts)
        opts.capabilities.offsetEncoding = { "utf-16" }
      end
    end,
  },
}
