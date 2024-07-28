return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
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
    opts.setup.clangd = function(_, opts)
      opts.capabilities.offsetEncoding = { "utf-16" }
    end
  end,
}
