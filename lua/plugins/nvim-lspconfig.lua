return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- opts.ui.windows.border = "single"
    require("lspconfig.ui.windows").default_options.border = "rounded"
    opts.diagnostics = {
      float = { border = "rounded" },
    }
    -- python lsp: basedpyright
    -- opts.servers.basedpyright = {
    --   settings = {
    --     basedpyright = {
    --       analysis = { typeCheckingMode = "off" },
    --     },
    --   },
    -- }
    -- c/c++ lsp: clangd
    -- opts.setup.clangd = function(_, opts)
    --   opts.capabilities.offsetEncoding = { "utf-16" }
    -- end
  end,
}
